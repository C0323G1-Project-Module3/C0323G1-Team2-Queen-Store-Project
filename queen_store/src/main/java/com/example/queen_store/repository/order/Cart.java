package com.example.queen_store.repository.order;

import com.example.queen_store.model.product.Product;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private static Map<Product,Integer> items =new HashMap<>();
    public static int totalQuantity;
    public static void addItem(Product product, int quantity) {
        totalQuantity += quantity;
        if (items.containsKey(product)) {
            // Nếu sản phẩm đã có trong giỏ hàng, cập nhật số lượng
            int currentQuantity = items.get(product);
            items.put(product, currentQuantity + quantity);
        } else {
            // Nếu sản phẩm chưa có trong giỏ hàng, thêm sản phẩm mới
            items.put(product, quantity);
        }
    }

    // Xóa sản phẩm khỏi giỏ hàng
    public static void removeItem(String productName) {
        items.remove(productName);
    }

    // Lấy danh sách sản phẩm trong giỏ hàng
    public static Map<Product, Integer> getItems() {
        return items;
    }
}
