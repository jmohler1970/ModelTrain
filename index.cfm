<cfscript>
	param url.mode = "";
</cfscript>

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

	<cfswitch expression="#url.mode#"> 
	<cfcase value="both">
		<style>
			svg#north {
				transform: rotate(180deg);
			}
		</style>
	</cfcase>
	<cfcase value="reverse">
		<style>
			svg#south {
				transform: rotate(180deg);
			}
		</style>
	</cfcase>
	</cfswitch>

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


		SVG.find("#north g circle.pack").each(function(item) {

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

	<cfinclude template="common/menu.cfm">




	<cfswitch expression="#url.mode#">
	<cfcase value="both">
		<cfinclude template="images/NorthModel_autopower.svg">
		<br />
		<cfinclude template="images/SouthModel_autopower.svg">
	</cfcase>
	<cfcase value="reverse">
		<cfinclude template="images/SouthModel_autopower.svg">
		<br />
		<cfinclude template="images/NorthModel_autopower.svg">
	</cfcase>
	<cfcase value="south">
		<h1>South</h1>
		<cfinclude template="images/SouthModel_autopower.svg">
	</cfcase>
	<cfdefaultcase>
		<h1>North</h1>
		<cfinclude template="images/NorthModel_autopower.svg">
	</cfdefaultcase>
	</cfswitch>

<h3>Controls and signals</h3>
<h4>Rocker switches</h4>
<ul>
	<li>Support North, South, and two person operation</li>
	<li>Allow turn around loop to work</li>
	<li>Can disable but not prefered</li>
</ul>

<h4>Matrix LED</h4>
<ul>
	<li>Graphical representation of track</li>
	<li>Shows powered sections<li>
	<li>Shows track switch positions: straight and diverge</li>
</ul>

<h4>Push buttons</h4>
<ul>
	<li>Alter powered sections and is prefered approach for this.<li>
	<li>Alter track switches</li>
	<li>My cycle through 3 options</li>
	<li>My cycle through 1 option</li>
</ul>

<h4>Track signals</h4>
<h5>Default</h5>
<ul>
	<li>RED: No power</li>
	<li>RED: Reverse power</li>
	<li>RED: Very recent train passed threw</li>
	<li>YELLOW: Recent train passed threw</li>
	<li>GREEN: Powered, correct direction, no recent trains.</li>
</ul>

<h4>Relay mapping (v2)</h4>
<ol>
	<li>Switch direct enable</li>
	<li>Switch diverge enable</li>
	<li>Switch</li>
	<li>Switch</li>
	<li>Switch</li>
	<li>Switch</li>
	<li>Switch</li>
	<li>Switch</li>
	<li><hr /></li>
	<li>Blank</li>
	<li>Blank</li>
	<li>Switch</li>
	<li>Switch</li>
	<li>Switch</li>
	<li>Switch</li>
	<li>Switch</li>
	<li>Switch</li>
</ol>

<ol>
	<li>Power - Orange</li>
	<li>Power 1 left</li>
	<li>Power 1 center</li>
	<li>Power 2 left</li>
	<li>Power 2 center</li>
	<li>Power - Green</li>
	<li>Power - Green</li>
	<li>Power - Blue</li>
</ol>

<p>In summary</p>
<ul>
	<li>2 for switch direction</li>
	<li>12 switches</li>
	<li>8 power sections</li>
</li>

<h4>5 section layout</h4>
<ol>
	<li><b>East:</b> 1050mm &times; 900mm = <span style="color : red">0.945&sup2;</span></li>
	<li><b>North:</b> <span style="color : red">1500mm</span> &times; 450mm = 0.675m&sup2;</li>
	<li><b>West:</b> 900mm &times; 900mm = 0.81&sup2;</li>
	<li><b>Central:</b> 1200mm &times; 750mm = 0.9&sup2;</li>
	<li><b>South:</b> <span style="color : red">1500mm</span> &times 300mm  0.45&sup2;</li>
</ol>

<p>Note: East is locked</p>

<hr>
<p>Obsolete</p>

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
			<li>These then feed into <q>16-Channel  Relay Module.</q> on the floor</li>

			<li>These then feed into <q>DIN Rail Mount Pluggable 12x2 
				Position 10A / 300V Screw Terminal Block Distribution Module.</q>
				on the ceiling
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
			<li>These then feed into <q>16-Channel  Relay Module.</q> on the floor</li>
			<li>These then feed into <q>DIN Rail Mount Pluggable 
				12x2 Position 10A / 300V Screw Terminal Block Distribution Module.</q>
				on the wall
			</li>
		</ul>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>