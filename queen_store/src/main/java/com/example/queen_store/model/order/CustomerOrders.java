package com.example.queen_store.model.order;

import java.sql.Date;

public class CustomerOrders {
    private int id;
    private String productName;
    private double productPrice;
    private int productQuantity;
    private Date orderDate;
    private float voucherPercent;
    private String customerName;

    private String phoneNumber;
    private String address;


    public CustomerOrders(int id, String productName, double productPrice, int productQuantity, Date orderDate, float voucherPercent, String customerName, String phoneNumber, String address) {
        this.id = id;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.orderDate = orderDate;
        this.voucherPercent = voucherPercent;
        this.customerName = customerName;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public CustomerOrders() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public float getVoucherPercent() {
        return voucherPercent;
    }

    public void setVoucherPercent(float voucherPercent) {
        this.voucherPercent = voucherPercent;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
}
