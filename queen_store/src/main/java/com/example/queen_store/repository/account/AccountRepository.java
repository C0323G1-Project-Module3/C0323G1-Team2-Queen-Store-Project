package com.example.queen_store.repository.account;

import com.example.queen_store.model.account.Account;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AccountRepository implements IAccountRepository {

    private Map<Integer, Account> accountMap = new HashMap<>();
    private static final String FIND_BY_USER_NAME = " call find_by_user_name(?) ";
    private static final String SELECT_ALL_ACCOUNT = " call select_all_account() ";
    private static final String INSERT_ACCOUNT = " insert into account values (?,?,?) ";
    private static final String DELETE_ACCOUNT = " delete from account where account.account_user_name = ? ";


    @Override
    public Account findByUserName(String userName) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(FIND_BY_USER_NAME);
            callableStatement.setString(1, userName);
            ResultSet resultSet = callableStatement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString("account_user_name");
                String password = resultSet.getString("account_password");
                String role = resultSet.getString("role_name");
                return new Account(name, password, role);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public Account checkAccount(String userName, String password) {
        Account account = findByUserName(userName);

        if (account.getPassword().equals(password)) {
            return account;
        }
        return null;
    }

    @Override
    public boolean addUser(Account user) {
        Connection connection = BaseRepository.getConnection();
        boolean rowUpdate;
        try {
            PreparedStatement preparedStatement = connection.prepareCall(INSERT_ACCOUNT);
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setInt(3, 2);
            rowUpdate = preparedStatement.executeUpdate() > 0;
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return rowUpdate;
    }

    @Override
    public List<Account> getAllUser() {
        List<Account> accountList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_ACCOUNT);
            while (resultSet.next()){
                String userName = resultSet.getString("account_user_name");
                String password = resultSet.getString("account_password");
                String roleName = resultSet.getString("role_name");
                accountList.add(new Account(userName,password,roleName));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return accountList;
    }
}
