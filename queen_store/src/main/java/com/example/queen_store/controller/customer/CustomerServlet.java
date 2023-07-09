package com.example.queen_store.controller.customer;

import com.example.queen_store.model.customer.Customer;
import com.example.queen_store.service.customer.CustomerService;
import com.example.queen_store.service.customer.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateForm(request, response);
//                   response.sendRedirect("customer/create.jsp");
                case "edit":
                    showEditForm(request, response);
                case "delete":
                    showDeleteForm(request, response);
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.selectCustomer(id);
        System.out.println(customer);
        RequestDispatcher requestDispatcher;
        request.setAttribute("customerList", customer);
        requestDispatcher = request.getRequestDispatcher("customer/delete.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.selectCustomer(id);
        System.out.println(customer);
        request.setAttribute("customer", customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/list.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(request, response);
                    break;
                case "update":
                    updateUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.removeUser(id);
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("user_id"));
        String name = request.getParameter("user_name");

        Date dateOfBirth = Date.valueOf(request.getParameter("user_dob"));
        boolean gender = request.getParameter("user_gender").equals("nam");
        String userIdCard = request.getParameter("user_id_card");
        String phoneNumber = request.getParameter("user_phone_number");
        String email = request.getParameter("user_mail");
        String address = request.getParameter("user_address");
//        int typeOfCustomerId = Integer.parseInt(request.getParameter("type_of_customer_id"));
//        String accountUserName = request.getParameter("account_user_name");
        Customer customer = new Customer(id, name, dateOfBirth, gender, userIdCard, phoneNumber, email, address);
        customerService.updateUser(customer);
        response.sendRedirect("/CustomerServlet");

    }

//    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        int id = Integer.parseInt(request.getParameter("user_id"));
//        String name = request.getParameter("user_name");
//        Date dateOfBirth = Date.valueOf((request.getParameter("user_dob")));
//        boolean gender = request.getParameter("user_gender").equals("nam");
//        String userIdCard = request.getParameter("user_id_card");
//        String phoneNumber = request.getParameter("user_phone_number");
//        String email = request.getParameter("user_mail");
//        String address = request.getParameter("user_address");
//        int typeOfCustomerId = Integer.parseInt(request.getParameter("type_of_customer_id"));
//        String accountUserName = request.getParameter("account_user_name");
//        Customer customer = new Customer(name, dateOfBirth, gender, userIdCard, phoneNumber, email, address, typeOfCustomerId, accountUserName);
//        customerService.insertUser(customer);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/create.jsp");
//        requestDispatcher.forward(request, response);
//    }
    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("user_id"));
        String name = request.getParameter("user_name");
        Date dateOfBirth = Date.valueOf((request.getParameter("user_dob")));
        boolean gender = request.getParameter("user_gender").equals("nam");
        String userIdCard = request.getParameter("user_id_card");
        String phoneNumber = request.getParameter("user_phone_number");
        String email = request.getParameter("user_mail");
        String address = request.getParameter("user_address");
        int typeOfCustomerId = Integer.parseInt(request.getParameter("type_of_customer_id"));
        String accountUserName = request.getParameter("account_user_name");
        Customer customer = new Customer(name, dateOfBirth, gender, userIdCard, phoneNumber, email, address, typeOfCustomerId, accountUserName);
        Map<String,String> errMap  = this.customerService.save(customer);
//        customerService.insertUser(customer);
        if (errMap.isEmpty()){
            response.sendRedirect("CustomerServlet");
        }else {
            request.setAttribute("customer",customer);
            request.setAttribute("error",errMap);
            try{
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/create.jsp");
                requestDispatcher.forward(request, response);
            }catch (ServletException e){
                throw new RuntimeException(e);
            }
        }



    }
}
