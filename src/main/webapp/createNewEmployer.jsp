<%@ page import="com.model.Employer" %>
<%@ page import="com.model.JobListing" %>
<%@ page import="com.repository.JpaEmployerRepository" %>
<%@ page import="com.repository.JpaJobListingRepository" %>
<%@ page import="java.util.*" %>
<%@ page import= "java.util.stream.Collectors" %>

<%
  String name = request.getParameter("name");

  String address = request.getParameter("address");

  String email = request.getParameter("email");

  String password = request.getParameter("password");

  Employer employer = new Employer(name, address, email, password);
  JpaEmployerRepository employerRepository = new JpaEmployerRepository();
  employerRepository.addEmployer(employer);
  employerRepository.shutdown();

%>

  <meta http-equiv="Refresh" content="0; url='/InternshipPortal/employerForm.jsp" />
