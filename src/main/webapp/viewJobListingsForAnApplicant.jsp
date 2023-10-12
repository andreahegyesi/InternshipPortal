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
     <title>Internship Portal</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<body>
      <% JpaApplicantRepository applicantRepository = new JpaApplicantRepository();
          Applicant applicant = applicantRepository.findApplicantByEmail(request.getSession().getAttribute("user").toString()); %>
<center>
     <h1>List of jobs for the applicant <%=applicant.getFirstName() + " " + applicant.getLastName()%> </h1>
<br>
<br>

        <table class="table">
            <tr>
                <th>Job</th>
                <th>Employer</th>
                <th>Experience</th>
            </tr>

      <%JpaJobListingRepository jobListingRepository = new JpaJobListingRepository();
      List<JobListing> jobs = jobListingRepository.getAllJobListings();
                   for (JobListing jobListing : jobs) {
                       if (jobListing.getApplicantList().contains(applicant)){%>
                              <tr>
                                  <td><%= jobListing.getName() %></td>
                                  <td><%= jobListing.getEmployer().getName() %></td>
                                  <td><%= jobListing.getExperience() %></td>
                              </tr>

            <%}}%>
        </table>
<br>
<br>
          <a  href="showJobListings.jsp" >Back to Jobs</a>

         </center>
</body>
</html>

