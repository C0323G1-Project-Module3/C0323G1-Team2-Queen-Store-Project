package com.example.queen_store.controller.order;


import com.example.queen_store.model.account.Account;
import com.example.queen_store.model.product.Product;
import com.example.queen_store.model.voucher.Voucher;
import com.example.queen_store.repository.order.Cart;
import com.example.queen_store.repository.order.CustomerOrders;
import com.example.queen_store.service.customer.CustomerService;
import com.example.queen_store.service.customer.ICustomerService;
import com.example.queen_store.service.order.IOrderService;
import com.example.queen_store.service.order.OderService;
import com.example.queen_store.service.product.IProductService;
import com.example.queen_store.service.product.ProductService;
import com.example.queen_store.service.voucher.IVoucherService;
import com.example.queen_store.service.voucher.VoucherService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet(name = "OrderServlet", value = "/order")
public class OrderServlet extends HttpServlet {
    private static IOrderService orderService = new OderService();
    private static IProductService productService = new ProductService();
    private static IVoucherService voucherService = new VoucherService();
    private static ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteOrder(request, response);
                break;
            case "findVoucherByName":
                findVoucherByName(request, response);
                break;
            case "addToCart":
                addToCart(request, response);
                break;
            case "cart":
                showCart(request, response);
                break;
            case "checkOut":
                checkOut(request, response);
            default:
//                checkOut(request, response);
                showListOrder(request, response);
                break;
        }
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        orderService.deleteOrder(id);
        try {
            response.sendRedirect("/order");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void checkOut(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        System.out.println(userName);
        if (userName != null && !userName.equals("")) {
            int userId = customerService.getUserIdByUserName(userName);
            Integer voucherId = null;
            if (!request.getParameter("voucherId").isEmpty()) {
                voucherId = Integer.parseInt(request.getParameter("voucherId"));
            }
            LocalDate curDate = LocalDate.now();
            String date = curDate.toString();
            int idOrder = orderService.addOrder(date, userId, voucherId);
            orderService.addOrderDetail(Cart.getItems(), idOrder);
            Cart.removeAll();


            try {
                request.getRequestDispatcher("/ProductServlet").forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {

                request.setAttribute("msg","Vui lòng đăng nhập trước khi thanh toán");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("account/login.jsp");
                requestDispatcher.forward(request,response);
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }

    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Product product = productService.searchById(id);
        Cart.addItem(product, quantity);
        request.setAttribute("totalQuantity", Cart.totalQuantity);
        try {
            response.sendRedirect("/ProductServlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void findVoucherByName(HttpServletRequest request, HttpServletResponse response) {
        String voucherName = request.getParameter("voucherName");
        String userName = request.getParameter("userName");
        request.setAttribute("userName", userName);

        RequestDispatcher dispatcher;
        HttpSession session = request.getSession();
        if (voucherName.trim().equals("")) {
            request.setAttribute("rate", 0);
            request.setAttribute("list", Cart.getItems());
            if (!session.isNew()) {
                Account account = (Account) session.getAttribute("account");
                request.setAttribute("account", account);
            }
            dispatcher = request.getRequestDispatcher("order/order_detail.jsp");
        } else {
            Voucher voucher = voucherService.getByNane(voucherName);
            if (voucher != null) {
                request.setAttribute("voucher", voucher);
                request.setAttribute("list", Cart.getItems());
                dispatcher = request.getRequestDispatcher("order/order_detail.jsp");
            } else {
                request.setAttribute("msg", "Voucher này không có");
                request.setAttribute("voucherName", voucherName);
                dispatcher = request.getRequestDispatcher("order/cart.jsp");
            }
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void showCart(HttpServletRequest request, HttpServletResponse response) {
        Map<Product, Integer> list = Cart.getItems();
        request.setAttribute("list", list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("order/cart.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static void showListOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<CustomerOrders> list = orderService.getAll();
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/order/list_order.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
