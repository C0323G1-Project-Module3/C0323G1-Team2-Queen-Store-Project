package com.example.queen_store.service.customer;

import com.example.queen_store.common.customer.CustomerValidate;
import com.example.queen_store.model.customer.Customer;
import com.example.queen_store.repository.customer.CustomerRepository;
import com.example.queen_store.repository.customer.ICustomerRepository;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> selectAllCustomer() throws SQLException {
        return customerRepository.selectAllUser();
    }

//    @Override
//    public void insertUser(Customer customer) {
//        customerRepository.insertUser(customer);
//    }

    @Override
    public boolean updateUser(Customer customer) throws SQLException {
        return customerRepository.updateUser(customer);
    }

    @Override
    public Customer selectCustomer(int id) throws SQLException {
        return customerRepository.selectCustomer(id);
    }

    @Override
    public boolean removeUser(int id) throws SQLException {
        return customerRepository.removeUser(id);
    }

    @Override
    public Map<String, String> save(Customer customer) {
        Map<String, String> errMap = new HashMap<>();
        if (customer.getName().equals("") || customer.getName() == null) {
            errMap.put("errName", "Tên Không Được Để Trống");

        } else if (customer.getName().equals("abc")) {
            errMap.put("errName", "Không đặt tên admin");
        }
        if (customer.getIdCard().equals("") || customer.getIdCard() == null) {
            errMap.put("errIdCard", "Không Để Trống ID_Card");
        }
        if (customer.getPhoneNumber().equals("") || customer.getPhoneNumber() == null) {
            errMap.put("errPhoneNumber", "Không Để Trống Phone Number");
        }
        if (customer.getEmail().equals("") || customer.getEmail() == null) {
            errMap.put("errEmail", "Không Để Trống Email");
        }
        if (customer.getAddress().equals("") || customer.getAddress() == null) {
            errMap.put("errAddress", "Không Để Trống Address");
        }
        if (errMap.isEmpty())
            this.customerRepository.insertUser(customer);
        return errMap;
    }


}
