<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="style_1.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  

<title>State Wise COVID19-Cases</title>
</head>
<style>

		* {box-sizing: border-box;}
		body 
		{
  			margin: 0;
		}

		#container {
    	height: 500px; 
    	min-width: 310px; 
    	max-width: 800px; 
    	margin: 0 auto; 
	}
	.loading {
    	margin-top: 10em;
    	text-align: center;
    	color: gray;
	}

		h1
		{
			margin: 0;
			font-family: 'Roboto', sans-serif;
			font-weight: 300;
			text-align: center;
			padding-bottom: 20px;
			font-size: 200%;
		}
		.title
		{

			background: linear-gradient(to right,#feb47b,#ff7e5f);
			padding:15px;
		}

		
		
		.topnav 
		{
			  overflow: hidden;
			  background-color: #e9e9e9;
		}

		.topnav a 
		{
  			float: left;
  			display: block;
  			color: black;
  			text-align: center;
  			padding: 14px 16px;
  			text-decoration: none;
  			font-size: 17px;
		}

		.topnav a:hover 
		{
			background-color: #ddd;
  			color: black;
		}

		.topnav a.active 
		{
			background-color: #2196F3;
  			color: white;
		}

		.topnav .login-container 
		{
  			float: right;
		}

		.topnav input[type=text] 
		{
  			padding: 6px;
  			margin-top: 8px;
  			font-size: 17px;
  			border: none;
  			width:120px;
		}

		.topnav .login-container button 
		{
  			float: right;
  			padding: 6px 10px;
  			margin-top: 8px;
  			margin-right: 16px;
  			background-color: #555;
  			color: white;
  			font-size: 17px;
  			border: none;
  			cursor: pointer;
		}

		.topnav .login-container button:hover 
		{
  			background-color: green;
		}

		@media screen and (max-width: 600px) 
		{
  			.topnav .login-container {
    		float: none;
  		}
  		.topnav a, .topnav input[type=text], .topnav .login-container button 
  		{
    		float: none;
    		display: block;
    		text-align: left;
    		width: 100%;
    		margin: 0;
    		padding: 14px;
  		}
  		.topnav input[type=text] 
  		{
    		border: 1px solid #ccc;  
  		}
	}
</style>
<script type="text/javascript">
        function preventBack() 
        { 
          window.history.forward(); 
        }
        setTimeout("preventBack()", 0);
        //window.onunload = function () { null };
    </script>
</head>
<body>
	
	<nav>
      <input type="checkbox" id="check">
      <label for="check" class="checkbtn">
        <i class="fas fa-bars"></i>
      </label>
      <label class="logo">COVID-19 DASHBOARD</label>
      <ul>
        <li><a  href="home.html">Home</a></li>
        <li><a class="active" href="state.jsp">INDIA</a></li>
        <li class="sub-menu"><a href="#">STATE</a>
        	<ul>
        		<li><a href="District.jsp">TELANGANA</a></li>
        	</ul>
        </li>
        <li><a href="index.html">LOGOUT</a>
        <script>function () { null };</script>
        </li>
      </ul>
    </nav>
	
	<section class="corona_update container-fluid">
		<div class="my-4">
			<h1 class="title">State Wise COVID-19 Cases in India</h1>
		</div>
		<br>
		<div class="table-responsive">
			<table class="table table-bordered table-striped text-center" id="tbTelangana">
			
				<th>LAST UPDATED TIME</th>
				<th>STATE</th>
				<th>CONFIRMED CASES</th>
				<th>ACTIVE CASES</th>
				<th>RECOVERED CASES</th>
				<th>DEATHS</th>
			</table>
		</div>
	</section>
	<script>
			fetch('https://api.covid19india.org/data.json')
			.then(function (response)
        	{
        	    return response.json();
        	})
        	.then(function (obj)
        	{
        		var statescount=obj['statewise'].length;

        		var tbTelangana=document.getElementById('tbTelangana');
        	    for(var i=1;i<statescount;i++)
        	    {
        	    	var x=tbTelangana.insertRow();
        	    	if(obj['statewise'][i-1]['state']!="Total" && obj['statewise'][i-1]['state']!="State Unassigned")
        	    	{
        	    		x.insertCell(0);
						tbTelangana.rows[i].cells[0].innerHTML= obj['statewise'][i-1]['lastupdatedtime'];
						tbTelangana.rows[i].cells[0].style.background='#7a4a91';
						tbTelangana.rows[i].cells[0].style.color='#fff';

						x.insertCell(1);
						tbTelangana.rows[i].cells[1].innerHTML= obj['statewise'][i-1]['state'];
						tbTelangana.rows[i].cells[1].style.background='#9cc850';

						x.insertCell(2);
						tbTelangana.rows[i].cells[2].innerHTML= obj['statewise'][i-1]['confirmed'];
						tbTelangana.rows[i].cells[2].style.background='#4bb7d8';

						x.insertCell(3);
						tbTelangana.rows[i].cells[3].innerHTML= obj['statewise'][i-1]['active'];
						tbTelangana.rows[i].cells[3].style.background='#f36e23';

						x.insertCell(4);
						tbTelangana.rows[i].cells[4].innerHTML= obj['statewise'][i-1]['recovered'];
						tbTelangana.rows[i].cells[4].style.background='#4bb7d8';

						x.insertCell(5);
						tbTelangana.rows[i].cells[5].innerHTML= obj['statewise'][i-1]['deaths'];
						tbTelangana.rows[i].cells[5].style.background='#9cc850';
        	    	}
						
        	    }
        	})
        	.catch(function (error)
        	{
        	    console.error("Something went wrong...!");
        	    console.error(error);
        	});
	</script>
</body>
</html>