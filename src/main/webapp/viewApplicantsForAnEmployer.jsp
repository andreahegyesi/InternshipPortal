<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaEmployerRepository" %>
<%@ page import="com.repository.JpaApplicantRepository" %>
<%@ page import="com.repository.JpaJobListingRepository" %>
<%@ page import="com.model.Employer" %>
<%@ page import="com.model.Applicant" %>
<%@ page import="com.model.JobListing" %>

<% JpaEmployerRepository employerRepository = new JpaEmployerRepository();
   Employer employer = employerRepository.findEmployerByEmail(request.getSession().getAttribute("user").toString()); %>

<html>
 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Internship Portal</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<body>
<center>
     <h1>List of applicants for the employer <%=employer.getName()%> </h1>
<br>
<br>
        <table class="table">
            <tr>
                <th>JobListing</th>
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
      <% if(employer.getEmployerJobList() != null){
                   for (JobListing jobListing : employer.getEmployerJobList()) {
                        for (Applicant applicant : jobListing.getApplicantList()) { %>
                              <tr>
                                  <td><%= jobListing.getName() %></td>
                                  <td><%= applicant.getFirstName() %></td>
                                  <td><%= applicant.getLastName() %></td>
                                  <td><%= applicant.getPhoneNumber() %></td>
                                  <td><%= applicant.getEmail() %></td>
                                  <td><%= applicant.getAddressLine1() %></td>
                                  <td><%= applicant.getAddressLine2() %></td>
                                  <td><%= applicant.getCountry() %></td>
                                  <td><%= applicant.getState() %></td>
                                  <td><%= applicant.getCity() %></td>

                              </tr>
                         <% }
            }
            }
            else{%>
               <p> No applicants yet</p>
            <%}%>
        </table>
<br>
<br>
          <a  href="showJobListings.jsp">Back to Jobs</a>

         </center>
</body>
</html>

