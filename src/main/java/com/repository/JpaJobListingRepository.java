package com.repository;
//
import com.model.*;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
public class JpaJobListingRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Hibernate_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<JobListing> getAllJobListings() {
        TypedQuery<JobListing> typedQuery = entityManager.createQuery("select j from JobListing j", JobListing.class);
        List<JobListing> jobList = typedQuery.getResultList();
        return jobList;
    }

    public void addJobListing(JobListing jobListing) {
        entityManager.getTransaction().begin();
        entityManager.persist(jobListing);
        entityManager.getTransaction().commit();
    }

    public void addApplicantToJobListing(JobListing jobListing, Applicant applicant) {
        if ((jobListing.getApplicantList().contains(applicant)) == false) {
        entityManager.getTransaction().begin();
        jobListing.getApplicantList().add(applicant);
        entityManager.getTransaction().commit();}
    }

    public void updateJobListing(int id, String name, String experience, String description) {
        entityManager.getTransaction().begin();
        JobListing jobListing = entityManager.find(JobListing.class, id);
        jobListing.setName(name);
        jobListing.setExperience(experience);
        jobListing.setDescription(description);
        entityManager.getTransaction().commit();
    }

    public JobListing findJobListingById(int id) {
        JobListing jobListing = entityManager.find(JobListing.class, id);
        return jobListing;
    }

    public String findJobListingNameById(Integer id) {
        JobListing jobListing = entityManager.find(JobListing.class, id);
        return jobListing.getName();
    }

    public void deleteJobListing(int id) {
        entityManager.getTransaction().begin();
        JobListing jobListing = entityManager.find(JobListing.class, id);
        entityManager.remove(jobListing);
        entityManager.getTransaction().commit();
    }

    public void shutdown() {
        entityManager.close();
        emFactory.close();
    }
}
