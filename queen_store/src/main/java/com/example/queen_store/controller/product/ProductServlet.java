package com.example.queen_store.controller.product;

import com.example.queen_store.model.product.Product;
import com.example.queen_store.model.product.ProductType;
import com.example.queen_store.service.product.IProductService;
import com.example.queen_store.service.product.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "save":
                showEditForm(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "view":
                viewProduct(request, response);
                break;
            case "sortUp":
                sortUp(request, response);
                break;
            case "sortDown":
                sortDown(request, response);
                break;
            case "search":
                searchProduct(request, response);
                break;
            default:
                showList(request, response);
                break;
        }

    }

//    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
//        String name = request.getParameter("name");
//        List<Product> products = productService.searchByName(name);
//        request.setAttribute("productList", products);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Product> products = productService.searchByName(name);
        request.setAttribute("productList", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void sortUp(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = productService.sortUpByPrice();
        request.setAttribute("productList", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void sortDown(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = productService.sortDownByPrice();
        request.setAttribute("productList", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.searchById(id);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/view.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<ProductType> productTypes = productService.showTypeList();
        request.setAttribute("productTypes", productTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.searchById(id);
        List<ProductType> productTypes = productService.showTypeList();
        request.setAttribute("productTypes", productTypes);
        request.setAttribute("product", product);
        request.setAttribute("id", id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        try {
            response.sendRedirect("/ProductServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.showList();
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addProduct(request, response);
                break;
            case "save":
                saveProduct(request, response);
                break;
            default:
                break;
        }
    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String type = request.getParameter("type");
        int inventory = Integer.parseInt(request.getParameter("inventory"));
        String imgPath = request.getParameter("imgPath");
        Product product = new Product(id, name, price, description, type, inventory, imgPath);
        System.out.println(type);
        Map<String, String> errMap = productService.save(product);
        if (errMap.isEmpty()) {
            try {
                response.sendRedirect("/ProductServlet");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("product", product);
            request.setAttribute("errors", errMap);
            try {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/product/edit.jsp");
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String type = request.getParameter("type");
        int inventory = Integer.parseInt(request.getParameter("inventory"));
        String imdPath = request.getParameter("imgPath");
        Product product = new Product(name, price, description, type, inventory, imdPath);
        productService.add(product);
        try {
            response.sendRedirect("/ProductServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
