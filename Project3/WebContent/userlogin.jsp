<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="/Project3/login.css" />
</head>
<body style="background-image:url(sky.jpg)">
<ul>
  <li><a class="active">Home</a></li>
  <li><a href="http://localhost:8080/Project3/userlogin.jsp">Predictor</a></li>
  <li><a href="http://localhost:8080/Project3/userlogin.jsp">Prediction</a></li>
  <li><a href="http://localhost:8080/Project3/lol.jsp">About</a></li>
</ul>

<form action="http://localhost:8080/Project3/Srvlet1" method="get">
    <div class="imgcontainer">
      <img src="DSC_01352.JPG" alt="Avatar" class="img">
    </div>
<p align="center"><font color="red">Incorrect Username or Password!</font></p>
  <div class="container">
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password (5 characters minimum)" name="psw" pattern=".{5,12}" required>

    <button type="submit"value="submit" name="subButton">Login</button>

    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" >
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a style="color:white"href="#">password?</a></span>
  </div>
 
</form>

</body>
</html>

