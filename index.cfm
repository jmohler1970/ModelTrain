<!doctype html>
<html>
<head>
	<title>North Control Panel</title>
	<meta name="description" content="Our first page">
	<meta name="keywords" content="html tutorial template">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@svgdotjs/svg.js@3.0/dist/svg.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="tools.js"></script>

	<cfif url.keyExists("mode")>
		<style>
			svg#north {
				transform: rotate(180deg);
			}
		</style>
	</cfif>
</head>
<body>
	<script>
		directedPath = [0,0];

		const fillPatterns = [
			["Inner west side", 			11, [-102],							12],
			["Inner west to partial station only", 11, [-102,				12],			13],
			["Inner west full station", 		11, [-102,		-71,		12, 13],		14],
			["Full inner loop", 			11, [-102, -201,	-71, -62,	12, 13, 14],	15],
			["Inner west to pocket", 		11, [102], 							23],
			["Inner west to outer east", 		11, [-201, 102, 23, 24],					25],
			["Inner west to return loop", 	11, [-102, 				12, 13],		71],

			["Power station", 				12, [		-62,			    13],		14],
			["Inner east to full station", 	12, [-201, -62, 			    13, 14],	15],
			["Inner east to partial station only", 	12, [-14, 13],						71],

			["Inner east to partial station only", 	13, [-201, -71, 14],				15],
			["Inner east to partial station only", 	13, [-14],						71],

			["Power station", 				14, [		-62,			    13],		12],
			["Inner east side", 			14, [-201], 							15],

			["Full inner loop", 			15, [-102, -201,	-71, -62,	12, 13, 14],	11],
			["Inner east to full station", 	15, [-201, -62, 			    13, 14],	12],
			["Inner east to partial station only", 	15, [-201, -71, 14],				13],
			["Inner east side", 			15, [-201], 							14],
			["Inner east to outer west",		15, [-102, -14, -24, 201, 23, 22],			21],
			["Inner to station pocker", 		15, [201],							23],
			["Train-tram east", 			15, [-102, -63, 13, 14, 62],				61],

			/////
			["Station pocket west", 			21, [-102, 22],						23],
			["Full outer loop", 			21, [-102, -201, 22, 23, 24],				25],
			["Outer look to station 3", 		21, [-102, -52, 31],					32],

			["Station pocket west", 			23, [-102, 22],						21],
			["Inner west to pocket", 		23, [102], 							11],
			["Inner to station pocker", 		23, [201],							15],
			["Station 2 east", 				23, [-201, 24], 						25],

			["Full outer loop", 			25, [-102, -201, 22, 23, 24],				21],
			["Station 2 east", 				25, [-201, 24], 						23],
			["Inner yard east", 			25, [32,52], 							41],
			["Outer yard east", 			25, [32, 52], 							51],

			["Station 3 east half",			32, [-24]],
			["Outer look to station 3", 		32, [-102, -52, 31],					21],
			["Station 3 to inner yard", 		32, [52], 							41],
			["Station 3 to outer yard", 		32, [-41, 52], 						51],

			["Inner yard", 				41, [-31, -51, 52]],
			["Inner yard east", 			41, [32,52], 							25],
			["Station 3 to inner yard", 		41, [52], 							32],

			["Outer yard",					51, [-31, -41, 52]],
			["Outer yard east", 			51, [32, 52], 							25],
			["Station 3 to outer yard", 		51, [-41, 52], 						32],

			["Train-tram east", 			61, [-102, -63, 13, 14, 62],				15],
			["Train-tram return", 			61, [-12, -14, -63, 13],					71],
			["Tram shuttle", 				63, [61]],

			["Return loop", 				71, [-14, 13]],
			["Inner west to return loop", 	71, [-102, 				12, 13],		11],
			["Inner west to return loop", 	71, [-102, 				12, 13],		12],
			["Return to train-tram", 		71, [-12, -14, -63, 13],					61],
		];

	$( document ).ready(function() {
		console.log( "ready!" );


		SVG.find("g circle.pack").each(function(item) {

			item.click(function(item) {
				id = item.target.parentNode.id.replace('gleis','').replace('_','');
				directedPath.shift();
				directedPath.push(id);

				$("#current").text(directedPath.toString());

				fillPath(["Myself", directedPath[1]], [directedPath[1], directedPath[1]], true);

				for (fillPattern of fillPatterns) {
					fillPath(fillPattern, directedPath)
				}

			}) // end click
		})
	});
</script>

	<p><a href="South.cfm">South</a> <a href="?mode=both">Both</a></p>



	<p></p>
	<p></p>

	<cfinclude template="NorthModel400x300.svg">

	<cfif url.keyExists("mode")>
		<br>
		<cfinclude template="SouthModel400x300.svg">
	</cfif>

		<h3>Control levels</h3>
		<p>Inspiration: <a href="https://www.youtube.com/watch?v=jD2zFtpBCAw">Modelleisenbahn Club Flawil</a></p>
		<ol>
			<li><b>Yellow</b>: Go from here to here. Turn on and off power. Align switches</li>
			<li><b>Yellow with double press</b>: Toggle power</li>
			<li><b>Green</b>: Move switch, toggle power. Some places are too small to have button</li>
			<li><b>Blue</b>: Move switch</li>
			<li><b>White</b>: Ununcouple (reserved)</li>
		</ol>


		<h3>North Relay bank</h3>
		2 pairs of 8
		<ul>
			<li><b>Gleis 1 Power</b>
				<ul>
					<li>2 for power selecting with isolation.</li>
					<li>6 for track segments: 1-1, 1-2, 1-3, 1-4, 1-5, 6-3</li>
					<li>101, 102, 6-1, 6-2 are powered via routing
					<li>Return loop is managed by south
				</ul>
			</li>
			<li><b>Gleis 2  Power</b>
				<ul>
					<li>2 for power selecting with isolation.</li>
					<li>6 for track segments: 2-1, 2-3, 2-5, 3-1, 3-2, 5-2</li>
					<li>101, 102, 2-2, 2-4, 4-1, 5-1 are powered via routing
				</ul>
			</li>
			<li><b>Gleis 1 and gleis 6 switch</b>
				<ul>
					<li>2 for direction</li>
					<li>6 for switch motors
						<ul>
							<li>4 dedicated to gleis 1. We do control the turn around switch</li>
							<li>1 dedicated to gleis 6</li>
							<li>1 spare</li>
						</ul>
					</li>
				</ul>
			</li>
			<li><b>Gleis 2, 3, 4, 5</b>
				<ul>
					<li>2 for direction</li>
					<li>6 for switch motors
						<ul>
							<li>4 dedicated to gleis 2</li>
							<li>1 dedicated to gleis 3</li>
							<li>1 dedicated to gleis 5</li>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>