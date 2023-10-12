package com.repository;
import com.model.Employer;
import com.model.Applicant;
import com.model.JobListing;
import jakarta.persistence.*;

import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.List;
public class JpaEmployerRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Hibernate_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<Employer> getAllEmployers() {
        TypedQuery<Employer> typedQuery = entityManager.createQuery("select e from Employer e", Employer.class);
        List<Employer> employerList = typedQuery.getResultList();
        return employerList;
    }

    public void addEmployer(Employer employer) {
        entityManager.getTransaction().begin();
        entityManager.persist(employer);
        entityManager.getTransaction().commit();
    }

    public Employer findEmployerById(int id) {
        Employer employer = entityManager.find(Employer.class, id);
        return employer;
    }

    public Employer findEmployerByEmail(String email) {
        try {
            TypedQuery<Employer> typedQuery = entityManager.createQuery("select e from Employer e WHERE e.email = :email", Employer.class);
            return typedQuery
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException e) {
            throw new InvalidParameterException("User is not found in the database");
        }
    }

    public Employer checkIfExists(String email, String password) {
        try {
            TypedQuery<Employer> typedQuery = entityManager.createQuery("select e from Employer e WHERE e.email = :email AND e.password = :password", Employer.class);
            return typedQuery
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .getSingleResult();
        } catch (NoResultException e) {
            throw new InvalidParameterException("User is not found in the database");
        }
    }

    public void shutdown() {
        entityManager.close();
        emFactory.close();
    }
}
