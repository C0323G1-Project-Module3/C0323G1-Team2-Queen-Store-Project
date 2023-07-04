package com.example.queen_store.repository.product;

import com.example.queen_store.model.product.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getAll();
}
