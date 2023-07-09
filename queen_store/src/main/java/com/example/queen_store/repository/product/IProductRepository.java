package com.example.queen_store.repository.product;

import com.example.queen_store.model.product.Product;
import com.example.queen_store.model.product.ProductType;

import java.util.List;

public interface IProductRepository {
    List<Product> getAll();

    Product searchById(int id);

    List<Product> searchByName(String name);

    void add(Product product);
    boolean update(Product product);
    boolean remove(int id);
    List<Product> sortUpByPrice();
    List<Product> sortDownByPrice();
    List<ProductType> getAllType();
 }
