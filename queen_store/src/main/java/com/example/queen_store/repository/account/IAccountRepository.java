package com.example.queen_store.repository.account;

import com.example.queen_store.model.account.Account;
import com.example.queen_store.model.customer.Customer;

import java.util.List;

public interface IAccountRepository {

    Account findByUserName(String userName);

    Account checkAccount(String userName, String password);

    boolean addUser(Account user);

    List<Account> getAllUser();

    Customer findCustomerByUserName(String userName);

    String findTypeOfCustomer(Customer user);

    boolean deleteUser(String userName);

    boolean editUser(String userName, String password);

    boolean deleteCustomer(String userName);
}
