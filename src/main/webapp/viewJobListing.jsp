<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaJobListingRepository" %>
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

  <div class="b-example-divider"></div>

  <div class="container col-xxl-8 px-4 py-5">
    <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
      <div class="col-10 col-sm-8 col-lg-6">
        <img src ="/InternshipPortal/images/job.png" class="d-block mx-lg-auto img-fluid" alt="Bootstrap Themes" width="700" height="500" loading="lazy">
      </div>
      <div class="col-lg-6">
        <h1 class="display-5 fw-bold text-body-emphasis lh-1 mb-3"><%=jobListing.getName() %></h1>
        <h5>About The Role</h5>
        <p class="lead"><%=jobListing.getDescription() %></p>

        <h2><div class="d-grid gap-2 d-md-flex justify-content-md-start">
           <div class="d-flex gap-2 py-5">
           <h5>Posted By</h5>
                 <span class="badge text-bg-warning rounded-pill"><p class="card-text"><%= jobListing.getEmployer().getName() %></p></span>
            </div>
        </div> </h2>

        <h2><div class="d-grid gap-2 d-md-flex justify-content-md-start">
           <div class="d-flex gap-2 py-5">
           <h5>Experience Level</h5>
                 <span class="badge text-bg-warning rounded-pill"><p class="card-text"><%= jobListing.getExperience() %></p></span>
            </div>
        </div> </h2>


      </div>
    </div>
  </div>

<br/>
<br/>
      <a  href= <%="showJobListings.jsp?employer=" + "1"%> >Back to Jobs</a>
</body>
</html>
