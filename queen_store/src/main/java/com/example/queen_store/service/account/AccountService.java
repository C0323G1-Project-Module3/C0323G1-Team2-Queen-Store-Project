package com.example.queen_store.service.account;

import com.example.queen_store.model.account.Account;
import com.example.queen_store.repository.account.AccountRepository;
import com.example.queen_store.repository.account.IAccountRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AccountService implements IAccountService {
    private static IAccountRepository accountRepository = new AccountRepository();


    @Override
    public Account findByUserName(String userName) {
        return accountRepository.findByUserName(userName);
    }

    @Override
    public Account login(String userName, String password) {
        return accountRepository.checkAccount(userName, password);
    }

    @Override
    public boolean checkUserName(String userName) {
        Account user = accountRepository.findByUserName(userName);
        if(user != null){
            return true;
        }
        return false;
    }

    @Override
    public boolean addUser(Account user) {
       return accountRepository.addUser(user);
    }

    @Override
    public List<Account> getAllUser() {
       List<Account> accountList = accountRepository.getAllUser();
       if(accountList.isEmpty()){
           return null;
       }
       return accountList;
    }


}
