package com.example.queen_store.service.customer;

import com.example.queen_store.model.customer.Customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> selectAllCustomer() throws SQLException;


//    void insertUser(Customer customer);

   boolean updateUser(Customer customer) throws SQLException;

    Customer selectCustomer(int id) throws SQLException;

    boolean removeUser(int id) throws SQLException;

    Map<String, String> save(Customer customer);
}
