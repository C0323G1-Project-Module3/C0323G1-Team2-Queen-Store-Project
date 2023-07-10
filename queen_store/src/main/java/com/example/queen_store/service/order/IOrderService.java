package com.example.queen_store.service.order;





import com.example.queen_store.repository.order.CustomerOrders;

import java.util.List;

public interface IOrderService {
    List<CustomerOrders> getAll();
}
