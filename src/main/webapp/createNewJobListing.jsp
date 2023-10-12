<%@ page import="com.model.Employer" %>
<%@ page import="com.model.Applicant" %>
<%@ page import="com.model.JobListing" %>
<%@ page import="com.repository.JpaEmployerRepository" %>
<%@ page import="com.repository.JpaApplicantRepository" %>
<%@ page import="com.repository.JpaJobListingRepository" %>
<%@ page import="java.util.*" %>
<%@ page import= "java.util.stream.Collectors" %>

<%
  String name = request.getParameter("name");
  String experience = request.getParameter("experience");
  String description = request.getParameter("description");

  JpaEmployerRepository employerRepository = new JpaEmployerRepository();
  Employer employer = employerRepository.findEmployerByEmail((request.getSession().getAttribute("user").toString()));
  JobListing jobListing = new JobListing(name, experience, description, employer);
  JpaJobListingRepository jobListingRepository = new JpaJobListingRepository();
  jobListingRepository.addJobListing(jobListing);
  jobListingRepository.shutdown();
%>
  <meta http-equiv="Refresh" content="0; url='/InternshipPortal/showJobListings.jsp" />