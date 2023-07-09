package com.example.queen_store.service.product;

import com.example.queen_store.model.product.Product;
import com.example.queen_store.model.product.ProductType;

import java.util.List;
import java.util.Map;

public interface IProductService {
    List<Product> showList();
    void add(Product product);
    Map<String, String> save(Product product);
    void remove (int id);
    List<Product> sortUpByPrice();
    List<Product> sortDownByPrice();
    Product searchById(int id);
    List<Product> searchByName(String name);
    List<ProductType> showTypeList();
}
