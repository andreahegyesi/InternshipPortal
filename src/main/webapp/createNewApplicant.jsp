<%@ page import="com.model.Applicant" %>
<%@ page import="com.model.Employer" %>
<%@ page import="com.model.JobListing" %>
<%@ page import="com.repository.JpaApplicantRepository" %>
<%@ page import="com.repository.JpaEmployerRepository" %>
<%@ page import="com.repository.JpaJobListingRepository" %>
<%@ page import="java.util.*" %>
<%@ page import= "java.util.stream.Collectors" %>

<%
  String firstName = request.getParameter("firstname");
  String lastName = request.getParameter("lastname");
  String phoneNumber = request.getParameter("phonenumber");
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  String addressLine1 = request.getParameter("addressline1");
  String addressLine2 = request.getParameter("addressline2");
  String country = request.getParameter("country");
  String state = request.getParameter("state");
  String city = request.getParameter("city");

  Applicant applicant = new Applicant(firstName, lastName, phoneNumber, email, password, addressLine1, addressLine2, country, state, city);
  JpaApplicantRepository applicantRepository = new JpaApplicantRepository();
  applicantRepository.addApplicant(applicant);
  applicantRepository.shutdown();

%>

  <meta http-equiv="Refresh" content="0; url='/InternshipPortal/index.jsp" />
