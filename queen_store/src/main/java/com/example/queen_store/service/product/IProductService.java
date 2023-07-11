package com.example.queen_store.service.product;

import com.example.queen_store.model.product.Product;
import com.example.queen_store.model.product.ProductType;

import java.util.List;
import java.util.Map;

public interface IProductService {
    List<Product> showList();
    Map<String, String> add(Product product);
    Map<String, String> save(Product product);
    void remove (int id);
    List<Product> sortUpByPrice();
    List<Product> sortDownByPrice();
    Product searchById(int id);
    List<Product> searchByName(String name);
    List<Product> searchByPrice(int range);
    List<ProductType> showTypeList();

    List<Product> getAllPaging(int i, int recordsPerPage);
}
