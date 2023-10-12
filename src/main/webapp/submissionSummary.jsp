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
<center>
     <h1>Application successful!</h1>
<br>
<br>
     <h5>Submission Summary:</h5>
      <% JpaApplicantRepository applicantRepository = new JpaApplicantRepository();
          Applicant applicant = applicantRepository.findApplicantByEmail(request.getSession().getAttribute("user").toString()); %>

                                  First name: <%= applicant.getFirstName()%>
                                  <br>
                                  Last name: <%= applicant.getLastName() %>
                                  <br>
                                  Phone number: <%= applicant.getPhoneNumber() %>
                                  <br>
                                  Email: <%= applicant.getEmail() %>
                                  <br>
                                  Address: <%= applicant.getAddressLine1() + ", " + applicant.getAddressLine2() %>
                                  <br>
                                  Country: <%= applicant.getCountry() %>
                                  <br>
                                  State: <%= applicant.getState() %>
                                  <br>
                                  City: <%= applicant.getCity() %>
                                  <br>

<br>
<br>
          <a  href= "showJobListings.jsp">Back to Jobs</a>

         </center>
</body>
</html>



