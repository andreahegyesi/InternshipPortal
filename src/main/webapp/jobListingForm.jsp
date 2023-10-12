<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.repository.JpaEmployerRepository" %>
<%@ page import="com.model.Employer" %>

<html>

 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Internship portal</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<body>

<nav class="navbar navbar-dark bg-dark">
  <!-- Navbar content -->
</nav>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<div class="container-fluid">
<h1>Add a new job</h1>
<form action="createNewJobListing.jsp">

		<div class="form-group" >
			<label for="exampleFormControlInput1">Name</label>
			 <input type="text" class="form-control" name = "name" id="exampleFormControlInput1">
		</div>

        <div class="form-group">
            <label for="exampleFormControlSelect1">Experience</label>
            <select class="form-select" name = "experience" aria-label="Default select example">
			<option selected></option>
              <option value="Entry-level">Entry-level</option>
              <option value="Junior">Junior</option>
              <option value="Mid-level">Mid-level</option>
              <option value="Senior">Senior</option>
            </select>
            </select>
        </div>

        <div class="form-group" >
            <label for="exampleFormControlInput1">Description</label>
             <input type="text" class="form-control" name = "description" id="exampleFormControlInput1">
        </div>

  <br>
   <button type="submit" class="btn btn-warning">Post this job</button>
</form>

</body>
</html>