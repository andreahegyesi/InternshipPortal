<%@ page import="com.model.JobListing" %>
<%@ page import="com.repository.JpaJobListingRepository" %>
<%@ page import="java.util.*" %>

<%@ page isErrorPage = "true" %>

<% String id = request.getParameter("id");
   JpaJobListingRepository jobListingRepository = new JpaJobListingRepository();
   jobListingRepository.deleteJobListing(Integer.parseInt(id));%>
  <meta http-equiv="Refresh" content="0; url='/InternshipPortal/showJobListings.jsp" />