<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaJobListingRepository" %>
<%@ page import="com.repository.JpaEmployerRepository" %>
<%@ page import="com.model.JobListing" %>
<%@ page import="com.model.Employer" %>

<html>
 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>InternshipPortal</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<body>

<% String user = "";
   int isEmployer = 0;
   if (request.getSession().getAttribute("user") != null) {
       user = request.getSession().getAttribute("user").toString();
       isEmployer = Integer.parseInt(request.getSession().getAttribute("isEmployer").toString());
   } %>

<% Enumeration<String> attributes = request.getSession().getAttributeNames();
               while (attributes.hasMoreElements()) {
                   String attribute = (String) attributes.nextElement();
                   System.out.println(attribute+" : " + request.getSession().getAttribute(attribute));
               }       %>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark" aria-label="Third navbar example">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">
             <img src="/InternshipPortal/images/job.png" alt="Bootstrap" width="30" height="24"> Internship Portal</a>

          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarsExample03">
            <ul class="navbar-nav me-auto mb-2 mb-sm-0">
              <li class="nav-item">
                <a class="nav-link" href="index.jsp">Home</a>
              </li>
              <%if (user.equals("admin@gmail.com")) {%>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Admin</a>
                      <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="internshipTable.jsp">Table view</a></li>
                      </ul>
                    </li>
                  <% }
                  %>

            <%
            if (request.getSession().getAttribute("user") != null) {%>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>
                <% } else response.sendRedirect("index.jsp");
                %>

          </ul>
        </div>
        <% if(isEmployer == 1){%>
            <a  href="jobListingForm.jsp" >
             <button type="button" class="btn btn-warning align-items-right"> Create new Job</button>
            </a>
            " "
            <a  href="viewApplicantsForAnEmployer.jsp">
             <button type="button" class="btn btn-warning align-items-right"> View your applicants</button>
            </a>
        <%}else{%>
            <a  href="viewJobListingsForAnApplicant.jsp">
             <button type="button" class="btn btn-warning align-items-right"> View your applications</button>
            </a>
            <%}%>
         <span class="badge badge-secondary">
              <%= user %>
            </span>
      </div>
          </div>

        </div>
      </nav>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>





<div class="album py-5 bg-body-tertiary">

 <%if(isEmployer == 1){%>
       <h1 class="h3 mb-3 fw-normal text-center" >Your job listings:</h1>
    <%}else{%>
       <h1 class="h3 mb-3 fw-normal text-center" >Apply to jobs:</h1>
 <%}%>

    <div class="container">

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <% JpaJobListingRepository jobListingRepository = new JpaJobListingRepository();
            List<JobListing> jobList = jobListingRepository.getAllJobListings();
            if(jobList != null){
                for (JobListing jobListing: jobList) { %>
                    <div class="col">
                    <div class="card">
                    <img class="card-img-top" src ="/InternshipPortal/images/job.png" alt="Image placeholder" style="object-fit:cover; width:150px; height:150px;">
                    <div class="card-body">
                        <h5 class="card-title"><%= jobListing.getName() %></h5>
                        <div class="d-flex gap-2 py-2">
                        <span class="badge text-bg-warning rounded-pill"><p class="card-text"><%= jobListing.getEmployer().getName() %></p></span>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">

                <%if(isEmployer == 1){%>
                    <div class="btn-group">
                        <a  href=<%= "viewJobListing.jsp?id=" + jobListing.getId()%>>
                            <button type="button" class="btn btn-sm btn-outline-primary">Details</button>
                        </a>
                        <a  href=<%= "viewApplicants.jsp?id=" + jobListing.getId()%>>
                            <button type="button" class="btn btn-sm btn-outline-primary">Applicants</button>
                        </a>
                        <a  href=<%= "updateJobListingForm.jsp?id=" + jobListing.getId() %>>
                            <button type="button" class="btn btn-sm btn-outline-primary">Update</button>
                        </a>
                        <a  href=<%= "deleteJobListing.jsp?id=" + jobListing.getId() %>>
                            <button type="button" class="btn btn-sm btn-outline-danger">Delete</button>
                        </a>
                    </div>
                <%}else{%>
                    <div class="btn-group">
                        <a  href=<%= "viewJobListing.jsp?id=" + jobListing.getId()%>>
                            <button type="button" class="btn btn-sm btn-outline-primary">Details</button>
                        </a>
                        <a  href=<%= "addApplicantToJobListing.jsp?id=" + jobListing.getId() %>>
                            <button type="button" class="btn btn-sm btn-outline-success">Apply</button>
                        </a>
                    </div>
                <%}%>

                    <small class="text-body-secondary"><%=jobListing.getId() %></small>
                    </div>
                       </div>
                          </div>
                            </div>
                     <% }
        }
        else{%>
           <p> No content </p>
        <%}%>
     </div>
     </div>
      </div>
</body>
</html>

