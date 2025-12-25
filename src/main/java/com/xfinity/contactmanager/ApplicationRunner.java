package com.xfinity.contactmanager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.xfinity.contactmanager.models.User;
import com.xfinity.contactmanager.repositories.UserRepositorie;

@Component
public class ApplicationRunner implements CommandLineRunner  {

    @Autowired
    private UserRepositorie userRepositorie;


    @Override
    public void run(String... args) throws Exception {

        User user = new User(
            "admin",
            "admin"
        );
        User existingUser = userRepositorie.getByNameAndPassword(user.getName(),user.getPassword());
        if(existingUser != null) {
            user.setId(existingUser.getId());
            user.setIsAdmin(existingUser.getIsAdmin());
            userRepositorie.save(user);
        }
        
    }
    
}
