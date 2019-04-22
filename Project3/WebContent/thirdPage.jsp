<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Prediction</title>
<link rel="stylesheet" type="text/css" href="/Project3/Pred_result.css" />
<style>
#grad1 {
  height: 100px;
  width: 50px;
  /* For browsers that do not support gradients */
  background-image: linear-gradient(#8080c0, rgba(255, 0, 0, 0.3)); /* Standard syntax (must be last) */
}
.h3 {
  text-shadow: 2px 1px purple;
}
</style>

</head>

<body style="background-image:url(sky.jpg)">

<ul>
  <li><a href="http://localhost:8080/Project3/index.html" >Home</a></li>
  <li><a href="http://localhost:8080/Project3/secondPage">Predictor</a></li>
  <li><a class="active" >Prediction</a></li>
  <li><a href="http://localhost:8080/Project3/lol.jsp">About</a></li>
</ul>

<center>
		<img  src="TM logo.png" alt="Avatar" />
	</center>


   <font size="+3"><center><strong>Here is your Prediction!</strong></center></font> <br>
<span style="margin: 10%;"><font size="+5" class="h3" id="grad1"><% String predict=(String)request.getAttribute("prediction"); %> 

 	 <%=predict %></font></span>
</div>

	
<div>
  <p>
  <span style="margin: 50%;">  Select a File <input type="file" id="fileToLoad">
    <button onclick="loadFileAsText()">Load</button> </span>
    	<br>
 	<span style="margin: 50%;">Select a weather option: 
 	<select id = "fileToLoad" name="opts"> 
 	  <option value="inputTextToSave"></option> 
 	  <option value="med">Medium</option> 
 	  <option value="high">High</option> 
 	  <option value="vhigh">Very High</option> 
 	</select> 
 	</span>
 	<br>
  
    </p>
    <span style="margin: 50%;">  <textarea id="inputTextToSave" style="height:200px;width:300px; " readonly></textarea></span>
	      <form action="http://localhost:8080/Project3/DataServlet" method="get" > 
	          	<center> <p >
	 	<button class="btncontainer2" type="submit"value="Pred_A" name="prd_A">PREDICT AGAIN</button>
	    <button class="btncontainer" type="submit"value="Done" name="done">DONE</button>
	  </p> 
	</center>
	  
          
          <script> 
    function loadFileAsText(){
	  var fileToLoad = document.getElementById("fileToLoad").files[0];
	  var fileReader = new FileReader();
	  fileReader.onload = function(fileLoadedEvent){
	      var textFromFileLoaded = fileLoadedEvent.target.result;
	      document.getElementById("inputTextToSave").value = textFromFileLoaded;
	  };

	  fileReader.readAsText(fileToLoad, "UTF-8");
	}</script>
 	
  

</body>
</html>





