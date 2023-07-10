package com.example.queen_store.repository.product;

import com.example.queen_store.model.product.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
    }

    @Override
    public List<Product> getAll() {
        return new ArrayList<>(products.values());
    }
}
