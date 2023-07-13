package com.example.queen_store.service.order;



import com.example.queen_store.model.product.Product;
import com.example.queen_store.model.order.CustomerOrders;
import com.example.queen_store.repository.order.IOrderRepository;
import com.example.queen_store.repository.order.OrderRepository;

import java.util.List;
import java.util.Map;

public class OderService implements IOrderService{
    private static IOrderRepository orderRepository = new OrderRepository();
    @Override
    public List<CustomerOrders> getAll() {
        return orderRepository.getAll();
    }

    @Override
    public void add(String date, int userId, Integer voucherId, int productId, double price, int totalQuantity) {
        orderRepository.add(date,userId,voucherId,productId,price,totalQuantity);
    }

    @Override
    public int addOrder(String date, int userId, Integer voucherId) {
        return orderRepository.addOrder(date,userId,voucherId);

    }

    @Override
    public void addOrderDetail(Map<Product, Integer> items, int idOrder) {
        orderRepository.addOrderDetail(items,idOrder);
    }

    @Override
    public void deleteOrder(int id) {
        orderRepository.delete(id);
    }
}
