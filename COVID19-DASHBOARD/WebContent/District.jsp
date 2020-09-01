<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="style_1.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  
	
<title>DISTRICT WISE CASES</title>
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
<!-- 
	<div class="topnav">
  		<a class="active" href="./Dashboard.html">Home</a>
  		<a href="./CasesStateWise.html">State Wise</a>
  		<a href="./Telangana.html">Telangana</a>
  		
	</div>-->
	
	<nav>
      <input type="checkbox" id="check">
      <label for="check" class="checkbtn">
        <i class="fas fa-bars"></i>
      </label>
      <label class="logo">COVID-19 DASHBOARD</label>
      <ul>
        <li><a  href="home.html">Home</a></li>
        <li><a  href="state.jsp">INDIA</a></li>
        <li class="sub-menu"><a class="active" href="#">STATE</a>
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
			<h1 class="title">DISTRICT WISE COVID-19 CASES IN TELANGANA</h1>
		</div>
		<br>
		<div class="table-responsive">
			<table class="table table-bordered table-striped text-center" id="tbT">
				<th>LAST UPDATEDTIME</th>
				<th>STATE</th>
				<th>CONFIRMED CASES</th>
				<th>ACTIVE CASES</th>
				<th>RECOVERED CASES</th>
				<th>DEATHS</th>
			</table>
		</div>
		<br>
		<hr>
		<br>
		<div class="table-responsive">
			<h3 class="text-center"> District wise cases in Telangana</h3>
			<br>
			<table class="table table-bordered table-striped text-center" id="tbTel">
				<th>District</th>
				<th>Confirmed</th>
				<th>New Confirmed</th>
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
        		for(var s=0;s<obj['statewise'].length;s++)
        	    {
        	    	if(obj['statewise'][s]['state']=="Telangana")
        	    	{
        	    		var z=tbT.insertRow();

        	    		z.insertCell(0);
						tbT.rows[1].cells[0].innerHTML= obj['statewise'][s]['lastupdatedtime'];
						tbT.rows[1].cells[0].style.background='#7a4a91';
						tbT.rows[1].cells[0].style.color='#fff';

						z.insertCell(1);
						tbT.rows[1].cells[1].innerHTML= obj['statewise'][s]['state'];
						tbT.rows[1].cells[1].style.background='#9cc850';

						z.insertCell(2);
						tbT.rows[1].cells[2].innerHTML= obj['statewise'][s]['confirmed'];
						tbT.rows[1].cells[2].style.background='#4bb7d8';

						z.insertCell(3);
						tbT.rows[1].cells[3].innerHTML= obj['statewise'][s]['active'];
						tbT.rows[1].cells[3].style.background='#f36e23';

						z.insertCell(4);
						tbT.rows[1].cells[4].innerHTML= obj['statewise'][s]['recovered'];
						tbT.rows[1].cells[4].style.background='#4bb7d8';

						z.insertCell(5);
						tbT.rows[1].cells[5].innerHTML= obj['statewise'][s]['deaths'];
						tbT.rows[1].cells[5].style.background='#9cc850';

        	    	}
        	    }
        	});

        	fetch('https://api.covidindiatracker.com/state_data.json').then(function (response)
        		{
        		    return response.json();
        		})
				.then(function (jsdata1)
        		{

				var tbTel=document.getElementById('tbTel');

				for(var i=1;i<(jsdata1[8]['districtData'].length);i++)
				{
					var x=tbTel.insertRow();
					x.insertCell(0);
					tbTel.rows[i].cells[0].innerHTML= jsdata1[8]['districtData'][i-1].name;
					//xlables.push(jsdata1[7]['districtData'][i-1].name);
					tbTel.rows[i].cells[0].style.background='#7a4a91';
					tbTel.rows[i].cells[0].style.color='#fff';
			
					x.insertCell(1);
					tbTel.rows[i].cells[1].innerHTML= jsdata1[8]['districtData'][i-1].confirmed;
					//ylables.push(jsdata1[7]['districtData'][i-1].confirmed);
					tbTel.rows[i].cells[1].style.background='#9cc850';
			
					x.insertCell(2);
					tbTel.rows[i].cells[2].innerHTML= jsdata1[8]['districtData'][i-1].oldConfirmed;
					tbTel.rows[i].cells[2].style.background='#4bb7d8';
				}
			});

	</script>
</body>
</html>
