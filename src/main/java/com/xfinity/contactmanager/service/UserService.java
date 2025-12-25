package com.xfinity.contactmanager.service;

import org.springframework.stereotype.Service;

import com.xfinity.contactmanager.models.User;
import com.xfinity.contactmanager.repositories.UserRepositorie;
import com.xfinity.contactmanager.util.StringHasher;

@Service
public class UserService {
    private final UserRepositorie userRepositorie;

    public UserService(UserRepositorie userRepositorie) {
        this.userRepositorie = userRepositorie;
    }

    public User login(String username, String password) {
        User user = userRepositorie.getByNameAndPassword(username, StringHasher.hashStringSHA256(password));
        return user;
    }

    public User login(User user) {
        User resultuser = userRepositorie.getByNameAndPassword(user.getName(), user.getPassword());
        return resultuser;
    }
    
    
}
