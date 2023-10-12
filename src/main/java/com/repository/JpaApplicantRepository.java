package com.repository;
import com.model.Applicant;
import jakarta.persistence.*;

import java.security.InvalidParameterException;
import java.util.List;
public class JpaApplicantRepository {
    EntityManagerFactory emFactory = Persistence.createEntityManagerFactory("Hibernate_JPA");
    EntityManager entityManager = emFactory.createEntityManager();

    public List<Applicant> getAllApplicants() {
        TypedQuery<Applicant> typedQuery = entityManager.createQuery("select a from Applicant a", Applicant.class);
        List<Applicant> applicantList = typedQuery.getResultList();
        return applicantList;
    }

    public void addApplicant(Applicant applicant) {
        entityManager.getTransaction().begin();
        entityManager.persist(applicant);
        entityManager.getTransaction().commit();
    }

    public Applicant findApplicantById(int id) {
        Applicant applicant = entityManager.find(Applicant.class, id);
        return applicant;
    }

    public Applicant checkIfExists(String email, String password) {
        try {
            TypedQuery<Applicant> typedQuery = entityManager.createQuery("select a from Applicant a WHERE a.email = :email AND a.password = :password", Applicant.class);
            return typedQuery
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .getSingleResult();
        } catch (NoResultException e) {
            throw new InvalidParameterException("User is not found in the database");
        }
    }

    public Applicant findApplicantByEmail(String email) {
        try {
            TypedQuery<Applicant> typedQuery = entityManager.createQuery("select a from Applicant a WHERE a.email = :email", Applicant.class);
            return typedQuery
                    .setParameter("email", email)
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
