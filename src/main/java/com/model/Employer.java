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
@ToString
@Entity
@Table(name = "employer")
public class Employer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="employer_id")
    private int id;
    private String name;
    private String address;
    private String email;
    private String password;

    /*@OneToMany(
            mappedBy = "employer",
            cascade = CascadeType.MERGE,
            orphanRemoval = true
    )*/
    @OneToMany(mappedBy="employer")
    private List<JobListing> employerJobList = new ArrayList<>();
    public Employer(){

    }

    public Employer(String name, String address, String email, String password) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.password = password;
    }
}
