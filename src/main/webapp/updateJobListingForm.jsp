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

<div class="container-fluid">
<h1>Update Job</h1>

<form action="updateJob.jsp">

    <input type="hidden" name="id" value=<%=jobListing.getId()%> />

        <div class="form-group" >
        			<label for="exampleFormControlInput1">Name</label>
        			 <input type="text" class="form-control" name = "name" id="jobListingname" value=<%="\"" + jobListing.getName() + "\""%> >
        		</div>

                <div class="form-group">
                    <label for="exampleFormControlSelect1">Experience</label>
                    <select class="form-select" name = "experience" aria-label="Default select example">
        			<option selected><%=jobListing.getExperience()%></option>
                      <option value="Entry-level">Entry-level</option>
                      <option value="Junior">Junior</option>
                      <option value="Mid-level">Mid-level</option>
                      <option value="Senior">Senior</option>
                    </select>
                    </select>
                </div>

                <div class="form-group" >
                    <label for="exampleFormControlInput1">Description</label>
                     <input type="text" class="form-control" name = "description" id="jobListingDescription" value=<%="\"" + jobListing.getDescription() + "\""%>>
                </div>
  <br>
   <button type="submit" class="btn btn-primary">Update job</button>
</form>
</div>

</body>
</html>
