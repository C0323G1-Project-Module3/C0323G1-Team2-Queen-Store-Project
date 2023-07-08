package com.example.queen_store.service.product;

import com.example.queen_store.common.product.ProductCommon;
import com.example.queen_store.model.product.Product;
import com.example.queen_store.repository.product.IProductRepository;
import com.example.queen_store.repository.product.ProductRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> showList() {
        return productRepository.getAll();
    }

    @Override
    public void remove(int id) {

        productRepository.remove(id);
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public Map<String, String> save(Product product) {
        Map<String, String> errMap = new HashMap<>();

        if (product.getName().trim().equals("") || product.getName() == null) {
            errMap.put("errName", "Tên không được để trống");
        } else if (product.getName().length() > 255) {
            errMap.put("errName", "Tên không dài quá 255 ký tự");
        }
        if (errMap.isEmpty()) {
            productRepository.update(product);
        }
        return errMap;
    }

    @Override
    public List<Product> sortUpByPrice() {
        return productRepository.sortUpByPrice();
    }

    @Override
    public List<Product> sortDownByPrice() {
        return productRepository.sortDownByPrice();
    }

    @Override
    public Product searchById(int id) {
        return productRepository.searchById(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return productRepository.searchByName(name);
    }
}
