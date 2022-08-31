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
        return userRepository.save(user);
    }

    // READ ALL USERS
    public List<User> getUser() {
        return userRepository.findAll();
    }

    // DELETE USER
    public void deleteUser(Long userId) {
        userRepository.deleteById(userId);
    }

    // UPDATE
    public User updateUser(Long userId, User userDetails) {
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
}