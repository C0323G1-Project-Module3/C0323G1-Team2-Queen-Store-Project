package com.example.queen_store.controller.account;

import com.example.queen_store.common.account.ValidateAccount;
import com.example.queen_store.model.account.Account;
import com.example.queen_store.model.customer.Customer;
import com.example.queen_store.service.account.AccountService;
import com.example.queen_store.service.account.IAccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AccountServlet", value = "/accountServlet")
public class AccountServlet extends HttpServlet {

    private static IAccountService accountService = new AccountService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                showLoginForm(request, response);
                break;
            case "logout":
                logoutAccount(request, response);
                break;
            case "create":
                showCreateUserForm(request, response);
                break;
            case "userList":
                displayUserList(request, response);
                break;
            case "deleteAccount":
                showDeleteAccountForm(request, response);
                break;
            case "register":
                showRegisterForm(request,response);
                break;
            default:
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/home.jsp");
                requestDispatcher.forward(request, response);
        }

    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("/account/edit.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void displayUserList(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        RequestDispatcher requestDispatcher;
        if (!session.isNew()) {
            Account account = (Account) session.getAttribute("account");
            if (account.getRoleName().equals("admin")) {
                List<Account> accountList = accountService.getAllUser();
                if (accountList != null) {
                    request.setAttribute("accountList", accountList);
                } else {
                    request.setAttribute("msg", "Không có tài khoản nào ở trong danh sách");
                }
                requestDispatcher = request.getRequestDispatcher("/account/list_user.jsp");

            } else {
                request.setAttribute("msg", "Xin lỗi, bạn không có quyền vào mục này!");
                requestDispatcher = request.getRequestDispatcher("/home.jsp");
            }
        } else {
            requestDispatcher = request.getRequestDispatcher("/home.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateUserForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("/account/create_user.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("account/login.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void logoutAccount(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        if (session != null) {
            session.invalidate();
        }
        try {
            response.sendRedirect("/home.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                loginAccount(request, response);
                break;
            case "createUser":
                createUser(request, response);
                break;
            case "deleteUser":
                deleteUser(request, response);
                break;
            case "editUser":
                editPassword(request,response);
                break;

        }
    }

    private void editPassword(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        System.out.println(userName);
        String oldPassword = request.getParameter("oldPassword");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        Map<String,String> errMap = accountService.checkValidatePassword(oldPassword,password,confirmPassword);
        if(errMap.isEmpty()){
            errMap = accountService.editUser(userName,oldPassword,password,confirmPassword);
        }
        request.setAttribute("errMap",errMap);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/account/edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        boolean rowDelete = accountService.deleteUser(userName);
        RequestDispatcher requestDispatcher;

        if (rowDelete) {
            request.setAttribute("msg", "Đã xoá tài khoản " + userName);
            requestDispatcher = request.getRequestDispatcher("/account/list_user.jsp");
        } else {
            request.setAttribute("msg", "Lỗi");
            requestDispatcher = request.getRequestDispatcher("/account/delete.jsp");
        }

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showDeleteAccountForm(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        Account account = accountService.findByUserName(userName);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("account/delete.jsp");
        if (account != null) {
            Customer user = accountService.findCustomerByUserName(userName);
            if (user != null) {
                String typeOfCustomer = accountService.findTypeOfCustomer(user);
                request.setAttribute("typeOfCustomer", typeOfCustomer.toUpperCase());
                request.setAttribute("gender", user.isGender() ? "Nam" : "Nữ");
                request.setAttribute("dOB", user.getDob().toString());
                request.setAttribute("account", account);
                request.setAttribute("user", user);
            } else {
                request.setAttribute("account", account);
                request.setAttribute("msg", "Tài khoản này chưa có thông tin gì!");
            }
        } else {
            request.setAttribute("account", account);
            request.setAttribute("msg", "Lỗi");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        Map<String, String> errMap = accountService.checkValidateAccount(userName,password,confirmPassword);

        RequestDispatcher requestDispatcher;

        if (errMap.isEmpty()) {
            boolean rowUpdate;
            String msgSigin = "";
            if (!accountService.checkUserName(userName)) {
                if (password.equals(confirmPassword)) {
                    rowUpdate = accountService.addUser(new Account(userName, password, "user"));
                    if (rowUpdate) {
                        msgSigin = "Đã đăng kí thành công, hãy đăng nhập!";
                        requestDispatcher = request.getRequestDispatcher("/account/login.jsp");
                    } else {
                        msgSigin = "Đăng kí thất bại, vui lòng thử lại!";
                        requestDispatcher = request.getRequestDispatcher("/account/create_user.jsp");
                    }
                } else {
                    request.setAttribute("msg", "Mật khẩu không khớp,vui lòng nhập lại!");
                    requestDispatcher = request.getRequestDispatcher("/account/create_user.jsp");
                }

            } else {
                msgSigin = "Tên tài khoản trùng lặp, vui lòng chọn tên khác!";
                requestDispatcher = request.getRequestDispatcher("/account/create_user.jsp");
            }
            request.setAttribute("msgSigin", msgSigin);
        } else {
            request.setAttribute("userName", userName);
            request.setAttribute("password", password);
            request.setAttribute("confirmPassword", confirmPassword);
            request.setAttribute("errMap", errMap);
            requestDispatcher = request.getRequestDispatcher("/account/create_user.jsp");
        }

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void loginAccount(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        Map<String, String> errMap = accountService.checkValidateLogin(userName, password);
        System.out.println(rememberMe);
        if (errMap.isEmpty()) {
            Account account = accountService.login(userName, password);
            if (account != null) {
                HttpSession session = request.getSession();
                session.setAttribute("account", account);
                Cookie userNameCookie = new Cookie("userName", userName);
                Cookie passwordCookie = new Cookie("password", password);
                Cookie rememberMeCookie = new Cookie("rememberMe", rememberMe);
                if (rememberMe != null) {
                    userNameCookie.setMaxAge(60 * 60 * 24 * 30);
                    passwordCookie.setMaxAge(60 * 60 * 24 * 30);
                    rememberMeCookie.setMaxAge(60 * 60 * 24 * 30);
                }
                response.addCookie(userNameCookie);
                response.addCookie(passwordCookie);
                response.addCookie(rememberMeCookie);
                try {
                    response.sendRedirect("/home.jsp");
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            } else {
                request.setAttribute("msg", "user");
            }
        } else {
            request.setAttribute("errMap", errMap);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("account/login.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}