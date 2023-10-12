<%@ page import="com.model.Applicant" %>
<%@ page import="com.model.JobListing" %>
<%@ page import="com.repository.JpaApplicantRepository" %>
<%@ page import="com.repository.JpaJobListingRepository" %>
<%@ page import="java.util.*" %>

<% String id = request.getParameter("id");



   JpaJobListingRepository jobListingRepository = new JpaJobListingRepository();
   JobListing jobListing = jobListingRepository.findJobListingById(Integer.parseInt(id));

   JpaApplicantRepository applicantRepository = new JpaApplicantRepository();
   Applicant applicant = applicantRepository.findApplicantByEmail(request.getSession().getAttribute("user").toString());

   jobListingRepository.addApplicantToJobListing(jobListing, applicant);

   response.sendRedirect("submissionSummary.jsp");
   %>

