package com.example.queen_store.repository.customer;

import com.example.queen_store.model.customer.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_ALL_USERS = "select * from user";
    private static final String INSERT_USERS = " insert into user(user_name,user_dob,user_gender,user_id_card,user_phone_number,user_mail,user_address,account_user_name)" +
            "values(?,?,?,?,?,?,?,?)";
    private static final String UPDATE_USERS = " update user set user_name = ?,user_dob= ?, user_gender =?, user_id_card=?" +
            ",user_phone_number=?,user_mail=?,user_address=? where user_id = ? ";
    private static final String SELECT_USERS_BY_ID = " select user_id,user_name,user_dob,user_gender,user_id_card,user_phone_number,user_mail,user_address from user\n" +
            " where user_id =?; ";
    private static final String DELETE_USERS_BY_ID = "  delete from user \n" +
            " where user_id = ?; ";
    private static final String SELECT_USER_ID_BY_USERNAME = " call select_id_by_user_name(?); ";
    @Override
    public List<Customer> selectAllUser() throws SQLException {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("user_id");
            String name = resultSet.getString("user_name");
            Date dob = resultSet.getDate("user_dob");
            boolean gender = resultSet.getBoolean("user_gender");
            String idCard = resultSet.getString("user_id_card");
            String phoneNumber = resultSet.getString("user_phone_number");
            String email = resultSet.getString("user_mail");
            String address = resultSet.getString("user_address");
            int typeOfCustomerID = resultSet.getInt("type_of_customer_id");
            String accUserName = resultSet.getString("account_user_name");
            customerList.add(new Customer(id, name, dob, gender, idCard, phoneNumber, email, address, typeOfCustomerID, accUserName));
        }
        return customerList;
    }

    @Override
    public void insertUser(Customer customer) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS);
//            preparedStatement.setInt(1,customer.getId());
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setDate(2, customer.getDob());
            preparedStatement.setBoolean(3, customer.isGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhoneNumber());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
//            preparedStatement.setInt(8, customer.getTypeOfCustomerID());
            preparedStatement.setString(8, customer.getAccUserName());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean updateUser(Customer customer)  {
        boolean rowUpdate;
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(UPDATE_USERS);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setDate(2, customer.getDob());
            preparedStatement.setBoolean(3, customer.isGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhoneNumber());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getId());
            rowUpdate = preparedStatement.executeUpdate() > 0;
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdate;
    }

    @Override
    public Customer selectCustomer(int id) throws SQLException {
        Customer customer = null;
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_ID);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String name = resultSet.getString("user_name");
            Date dob = resultSet.getDate("user_dob");
            boolean gender = resultSet.getBoolean("user_gender");
            String idCard = resultSet.getString("user_id_card");
            String phoneNumber = resultSet.getString("user_phone_number");
            String email = resultSet.getString("user_mail");
            String address = resultSet.getString("user_address");
            customer = new Customer(id, name, dob, gender, idCard, phoneNumber, email, address);
        }
        connection.close();
        return customer;
    }

    @Override
    public boolean removeUser(int id) throws SQLException {
        boolean rowDelete;
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS_BY_ID);
        preparedStatement.setInt(1,id);
        rowDelete = preparedStatement.executeUpdate() > 0;
        connection.close();
        return rowDelete;
    }

    @Override
    public int getUserIdByUserName(String userName) {
        Connection connection = BaseRepository.getConnection();
        System.out.println(userName);
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_USER_ID_BY_USERNAME);
            callableStatement.setString(1,userName);
            ResultSet resultSet = callableStatement.executeQuery();
            if(resultSet.next()) {
                return resultSet.getInt("user_id");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

}
