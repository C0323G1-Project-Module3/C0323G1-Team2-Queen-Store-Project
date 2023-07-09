package com.example.queen_store.service.account;

import com.example.queen_store.model.account.Account;

import java.util.List;
import java.util.Map;

public interface IAccountService {

    Account findByUserName(String userName);

    Account login(String userName, String password);

    boolean checkUserName(String userName);

    boolean addUser(Account user);

    List<Account> getAllUser();
}
