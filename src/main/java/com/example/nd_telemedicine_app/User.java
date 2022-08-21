package com.example.nd_telemedicine_app;

import java.util.Date;

public class User {

    enum Role {
        AD,
        DR,
        PA
    }

    // Does userId get assigned when user is created?
    private int userId;
    private String firstName;
    private String lastName;
    private Date dateOfBirth;
    private String email;
    private String password;
    private String address;
    private String phoneNum;
    private Role role;
    private int accreditationNum;

    public User(int userId, String firstName, String lastName, Date dateOfBirth, String email, String password, String address, String phoneNum, Role role) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phoneNum = phoneNum;
        this.role = role;
    }

    public User(int userId, String firstName, String lastName, Date dateOfBirth, String email, String password, String address, String phoneNum, Role role, int accreditationNum) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phoneNum = phoneNum;
        this.role = role;
        this.accreditationNum = accreditationNum;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public void setAccreditationNum(int accreditationNum) {
        this.accreditationNum = accreditationNum;
    }

    public int getUserId() {
        return userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getAddress() {
        return address;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public Role getRole() {
        return role;
    }

    public int getAccreditationNum() {
        return accreditationNum;
    }


}
