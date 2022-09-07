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

    @RequestMapping(value="/users", method=RequestMethod.POST)
    public User createUser(@RequestBody User user) {
        return userService.createUser(user);
    }

    @RequestMapping(value="/users", method=RequestMethod.GET)
    public List<User> readUser() {
        return userService.getUsers();
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
