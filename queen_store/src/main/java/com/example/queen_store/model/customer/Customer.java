package com.example.queen_store.model.customer;

import java.util.Objects;

public class Customer {
    private int id;
    private String name;
    private String dob;
    private boolean gender;
    private String idCard;
    private double phoneNumber;
    private String email;
    private String address;
    private int tocID;
    private String accUserName;

    public Customer() {
    }

    public Customer(int id, String name, String dob, boolean gender, String idCard, double phoneNumber, String email, String address, int tocID, String accUserName) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.idCard = idCard;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.tocID = tocID;
        this.accUserName = accUserName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public double getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(double phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getTocID() {
        return tocID;
    }

    public void setTocID(int tocID) {
        this.tocID = tocID;
    }

    public String getAccUserName() {
        return accUserName;
    }

    public void setAccUserName(String accUserName) {
        this.accUserName = accUserName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Customer customer = (Customer) o;
        return id == customer.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
