package com.model;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "applicant")
public class Applicant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String email;
    private String password;
    private String addressLine1;
    private String addressLine2;
    private String country;
    private String state;
    private String city;


    public Applicant(){

    }

    public Applicant(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public Applicant(String firstName, String lastName, String phoneNumber, String email, String password, String addressLine1, String addressLine2, String country, String state, String city) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.password = password;
        this.addressLine1 = addressLine1;
        this.addressLine2 = addressLine2;
        this.country = country;
        this.state = state;
        this.city = city;
    }
    @Override
    public boolean equals(Object obj) {
        if(!(obj instanceof Applicant)) {
            return false;
        }
        Applicant applicant = (Applicant)obj;
        return this.id == applicant.getId() && this.email.equals(applicant.getEmail());
    }
    public String toString() {
        return this.firstName;
    }
}
