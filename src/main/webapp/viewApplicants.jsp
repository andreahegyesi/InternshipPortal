<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaEmployerRepository" %>
<%@ page import="com.repository.JpaApplicantRepository" %>
<%@ page import="com.repository.JpaJobListingRepository" %>
<%@ page import="com.model.Employer" %>
<%@ page import="com.model.Applicant" %>
<%@ page import="com.model.JobListing" %>

<% String id = request.getParameter("id");
   JpaJobListingRepository jobListingRepository = new JpaJobListingRepository();
   JobListing jobListing = jobListingRepository.findJobListingById(Integer.parseInt(id));
%>

<html>
 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Workout Application</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<body>
<center>
     <h1>List of applicants for the <%=jobListing.getName()%> job</h1>
<br>
<br>
        <table class="table">
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone number</th>
                <th>Email Address</th>
                <th>Address Line 1</th>
                <th>Address Line 2</th>
                <th>Country</th>
                <th>State</th>
                <th>City</th>

            </tr>
      <% if(jobListing.getApplicantList() != null){
                   for (Applicant applicant : jobListing.getApplicantList()) { %>
                              <tr>
                                  <td><%= applicant.getFirstName() %></td>
                                  <td><%= applicant.getLastName() %></td>
                                  <td><%= applicant.getPhoneNumber() %></td>
                                  <td><%= applicant.getEmailAddress() %></td>
                                  <td><%= applicant.getAddressLine1() %></td>
                                  <td><%= applicant.getAddressLine2() %></td>
                                  <td><%= applicant.getCountry() %></td>
                                  <td><%= applicant.getState() %></td>
                                  <td><%= applicant.getCity() %></td>

                              </tr>
                         <% }
            }
            else{%>
               <p> No applicants yet</p>
            <%}%>
        </table>
<br>
<br>
          <a  href= <%="showJobListings.jsp?employer=" + "1"%> >Back to Jobs</a>

         </center>
</body>
</html>

