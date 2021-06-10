package com.example.socialnetwork.service;

import com.example.socialnetwork.entity.User;
import com.example.socialnetwork.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository repository;

    //CREATE
    public User saveUser(User user) {
        return repository.save(user);
    }

    public List<User> saveUsers(List<User> users) {
        return repository.saveAll(users);
    }

    //GET
    public List<User> getUsers() {
        return repository.findAll();
    }

    public List<User> getUserFriends(Integer id) {
        return repository.getFreinds(id);
    }

    public User getUserById(int id) {
        return repository.findById(id).orElse(null);
    }

    public User getMostPopularUser() {
        return repository.getMostPopularUser();
    }

    public User getUserByName(String name) {
        return repository.findByName(name);
    }


    //DELETE
    public String deleteProduct(int id) {
        repository.deleteById(id);
        return "removed user with the id" + id;
    }

    //UPDATE
    public User updateUser(User user) {
        User existingUser = repository.findById(user.getId()).orElse(null);
        existingUser.setName(user.getName());
        return existingUser;
    }
}
