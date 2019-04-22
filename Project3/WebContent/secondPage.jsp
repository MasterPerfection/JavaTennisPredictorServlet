<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Project3/Predictor.css" />
<title>Predictor</title>
<script type="text/javascript">

/***********************************************
* Limit number of checked checkboxes script- by JavaScript Kit (www.javascriptkit.com)
* This notice must stay intact for usage
* Visit JavaScript Kit at http://www.javascriptkit.com/ for this script and 100s more
***********************************************/

function checkboxlimit(checkgroup, limit){
	var checkgroup=checkgroup
	var limit=limit
	for (var i=0; i<checkgroup.length; i++){
		checkgroup[i].onclick=function(){
		var checkedcount=0
		for (var i=0; i<checkgroup.length; i++)
			checkedcount+=(checkgroup[i].checked)? 1 : 0
		if (checkedcount>limit){
			alert("You can only select YES or NO (Deseleect and select new choice)")
			this.checked=false
			}
		}
	}
}

</script>
</head>
<body style="background-image:url(sky.jpg)"> 


<ul>
  <li><a href="http://localhost:8080/Project3/index.html" >Home</a></li>
  <li><a class="active" href="http://localhost:8080/Project3/secondPage.jsp">Predictor</a></li>
  <li><a>Prediction</a></li>
  <li><a href="http://localhost:8080/Project3/lol.jsp">About</a></li>
</ul>
<form action="http://localhost:8080/Project3/DataServlet" method="get">
	<center>
		<img  src="TM logo.png" alt="Avatar" />
	</center>
<div>   
	<p>
		<img hspace="50" src="sl outlook.png" alt="SELECT OUTLOOK" >
		<img hspace="70" src="temp.png" alt="SELECT TEMPERATURE" >
		<img hspace="90" src="hum.png" alt="SELECT HUMIDITY" >
	</p>
	
  

			
			<span style="margin: 5%">   <label>  
			  <input type="radio" name="outlook" value="rainy" required> Rainy
			  <input type="radio" name="outlook" value="overcast"> Overcast
			  <input type="radio" name="outlook" value="sunny"style="margin-right: 20" > Sunny  
			    </label>
			</span>
				
			<span  class="slidecontainer" style="margin: 5%" > <input type="range" name ="temp"min="0" max="100"  class="slider" id="myRange"></span>
			
	
			<span style="margin: 5%;"><input type="number" name="hum" id="myInput" oninput="myFunction()" maxlength="2"  placeholder="0-100"required></span>
	 
	<p class = "">	
	    <span style="margin: 7%" >Current OutLook:  <span id="choice" ></span></span>
	    <span style="margin: 10%" >Current Temperature: <span id="value" ></span></span>
		<span style="margin: 7%">Current Humidity: <span id="demo"></span></span>
	</p>
	
	<script>
	(function (){
	    var radios = document.getElementsByName('outlook');
	    console.log(radios);
	    for(var i = 0; i < radios.length; i++){
	        radios[i].onclick = function(){
	            document.getElementById('choice').innerText = this.value;
	        }
	    }
	})();
	</script>
	
	<script>
	var slider = document.getElementById("myRange");
	var output = document.getElementById("value");
	output.innerHTML = slider.value;
	
	slider.oninput = function() {
	  output.innerHTML = this.value;
	}
	</script>
  <div>
	<script>
	function myFunction() {
	  var x = document.getElementById("myInput").value;
	  document.getElementById("demo").innerHTML=  x;
	}
	</script>

<p><strong>Is it windy ? (Yes/No)</strong></p>

<div id="world" name="world">

<input type="checkbox" name="wind" value="yes" /> YES<br />
<input type="checkbox" name="wind" value="no" /> NO<br />
</div>

<script type="text/javascript">
checkboxlimit(document.forms.world.wind, 1)

</script>

<center> <p class="btncontainer" >
    <button type="submit"value="Predict" name="predict">GET PREDICTION</button>
  </p> 
</center>
</div>
</form>
</body>
</html>
