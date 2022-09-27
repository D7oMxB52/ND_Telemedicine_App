package com.example.nd_telemedicine_app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nd_telemedicine_app.model.User;
import com.example.nd_telemedicine_app.repository.UserRepository;


import java.util.List;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    // CREATE USER
    public User createUser(User user) {
        int numOfUsers = userRepository.findAll().size();
        user.setUserId(numOfUsers+1);
        return userRepository.save(user);
    }


    // GET ALL USERS
    public List<User> getUsers() {
        return userRepository.findAll();
    }


    // GET ALL PATIENTS
    public List<User> getPatients() {
        return userRepository.findAll();
    }

    // DELETE USER
    public void deleteUser(Integer userId) {
        userRepository.deleteById(userId);
    }

    // UPDATE USER
    public User updateUser(Integer userId, User userDetails) {
        User user = userRepository.findById(userId).get();
        user.setFirstName(userDetails.getFirstName());
        user.setLastName(userDetails.getLastName());
        user.setEmail(userDetails.getEmail());
        user.setDateOfBirth(userDetails.getDateOfBirth());
        user.setPassword(userDetails.getPassword());
        user.setAddress(userDetails.getAddress());
        user.setPhoneNum(userDetails.getPhoneNum());
        user.setRole(userDetails.getRole());
        user.setAccreditationNum(userDetails.getAccreditationNum());

        return userRepository.save(user);
    }

    // GET ALL UNVERIFIED DOCTORS
    public List<User> getAllUnverifiedDoctors() {
        return userRepository.getAllUnverifiedDoctors();
    }

    // VERIFY DOCTOR -- When doctor is approved by admin
    public User verifyDoctor(Integer userId) {
        User user = userRepository.findById(userId).get();
        user.setVerified(true);
        userRepository.save(user);
        return user;
    }

    // DEACTIVATE USER
    // -- When a doctors signup isn't approved by admin
    // -- When a user wants to be removed from the system
    public void deactivateUser(Integer userId) {
        User user = userRepository.findById(userId).get();
        user.setActive(false);
        userRepository.save(user);
    }

    // GET ALL ACTIVE PATIENTS
    public List<User> getAllPatients() {
        return userRepository.getAllActivePatients();
    }

    // GET ALL ACTIVE DOCTORS
    public List<User> getAllVerifiedDoctors() {
        return userRepository.getAllVerifiedDoctors();
    }

    public Boolean findUserByEmail(String email, String password){
        Boolean isFound = false;
        List<User> users = userRepository.findAll();
        for (int i = 0; i< users.size(); i++){
            if(users.get(i).getEmail().equals(email) && users.get(i).getPassword().equals(password)){
                isFound = true;
            }
        }
        return isFound;
    }
}