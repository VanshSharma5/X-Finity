package com.xfinity.contactmanager.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.xfinity.contactmanager.models.Contact;


@Repository 
public interface ContactRepositorie extends JpaRepository<Contact, Integer> {
 
    Page<Contact> findByNameContaining(String name, Pageable pageable);
    Page<Contact> findByContactNoContaining(String contactNo, Pageable pageable);
    Page<Contact> findByPinCodeContaining(String pinCode, Pageable pageable);
    Page<Contact> findByCityContaining(String city, Pageable pageable);
    Page<Contact> findByDealerTypeContaining(String dealerType, Pageable pageable);
    Page<Contact> findByDesignationContaining(String designation, Pageable pageable);

}
