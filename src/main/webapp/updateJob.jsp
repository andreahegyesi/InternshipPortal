<%@ page import="com.model.JobListing" %>
<%@ page import="com.repository.JpaJobListingRepository" %>
<%@ page import="java.util.*" %>
<%@ page import= "java.util.stream.Collectors" %>

<%
  String id = request.getParameter("id");
  String name = request.getParameter("name");
  String experience = request.getParameter("experience");
  String description = request.getParameter("description");

  JpaJobListingRepository jobListingRepository  = new JpaJobListingRepository();
  jobListingRepository.updateJobListing(Integer.parseInt(id), name, experience, description);
%>

  <meta http-equiv="Refresh" content="0; url='/InternshipPortal/showJobListings.jsp" />