package com.example.queen_store.repository.account;

import com.example.queen_store.model.account.Account;

import java.util.List;
import java.util.Map;

public interface IAccountRepository {

    Account findByUserName(String userName);

    Account checkAccount(String userName, String password);

    boolean addUser(Account user);

    List<Account> getAllUser();
}
