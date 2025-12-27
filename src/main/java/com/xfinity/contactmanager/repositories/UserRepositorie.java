package com.xfinity.contactmanager.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.xfinity.contactmanager.models.User;

@Repository
public interface UserRepositorie extends JpaRepository<User, Integer> {

    public User getByNameAndPassword(String name, String password);
    public Boolean existsByName(String name);
}
