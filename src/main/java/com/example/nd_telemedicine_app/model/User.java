package com.example.nd_telemedicine_app.model;

import org.springframework.lang.Nullable;

import javax.persistence.*;
import com.fasterxml.jackson.annotation.JsonCreator;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;


enum Role {
    AD,
    DR,
    PA
}

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue
    // @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userId;

    @Column(name = "role")
    private Role role;

    @Column(name = "active")
    private boolean active;

    @Nullable
    @Column(name = "verified")
    private boolean verified;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @Column(name = "dateOfBirth")
    private Date dateOfBirth;

    @Column(name = "email", unique = true)
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "address")
    private String address;

    @Column(name = "phoneNum", unique = true)
    private String phoneNum;

    @Nullable
    @Column(name = "accreditationNum", unique = true)
    private int accreditationNum;

    /**
     * No arg constructor as needed by Spring data JPA.
     */
    public User() {
    }

    /**
     * User constructor for PA (Patient) object.
     * @param firstName Patients first name
     * @param lastName Patients last name
     * @param dateOfBirth Patients date of birth
     * @param email Patients email
     * @param password Patients password
     * @param address Patients address
     * @param phoneNum Patients phone number
     * @param active Patient account activated on first sign up
     */
    @JSONCreator
    public User(String firstName, String lastName, Date dateOfBirth, String email, String password, String address, String phoneNum, boolean active) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phoneNum = phoneNum;
        this.role = Role.PA;
        this.active = true;
    }

    /**
     * User constructor for DR (Doctor) object.
     * @param firstName Doctors first name
     * @param lastName Doctors last name
     * @param dateOfBirth Doctors date of birth
     * @param email Doctors email
     * @param password Doctors password
     * @param address Doctors address
     * @param phoneNum Doctors phone number
     * @param accreditationNum Doctors accreditation number
     * @param active Doctors account activated on sign up
     * @param verified Doctors account not verified on sign up. Needs approval from admin
     */
    public User(String firstName, String lastName, Date dateOfBirth, String email, String password, String address, String phoneNum, int accreditationNum, boolean active, boolean verified) {

        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phoneNum = phoneNum;
        this.role = Role.DR;
        this.accreditationNum = accreditationNum;
        this.active = true;
        this.verified = false;
    }


    // SETTERS

    public void setUserId(Integer userId) { this.userId = userId; }

    public void setRole(Role role) {
        this.role = role;
    }

    public void setActive(boolean active) { this.active = active; }

    public void setVerified(boolean verified) { this.verified = verified; }


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

    public void setAccreditationNum(int accreditationNum) {
        this.accreditationNum = accreditationNum;
    }

    // GETTERS

    @Id
    public Integer getUserId() { return userId; }

    public Role getRole() {
        return role;
    }

    public boolean isActive() { return active; }

    public boolean isVerified() { return verified; }


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

    public int getAccreditationNum() {
        return accreditationNum;
    }
}

