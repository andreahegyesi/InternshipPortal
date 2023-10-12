package com.controller;

import com.model.Applicant;
import com.model.Employer;
import com.repository.JpaApplicantRepository;
import com.repository.JpaEmployerRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.security.InvalidParameterException;

@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("showMyWorkouts.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        try {
            JpaApplicantRepository applicantRepository = new JpaApplicantRepository();
            Applicant applicant = applicantRepository.checkIfExists(email, password);

            session.setAttribute("user", applicant.getEmail());
            session.setAttribute("isEmployer", "0");
            response.sendRedirect("showJobListings.jsp");
        } catch (InvalidParameterException e1) {
            try {

                JpaEmployerRepository employerRepository = new JpaEmployerRepository();
                Employer employer = employerRepository.checkIfExists(email, password);

                session.setAttribute("user", employer.getEmail());
                session.setAttribute("isEmployer", "1");
                response.sendRedirect("showJobListings.jsp");
            } catch (InvalidParameterException e2) {
                session.setAttribute("status", "failed");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            };
        }
    }
}