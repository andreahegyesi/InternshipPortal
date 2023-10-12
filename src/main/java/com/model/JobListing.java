package com.model;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.*;
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "joblisting")
public class JobListing {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int id;
    private String name;
    private String experience;
    private String description;
   /* @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="employer_id", nullable=false)*/
   @ManyToOne
   @JoinColumn(name="employer_id", nullable=false)
    private Employer employer;
    @ManyToMany(cascade = {CascadeType.MERGE}, fetch = FetchType.LAZY)
    private List<Applicant> applicantList = new ArrayList<>();

    public JobListing() {}

    public JobListing(String name, String experience, String description, Employer employer) {
        this.name = name;
        this.experience = experience;
        this.description = description;
        this.employer = employer;
    }

    public String toString() {
        return this.name;
    }
}
