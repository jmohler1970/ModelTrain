<!doctype html>
<html>
<head>
	<title>South control Panel</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@svgdotjs/svg.js@3.0/dist/svg.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="tools.js"></script>
</head>
<body>
	<script>
		directedPath = [0,0] // where the power is going
		switchPath = 0

		const switchPatterns = [
			["", 12, [-81, 11]],
			["", 13, [-71, 12]],
			["", 14, [-102, -302, 13, 14]],

			["", 22, [-63, -62, -61, -51, -41, 21]],
			["", 23, [-31, 22, 24]], // bidirectional
			// 24 is missing a button so 25 will do 24
			["", 25, [-102, 24]],

			["", 31, [-32, -23, 22, 302]],
			["", 32, [-302, 31]],

			["", 41, [-63, -62, -51, 	-22, 21, 61]],
			["", 51, [-63, 		-41, -22, 21, 61, 62]],
			["", 63, [ 		-51, -41, -22, 21, 61, 62]],

			["", 71, [-13, 12]],
			["", 81, [-12, 11]]
		]

		const fillPatterns = [
			["", 					11, [-71,			12],			13],
			["", 					11, [-102, -71,	12, 13],		14],
			["", 					11, [			12, 13, 102],	25],
			["Inner west to stu",		11, [-13, 12],					71],
			["Inner west to return loop", 11, [-12],					81],

			["", 					12, [-102,		    13],		14],
			["", 					12, [			13, 102],		25],
			["", 					12, [-13],					71],

			["", 					13, [-71, -14, 102],			25],

			["Turn off crossover", 		14, [-102]],

			/////
			["No Yard", 			21, [-63],						22],
			["", 				21, [-63, -31, 		  22],		23],
			["", 				21, [-63, -31, -302, -102, 22, 23],	24],
			["Full outer loop", 	21, [-63, -31, -302, -102, 22, 23, 24],	25],
			["", 				21, [-61, -23, 21],					31],
			["", 				21, [-61, -23, 22, 31],				32],
			["", 				21, [-22, 61],						41],
			["", 				21, [-22, 61, 62],					51],
			["", 				21, [-22, 61, 62],					61],


			["No Yard", 			22, [-63],						21],
			["", 				22, [	-31],					23],
			["", 				22, [	-31, -302, -102, 23],		24],
			["", 				22, [	-31, -302, -102, 23, 24],	25],

			["", 				23, [-63, -31, 		  22],		21],
			["", 				23, [	-302],		 			24],
			["", 				23, [	-302, -102, 24],			25],

			["", 				24, [-63, -31, -302, -102, 22, 23],	21],
			["", 				24, [	-31, -302, -102, 23],		22],
			["", 				24, [	-302],		 			23],
			["", 				24, [		 -102],				25],

			["", 				25, [			12, 13, 102],		11],
			["", 				25, [			13, 102],			12],
			["", 				25, [-71, -14, 102],				13],
			["Full outer loop", 	25, [-63, -31, -302, -102, 22, 23, 24],	21],
			["", 				25, [	-31, -302, -102, 23, 24],	22],
			["", 				25, [	-302, -102, 24],			23],
			["", 				25, [		 -102],				24],


			["", 				31, [		 -23]],
			["", 				31, [		 -102, 302, ],			24],
			["", 				31, [		 -102, 302, 24 ],		25],
			["", 				31, [		 -302 ],				32],

			["", 				32, [-61, -23, 22, 31],				21],
			["", 				32, [		 -302 ],				31],

			["Yard", 				41, [-22, 61],						21],
			["Yard", 				51, [-22, 61, 62],					21],
			["Yard", 				61, [-22, 61, 62],					21],

			["Inner west to stub", 	71, [-13, 12],						11],
			["", 				71, [-13],						12],

			["Inner west to return loop", 81, [-12],					11],
		];

		/*
		Switches
		When straight, it stays on its own track. Else diverge

		point1_8
		point1_7
		point1_2 (locked pair)
		point2_6
		point2_3
		point2_3 (again)
		point2_1 (locked pair)
		point3_2 (pair?)
		point4_6
		point5_6



		*/


		SVG.on(document, 'DOMContentLoaded', function() {
			console.log( "Ready!" );

			resetAll()

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

			SVG.find("g circle.manual").each(function(item) {
				item.click(function(item) {
					switchPath = item.target.parentNode.id.replace('gleis','').replace('_','');

					$("#switch").text(switchPath.toString());

					fillPath(["Myself", switchPath], [switchPath, switchPath]);
				})
			
			})

		
		}) // end ready
	</script>

	<button type="button" class="btn btn-sm btn-danger" onclick="resetAll()">X</button>


	<p>Directed Path: <tt id="current"></tt></p>
	<p>Switch button: <tt id="switch"></tt></p>
	<p></p>
	<p></p>

	<cfinclude  template="images/SouthModel400x300.svg">
</div>

	<h4>Buttons</h4>
	<ul>
		<li>Yellow once: Activate section</li>
		<li>Yellow twice: Toggle section</li>
		<li>Yellow different yellow: Activate path. Change switches</li>
		<li>Green: Move switch to this position. It will not change power unless auto routed power</li>
	</ul>

	<h4>LEDs</h4>
	<ul>
		<li>On track: Orange means powered</li>
		<li>On track: Blue means powered in reverse. Gleis 8 can do this</li>
		<li>Signal: Switch is moved + powered</li>
	</ul>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>


