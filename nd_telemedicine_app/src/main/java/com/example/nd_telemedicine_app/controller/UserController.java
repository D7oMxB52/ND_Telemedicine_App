package com.example.nd_telemedicine_app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.nd_telemedicine_app.model.User;
import com.example.nd_telemedicine_app.service.UserService;

@RestController
@RequestMapping("/ndt")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping(value="/users", method=RequestMethod.POST, produces="application/json", consumes="application/json")
    public User createUser(@RequestBody User user) {
        System.out.println("user endpoint hit: " + user.getFirstName());
        return userService.createUser(user);
    }

    @RequestMapping(value="/users", method=RequestMethod.GET)
    public List<User> readUser() {
        return userService.getUsers();
    }

    @RequestMapping(value="/doctors/unverified", method=RequestMethod.GET)
    public List<User> readUnverifiedDoctors() {
        return userService.getAllUnverifiedDoctors();
    }

    @RequestMapping(value="/doctors", method=RequestMethod.POST)
    public User verifyDoctor(@RequestBody User user) {
        return userService.verifyDoctor(user.getUserId());
    }

    @RequestMapping(value="/doctors/verified", method=RequestMethod.GET)
    public List<User> readVerifiedDoctors() {
        return userService.getAllVerifiedDoctors();
    }

    @RequestMapping(value="/users/{userId}", method=RequestMethod.PUT)
    public User readUsers(@PathVariable(value = "userId") Integer userId, @RequestBody User userDetails) {
        return userService.updateUser(userId, userDetails);
    }

    @RequestMapping(value="/users/{userId}", method=RequestMethod.DELETE)
    public void deleteUser(@PathVariable(value = "userId") Integer userId) {
        userService.deleteUser(userId);
    }
}
