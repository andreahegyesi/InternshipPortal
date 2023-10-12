<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<html>

 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Workout Application</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<body>
<div class="bg-image"
     style="background-image: url('https://img.freepik.com/free-photo/abstract-smooth-orange-background-layout-design-studio-room-web-template-business-report-with-smooth-circle-gradient-color_1258-71531.jpg?w=1800&t=st=1697119839~exp=1697120439~hmac=83c166a5991122c14bf012390227131abb0e536f3215aa1fa4d2092aeec04251');
            height: 150vh">

   <main class="form-signin w-50 m-auto">
    <h1 class="h3 mb-3 fw-normal text-center" ><br>Welcome back!</h1>
         <form action="login" method="post">
           <div class="form-floating">
             <input type="text" class="form-control" name="email" id="floatingInput" placeholder="name@example.com" required>
             <label for="floatingInput">Email address</label>
           </div>
            <br>
           <div class="form-floating">
             <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="Password" required><br>
             <label for="floatingPassword">Password</label>
           </div>

           <button class="btn btn-warning w-100 py-2" type="submit">Sign in</button>
         </form>


        <h1 class="h3 mb-3 fw-normal text-center" ><br>New user?</h1>
     <a  href= "employerForm.jsp">
         <button class="btn btn-warning w-100 py-2" type="submit">Create new Employer account</button>
     </a>

    <br><br>

         <a  href= "applicantForm.jsp">
              <button class="btn btn-warning w-100 py-2" type="submit">Create new Applicant account</button>
          </a>
    <p class="mt-5 mb-3 text-body-secondary">&copy; 2023 Hegyesi Andrea - andrea.hegyesi1@gmail.com</p>

   </main>
   </div>
</body>
</html>

