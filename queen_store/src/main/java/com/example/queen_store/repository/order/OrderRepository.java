package com.example.queen_store.repository.order;





import com.example.queen_store.repository.customer.BaseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderRepository implements IOrderRepository{
    private static final String SELECT_ALL_CUSTOMER_ORDER = " call getCustomerOrder(); ";

    @Override
    public List<CustomerOrders> getAll() {
        List<CustomerOrders> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_CUSTOMER_ORDER);
            ResultSet resultSet = callableStatement.executeQuery();
            int id;
            String productName;
            double price;
            int quantity;
            Date date;
            float voucherPercent;
            String userName;
            String phoneNumber;
            String address;
            while (resultSet.next()){
                id = resultSet.getInt("order_id");
                productName=resultSet.getString("product_name");
                price = resultSet.getDouble("product_price");
                quantity = resultSet.getInt("product_quantity");
                date = resultSet.getDate("order_date");
                voucherPercent = resultSet.getFloat("voucher_rate");
                userName = resultSet.getString("user_name");
                phoneNumber = resultSet.getString("user_phone_number");
                address = resultSet.getString("user_address");
                list.add(new CustomerOrders(id,productName,price,quantity,date,voucherPercent,userName,phoneNumber,address));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return list ;
    }
}
