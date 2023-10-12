<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%@ page import="com.repository.JpaEmployerRepository" %>
<%@ page import="com.repository.JpaApplicantRepository" %>
<%@ page import="com.repository.JpaJobListingRepository" %>
<%@ page import="com.model.Employer" %>
<%@ page import="com.model.Applicant" %>
<%@ page import="com.model.JobListing" %>
<html>
 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Workout Application</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<body>

 <h1>List of Employers</h1>

    <table class="table">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Password</th>
            <th>Address</th>
            <th>Jobs</th>

        </tr>
  <% JpaEmployerRepository employerRepository = new JpaEmployerRepository();
      List<Employer> employers = employerRepository.getAllEmployers();
       if(employers != null){
               for (Employer employer : employers) { %>
                          <tr>
                              <td><%= employer.getId() %></td>
                              <td><%= employer.getName() %></td>
                              <td><%= employer.getEmail() %></td>
                              <td><%= employer.getPassword() %></td>
                              <td><%= employer.getAddress() %></td>
                              <td><%= employer.getEmployerJobList() %></td>

                          </tr>
                     <% }
        }
        else{%>
           <p> Table is empty </p>
        <%}%>
    </table>
<br/>
<br/>


<br/>
<br/>

<h1>List of Jobs</h1>

    <table class="table">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Experience</th>
            <th>Description</th>
            <th>Employer</th>
            <th>Applicants</th>
        </tr>
  <% JpaJobListingRepository jobListingRepository = new JpaJobListingRepository();
      List<JobListing> jobs = jobListingRepository.getAllJobListings();
       if(jobs != null){
               for (JobListing jobListing : jobs) { %>
                          <tr>
                              <td><%= jobListing.getId() %></td>
                              <td><%= jobListing.getName() %></td>
                              <td><%= jobListing.getExperience() %></td>
                              <td><%= jobListing.getDescription() %></td>
                              <td><%= jobListing.getEmployer().getName() %></td>
                              <td><%= jobListing.getApplicantList() %></td>
                          </tr>
                     <% }
        }
        else{%>
           <p> Table is empty </p>
        <%}%>
    </table>
    <br>
    <br>
     <h1>List of Applicants</h1>

        <table class="table">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone number</th>
                <th>Email Address</th>
                <th>Password</th>
                <th>Address Line 1</th>
                <th>Address Line 2</th>
                <th>Country</th>
                <th>State</th>
                <th>City</th>

            </tr>
      <% JpaApplicantRepository applicantRepository = new JpaApplicantRepository();
          List<Applicant> applicants = applicantRepository.getAllApplicants();
           if(applicants != null){
                   for (Applicant applicant : applicants) { %>
                              <tr>
                                  <td><%= applicant.getId() %></td>
                                  <td><%= applicant.getFirstName() %></td>
                                  <td><%= applicant.getLastName() %></td>
                                  <td><%= applicant.getPhoneNumber() %></td>
                                  <td><%= applicant.getEmail() %></td>
                                  <td><%= applicant.getPassword() %></td>
                                  <td><%= applicant.getAddressLine1() %></td>
                                  <td><%= applicant.getAddressLine2() %></td>
                                  <td><%= applicant.getCountry() %></td>
                                  <td><%= applicant.getState() %></td>
                                  <td><%= applicant.getCity() %></td>

                              </tr>
                         <% }
            }
            else{%>
               <p> Table is empty </p>
            <%}%>
        </table>
         <form action="index.jsp">
             <input type="submit" value="Back to home page"/>
         </form>
</body>
</html>



