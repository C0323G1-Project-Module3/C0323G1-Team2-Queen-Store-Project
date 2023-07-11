package com.example.queen_store.service.order;



import com.example.queen_store.repository.order.CustomerOrders;
import com.example.queen_store.repository.order.IOrderRepository;
import com.example.queen_store.repository.order.OrderRepository;

import java.util.List;

public class OderService implements IOrderService{
    private static IOrderRepository orderRepository = new OrderRepository();
    @Override
    public List<CustomerOrders> getAll() {
        return orderRepository.getAll();
    }
}
