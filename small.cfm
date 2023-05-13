<!doctype html>
<html>
<head>
	<title>Small Panel</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@svgdotjs/svg.js@3.0/dist/svg.min.js"></script>
</head>
<body>
	<script>
		SVG.on(document, 'DOMContentLoaded', function() {
			var circ = SVG('#graycirc').fill('#f06')

			var rect = SVG('#leftgleis1').fill('#f06')

			var list = SVG.find('g').fill('#f06')
		})
	</script>

	<form>
		<div class="form-check">
			<input class="form-check-input" type="checkbox" value="" id="gleis1">
			<label class="form-check-label" for="flexCheckDefault">
				Gleis 1
			</label>
		   </div>
		   <div class="form-check">
			<input class="form-check-input" type="checkbox" value="" id="gleis2">
			<label class="form-check-label" for="flexCheckChecked">
				Gleis 2
			</label>
		</div>
	</form>

	<svg id="svg" width="600" height="300">

		<!-- Inner loop-->
		<circle cx="65" cy="30" r="3.5" fill="gray" id="graycirc" />
		<g id="leftgleis1">
			<circle cx="65" cy="60" r="3.5" fill="orange" />
			<circle cx="65" cy="90" r="3.5" fill="orange" />
			<circle cx="65" cy="120" r="3.5" fill="orange" />
			<circle cx="81" cy="164" r="3.5" fill="orange" />
			<circle cx="125" cy="180" r="3.5" fill="orange" />
		</g>
	</svg>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>


