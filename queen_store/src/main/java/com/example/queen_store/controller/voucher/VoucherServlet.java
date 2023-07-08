package com.example.queen_store.controller.voucher;

import com.example.queen_store.model.customer.Customer;
import com.example.queen_store.model.voucher.Voucher;
import com.example.queen_store.service.voucher.IVoucherService;
import com.example.queen_store.service.voucher.VoucherService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "VoucherServlet", value = "/vouchers")
public class VoucherServlet extends HttpServlet {
    private IVoucherService voucherService = new VoucherService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "delete":
                deleteById(request,response);
                break;
            case "update":
                updateVoucherById(request,response);
                break;
            case "search":
                searchByName(request, response);
                break;
            case "increase":
                sortIncreaseByRate(request,response);
                break;
            case "decrease":
                sortDecreaseByRate(request,response);
                break;
            default:
                listVoucher(request, response);
                break;
        }
    }

    private void sortDecreaseByRate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Voucher> voucherList = null;
        try {
            voucherList =voucherService.orderByDecreaseRate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("voucherList",voucherList);
        RequestDispatcher requestDispatcher =request.getRequestDispatcher("voucher/list.jsp");
        requestDispatcher.forward(request,response);
    }

    private void sortIncreaseByRate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Voucher> voucherList = null;
        try {
            voucherList =voucherService.orderByIncreaseRate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("voucherList",voucherList);
        RequestDispatcher requestDispatcher =request.getRequestDispatcher("voucher/list.jsp");
        requestDispatcher.forward(request,response);
    }

    private void updateVoucherById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Voucher voucher = voucherService.selectVoucher(id);
        request.setAttribute("voucher",voucher);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("voucher/update.jsp");
        requestDispatcher.forward(request,response);
    }

    private void deleteById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Voucher voucher =voucherService.selectVoucher(id);
        request.setAttribute("voucher",voucher);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("voucher/delete.jsp");
        requestDispatcher.forward(request,response);
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
        String searchName = request.getParameter("searchName");
        List<Voucher> voucherList = voucherService.searchByName(searchName);
        System.out.println(voucherList);
        if (voucherList != null) {
            request.setAttribute("voucherList", voucherList);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("voucher/search.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }else {
            String msg = "khong co";
            request.setAttribute("msg",msg);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("voucher/search.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("voucher/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void listVoucher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Voucher> voucherList = voucherService.selectAllVoucher();
        request.setAttribute("voucherList", voucherList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("voucher/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertVoucher(request, response);
                break;
            case "update":
                updateVoucher(request,response);
                break;
            case "delete":
                deleteVoucher(request,response);
                break;
        }
    }

    private void deleteVoucher(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Voucher voucher = voucherService.selectVoucher(id);
        RequestDispatcher requestDispatcher;
        if (voucher==null){
            requestDispatcher = request.getRequestDispatcher("voucher/error404.jsp");
        }else {
            voucherService.deleteVoucher(id);
            try {
                response.sendRedirect("/vouchers");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void updateVoucher(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Float rate = Float.valueOf(request.getParameter("rate"));
        Voucher voucher = new Voucher(id,name,rate);
        voucherService.updateVoucher(voucher);
        response.sendRedirect("/vouchers");
    }

    private void insertVoucher(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        Float rate = Float.valueOf(request.getParameter("rate"));
        Voucher voucher = new Voucher(name, rate);
        Map<String,String> errMap = voucherService.save(voucher);
        if (errMap.isEmpty()){
            response.sendRedirect("/vouchers");
        }else {
            request.setAttribute("voucher",voucher);
            request.setAttribute("errors",errMap);
            try {
                request.getRequestDispatcher("voucher/create.jsp").forward(request,response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
