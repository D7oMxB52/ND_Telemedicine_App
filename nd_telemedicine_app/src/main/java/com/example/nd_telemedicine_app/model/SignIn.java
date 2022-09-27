package com.example.nd_telemedicine_app.model;

public class SignIn {
    public String getEmail() {
        return email;
    }

    public SignIn() {
    }

    public SignIn(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private String email;
    private String password;
}
