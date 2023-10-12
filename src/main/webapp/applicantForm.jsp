<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.model.Applicant" %>

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
<h1>Applicant Registration Form</h1>
<h3>Contact Information</h3>
<form action="createNewApplicant.jsp">
 <div class="row">

		<div class="col">
        <div class="form-group" >
            <label for="exampleFormControlInput1">First Name</label>
             <input type="text" class="form-control" name = "firstname" id="exampleFormControlInput1">
        </div>
		</div>

		<div class="col">
		<div class="form-group" >
			<label for="exampleFormControlInput1">Last Name</label>
			 <input type="text" class="form-control" name = "lastname" id="exampleFormControlInput1">
		</div>
		</div>

		<div class="row">

		<div class="col">
		<div class="form-group" >
			<label for="exampleFormControlInput1">Phone number</label>
			 <input type="tel" class="form-control" name = "phonenumber" id="exampleFormControlInput1">
		</div>
		</div>

		<div class="col">
		<div class="form-group" >
			<label for="exampleFormControlInput1">Email address</label>
			 <input type="email" class="form-control" name = "email" id="exampleFormControlInput1">
		</div>
		</div>
        <div class="form-group" >
            <label for="exampleFormControlInput1">Password</label>
             <input type="password" class="form-control" name = "password" id="exampleFormControlInput1">
        </div>

		</div>
<h3>Address</h3>

        <div class="form-group" >
            <label for="exampleFormControlInput1">Address Line 1</label>
             <input type="text" class="form-control" name = "addressline1" id="exampleFormControlInput1">
        </div>

        <div class="form-group" >
            <label for="exampleFormControlInput1">Address Line 2</label>
             <input type="text" class="form-control" name = "addressline2" id="exampleFormControlInput1">
        </div>

		<div class="row">

		<div class="col">
        <div class="form-group">
            <label for="exampleFormControlSelect1">Country</label>
            <select class="form-select" name = "country" aria-label="Default select example">
			<option selected></option>
              <option value="Romania">Romania</option>
              <option value="Hungary">Hungary</option>
              <option value="Germany">Germany</option>
            </select>
            </select>
        </div>
		</div>

		<div class="col">
        <div class="form-group">
            <label for="exampleFormControlSelect1">State</label>
            <select class="form-select" name = "state" aria-label="Default select example">
              <option selected></option>
              <option value="State1">State1</option>
              <option value="State2">State2</option>
              <option value="State3">State3</option>
            </select>
            </select>
        </div>
		</div>

		<div class="col">
        <div class="form-group">
            <label for="exampleFormControlSelect1">City</label>
            <select class="form-select" name = "city" aria-label="Default select example">
              <option selected></option>
              <option value="Cluj Napoca">Cluj Napoca</option>
              <option value="Oradea">Oradea</option>
              <option value="Bucuresti">Bucuresti</option>
            </select>
            </select>
        </div>
		</div>
		</div>

  <br>
  <br>
  <br>
   <button type="submit" class="btn btn-warning">Join Us</button>
</form>

</body>
</html>