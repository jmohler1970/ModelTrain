<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Build Parts!</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

	<style>
	.dot {
		height: 10pt;
		width: 10pt;
		border-radius: 50%;
		display: inline-block;
	}
	</style>
</head>
<body>

	<cfinclude template="common/menu.cfm">


	<div class="container">



	<h1>Instuctions</h1>
	<h2>Buttons</h2>
	<dl>
		<dd><i class="dot" style="background-color : green"></i> Power</dd>
		<dd><i class="dot" style="background-color : orange"></i> Power on stub track</dd>
		<dd><i class="dot" style="background-color : black"></i> Send Message</dd>
		<dd><i class="dot" style="background-color : gray"></i> Set switch to straight</dd>
		<dd><i class="dot" style="background-color : blue"></i> Set switch to diverge</dd>
		<dd><i class="dot" style="background-color : red"></i> Stop!</dd>
	</dl>
	
	<h2>Sections</h2>
	<table class="table">
	<thead>
		<tr>
			<th></th>
			<th>Full name</th>
			<th>Inspiration</th>
			<th>Description</th>
			<th>IRL</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>T</th>
			<td>Trolley</td>
			<td>San Diego Trolley, San Diego & Imperial Valley</td>
			<td>At grade crossings with main line railroads but not unheard of</td>
			<td><a href="https://www.google.com/maps/@32.6364323,-117.0971009,3a,60y,276.92h,93.16t/data=!3m7!1e1!3m5!1sPumLNkPBLszNSJcQV5z01Q!2e0!6shttps:%2F%2Fstreetviewpixels-pa.googleapis.com%2Fv1%2Fthumbnail%3Fcb_client%3Dmaps_sv.tactile%26w%3D900%26h%3D600%26pitch%3D-3.1627266758765984%26panoid%3DPumLNkPBLszNSJcQV5z01Q%26yaw%3D276.91843420047604!7i16384!8i8192!5m1!1e4?entry=ttu&g_ep=EgoyMDI1MDExNS4wIKXMDSoASAFQAw%3D%3D">Link</a></td>
		</tr>
		<tr>
			<th>I</th>
			<td>Inner</td>
			<td>Union Pacific</td>
			<td>Old freight railroad that still performs point to point delivery. Zig-zags through industrial areas</td>
			<td><a href="https://www.google.com/maps/@33.8157711,-117.8599505,3a,55.6y,202.47h,90.31t/data=!3m7!1e1!3m5!1sT_oHTuVovV7ScHpsEBVQng!2e0!6shttps:%2F%2Fstreetviewpixels-pa.googleapis.com%2Fv1%2Fthumbnail%3Fcb_client%3Dmaps_sv.tactile%26w%3D900%26h%3D600%26pitch%3D-0.31238625895628047%26panoid%3DT_oHTuVovV7ScHpsEBVQng%26yaw%3D202.46747673151168!7i16384!8i8192!5m1!1e4?entry=ttu&g_ep=EgoyMDI1MDExNS4wIKXMDSoASAFQAw%3D%3D">Link</a></td>
		</tr>
		<tr>
			<th>R</th>
			<td>Reversing</td>
			<td>Union Pacific ex Southern Pacific</td>
			<td>Trains are inherently bi-directional, but there are a few reversing loops. This doubles as an additional siding for Inner</td>
			<td><a href="https://www.google.com/maps/@33.8290394,-117.9325638,3a,60y,9.02h,67.6t/data=!3m7!1e1!3m5!1s9q-BhOW7W1dJboVhzAI3CQ!2e0!6shttps:%2F%2Fstreetviewpixels-pa.googleapis.com%2Fv1%2Fthumbnail%3Fcb_client%3Dmaps_sv.tactile%26w%3D900%26h%3D600%26pitch%3D22.401503484190386%26panoid%3D9q-BhOW7W1dJboVhzAI3CQ%26yaw%3D9.02474395060753!7i16384!8i8192!5m1!1e4?entry=ttu&g_ep=EgoyMDI1MDExNS4wIKXMDSoASAFQAw%3D%3D">Link</a></td>
		</tr>
		<tr>
			<th>O</th>
			<td>Outer</td>
			<td>BNSF, Amtrak Pacific Surfliner</td>
			<td>Modern railroad that has fast commuter trains and intermodal freight. They had money to build over directly over valleys</td>
			<td><a href="https://www.google.com/maps/@33.7896773,-117.8577803,3a,60y,136.51h,84.55t/data=!3m7!1e1!3m5!1se82PxikJBQ2XgcBAFVe80A!2e0!6shttps:%2F%2Fstreetviewpixels-pa.googleapis.com%2Fv1%2Fthumbnail%3Fcb_client%3Dmaps_sv.tactile%26w%3D900%26h%3D600%26pitch%3D5.450738793525517%26panoid%3De82PxikJBQ2XgcBAFVe80A%26yaw%3D136.50934934372026!7i16384!8i8192!5m1!1e4?entry=ttu&g_ep=EgoyMDI1MDExNS4wIKXMDSoASAFQAw%3D%3D">Link</a></td>
		</tr>
	</tbody>	
	</table>

	<h2>Advanced</h2>


</div>

<script src="https://cdn.jsdeddvr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>