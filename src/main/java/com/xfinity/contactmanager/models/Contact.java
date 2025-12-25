package com.xfinity.contactmanager.models;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Contact {
    @Id
    @GeneratedValue
    private Integer id;
    private String name;
    private String contactNo;
    private String contactNoInformataion;
    private String designation;
    private String houseNo;
    private String colony;
    private String city;
    private String subDistrict;
    private String pinCode;
    private String state;
    private String dealerType;
    private String dealerVisit;
    private LocalDate dealerVisitDate;
    private String companyVisit;
    private LocalDate companyVisitDate;
    private String existingDealer;
    private Integer callDetailCount;
    private String discussion1;
    private String discussion2;
    private String discussion3;
    private String discussion4;
    private String discussion5;
    private String rateIssue;
    private String qualityIssue;
    private String serviceIssue;
    private String existingDealerCompany;
}
