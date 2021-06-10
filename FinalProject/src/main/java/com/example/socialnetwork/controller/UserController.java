package com.example.socialnetwork.controller;

import com.example.socialnetwork.entity.User;
import com.example.socialnetwork.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UserController {

    @Autowired
    private UserService service;

    @PostMapping("/addUser")
    public User addUser(@RequestBody User user) {
        return service.saveUser(user);
    }

    @PostMapping("/addUsers")
    public List<User> addUsers(@RequestBody List<User> users) {
        return service.saveUsers(users);
    }

    @GetMapping("/user")
    public List<User> findAllUsers() {
        return service.getUsers();
    }


    @GetMapping("/mostPopularUser")
    public User getMostPopularUser() {
        return service.getMostPopularUser();
    }

    @GetMapping("/userFriends/{id}")
    public List<User> getUserFriends(@PathVariable int id) {
        return service.getUserFriends(id);
    }

    @GetMapping("/userById/{id}")
    public User findById(@PathVariable int id) {
        return service.getUserById(id);
    }

    @GetMapping("/userByName/{name}")
    public User findByName(@PathVariable String name) {
        return service.getUserByName(name);
    }

    @PutMapping("/update")
    public User updateUser(@RequestBody User user) {
        return service.updateUser(user);
    }

    @DeleteMapping("/delete/{id}")
    public String deleteUser(@PathVariable int id) {
        return service.deleteProduct(id);
    }
}
