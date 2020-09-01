<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/maps/highmaps.js"></script>
<script src="https://code.highcharts.com/maps/modules/exporting.js"></script>
<script src="https://code.highcharts.com/mapdata/countries/in/in-all.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/maps/highmaps.js"></script>
<script src="https://code.highcharts.com/maps/modules/exporting.js"></script>
<script src="https://code.highcharts.com/mapdata/countries/in/in-all.js"></script>
<title>Charts</title>
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
</head>

<body>
	<!--
	<div class="topnav">
  		<a class="active" href="#home">Home</a>
  		<a href="./CasesStateWise.html">State Wise</a>
  		<a href="./Telangana.html">Telangana</a>
  		-->
  		
  		
  		<!--
		<a href="./about.html">About</a>
  		<a href="#contact">Contact</a>
  		<div class="login-container">
    		<form action="/action_page.php">
      		<input type="text" placeholder="Username" name="username">
      		<input type="text" placeholder="Password" name="psw">
      		<button type="submit">Login</button>
    		</form>
  		</div>-->
	</div>

	<section class="corona_update container-fluid">
			<div class="mb-3">
				<h1 class="title">Covid19 Confirmed Cases in India</h3>
			</div>
			<div class="table-responsive">
			<h3 class="text-center"> Total cases in India</h3>
			<br>
			<table class="table table-bordered table-striped text-center" id="tbIndia">
				<th>lastupdatedtime</th>
				<th>confirmed</th>
				<th>active</th>
				<th>recovered</th>
				<th>deaths</th>
			</table>
		</div>
	</section>
	<br>
	<hr>
	<br>
	<!--  
	<div id="container"></div>
	<script>

		var data1=[];
		var active=[];
		var confirmed=[];
		var deaths=[];
		var recovered=[];
		//var len=0;
      
		fetch('https://api.covid19india.org/data.json').then(function (response)
        		{
        		    return response.json();
        		})
				.then(function (jsdata1)
        		{
        			console.log(jsdata1);

				for(var i=1;i<(jsdata1['statewise'].length);i++)
				{
					data1[i]=('in-'+(jsdata1['statewise'][i].statecode).toLowerCase());
					active[i]=jsdata1['statewise'][i].active;
					confirmed[i]=jsdata1['statewise'][i].confirmed;
					deaths[i]=jsdata1['statewise'][i].deaths;
					recovered[i]=jsdata1['statewise'][i].recovered;
				}

				var data=[];
				for(var i=0;i<data1.length;i++)
				{
					if(data1[i]=='in-gj')
					{
						data[i]=['in-2984',confirmed[i]];
					}
					else
					{
						data[i]=[data1[i],confirmed[i]];
					}
				}
				Highcharts.mapChart('container', 
				{
    				chart: 
    				{
    				    map: 'countries/in/in-all'
    				},

    				title: 
    				{
    				    text: 'Confirmed Cases in India'
    				},

    				subtitle: 
    				{
    				    text: '<a href="http://code.highcharts.com/mapdata/countries/in/in-all.js"/>'//</a>'
    				},

    				mapNavigation: 
    				{
    				    enabled: true,
    				    buttonOptions: 
    				    {
    	    			    verticalAlign: 'bottom'
    	    			}
    				},

    				colorAxis: 
    				{
    				    min: 1000
    				},

    				series: 
    				[{
    				    data: data,
    				    name: 'Confirmed cases',
    				    states: 
    				    {
    				        hover: 
    				        {
    				            color: '#4bb7d8'
    				        }
    				    },
    				    dataLabels: 
    	    			{
    	        			enabled: true,
    	        			format: '{point.name}'
    	    			}
    				}]
				});
			});	
	</script>-->
	<section class="corona_update container-fluid">
			<div class="mb-3">
				<center><h3 class="title"> Telangana District wise updates</h3></center>
			</div>
	</section>
	<canvas id="chart" width=100 height=1></canvas>

	<script>
		var xlables=[];
		const ylables=[];
		
		chartIt();
		async function chartIt()
		{
			await getCovidapi();
			/*var ctx = document.getElementById('chart').getContext('2d');*/
			var c = document.getElementById("chart");
			var ctx = c.getContext("2d");

			c.width=chart.width=window.innerWidth;
			c.height=300;

			var myChart = new Chart(ctx, 
			{
    		type: 'line',
    		data: 
    		{
        		labels: xlables,
        		datasets: [{
        		    label: "Covid19 Tracker in Telangana",
        		    data: ylables,
        		    //fill: false,
        		    backgroundColor: 'rgba(255, 99, 132, 0.2)',
        		    borderColor: 'rgba(255, 99, 132, 1)',
        		    borderWidth: 1
        		}]
    		},
    		options: 
    		{
    		    scales: {
    		        yAxes: [{
    		            ticks: {
    		                beginAtZero: true
    		            }
    		        }]
    		    }
    		}
			});

		}	

		async function getCovidapi()
		{
			const jsondata1=await fetch('https://api.covidindiatracker.com/state_data.json');
			const jsdata1=await jsondata1.json();
			console.log(jsdata1);

			for(var i=1;i<(jsdata1[8]['districtData'].length);i++)
			{
				xlables.push(jsdata1[8]['districtData'][i-1].name);
				ylables.push(jsdata1[8]['districtData'][i-1].confirmed);
			
			}
		}
		
		async function solution()
		{
			fetch('https://api.covid19india.org/data.json').then(function (response)
        	{
        	    return response.json();
        	})
        	.then(function (obj)
        	{
        	    console.log(obj);

        	    var statescount=obj['statewise'].length;
        	    //console.log(statescount);
            	
            	var i=1;
            	let confirmed=obj.statewise[1].active;
            	console.log(confirmed);

            		let LT=obj.statewise[0].lastupdatedtime;
					//let ST=obj.statewise[0].state;
					let CD=obj.statewise[0].confirmed;
					let AT=obj.statewise[0].active;
					let RD=obj.statewise[0].recovered;
					let D=obj.statewise[0].deaths;

					var tbIndia=document.getElementById('tbIndia');
					var y=tbIndia.insertRow();

						y.insertCell(0);
						tbIndia.rows[1].cells[0].innerHTML= LT;
						tbIndia.rows[1].cells[0].style.background='#7a4a91';
						tbIndia.rows[1].cells[0].style.color='#fff';

						y.insertCell(1);
						tbIndia.rows[1].cells[1].innerHTML= CD;
						tbIndia.rows[1].cells[1].style.background='#4bb7d8';

						y.insertCell(2);
						tbIndia.rows[1].cells[2].innerHTML= AT;
						tbIndia.rows[1].cells[2].style.background='#f36e23';

						y.insertCell(3);
						tbIndia.rows[1].cells[3].innerHTML= RD;
						tbIndia.rows[1].cells[3].style.background='#4bb7d8';

						y.insertCell(4);
						tbIndia.rows[1].cells[4].innerHTML= D;
						tbIndia.rows[1].cells[4].style.background='#9cc850';

				});
        }
        solution();
	</script>
</body>
</html>