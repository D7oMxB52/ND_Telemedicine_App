package com.example.nd_telemedicine_app.model;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonCreator;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "registration")
public class User {

//    public List<User> userList = new ArrayList();

//    boolean addUser(User newUser){
//        return userList.add(newUser);
//    }

//    enum Role {
//        AD,
//        DR,
//        PA
//    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="user_id")
    private long userId;

    @Column(name="first_name")
    private String firstName;

    @Column(name="last_name")
    private String lastName;

    @Column(name="date_of_birth")
    private Date dateOfBirth;

    @Column(name="email")
    private String email;

    @Column(name="password")
    private String password;

    @Column(name="address")
    private String address;

    @Column(name="phone_number")
    private String phoneNum;

    @Column(name="role")
    private String role; // todo TRANSFORM TO ROLE ENUM

    @Nullable
    @Column(name="accreditation_num")
    private int accreditationNum;

    /**
     * User constructor for PA (Patient) object.
     * @param firstName
     * @param lastName
     * @param dateOfBirth
     * @param email
     * @param password
     * @param address
     * @param phoneNum
     */
    @JsonCreator
    public User(String firstName, String lastName, Date dateOfBirth, String email,
                String password, String address, String phoneNum, String role, int accreditationNum) {
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

//
//    /**
//     * User constructor for DR (Doctor) object.
//     * @param firstName
//     * @param lastName
//     * @param dateOfBirth
//     * @param email
//     * @param password
//     * @param address
//     * @param phoneNum
//     * @param accreditationNum
//     */
//    @JsonCreator
//    public User(String firstName, String lastName, Date dateOfBirth, String email, String password,
//                String address, String phoneNum, int accreditationNum) {
//        this.firstName = firstName;
//        this.lastName = lastName;
//        this.dateOfBirth = dateOfBirth;
//        this.email = email;
//        this.password = password;
//        this.address = address;
//        this.phoneNum = phoneNum;
//        this.role = Role.DR;
//        this.accreditationNum = accreditationNum;
//    }

//    public void setUserId(int userId) {
//        this.userId = userId;
//    }

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

    public void setRole(String role) {
        this.role = role;
    }

    public void setAccreditationNum(int accreditationNum) {
        this.accreditationNum = accreditationNum;
    }

    public long getUserId() {
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

    public String getRole() {
        return role;
    }

    public int getAccreditationNum() {
        return accreditationNum;
    }


}