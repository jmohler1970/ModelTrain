<!doctype html>
<html>
<head>
	<title>Control Panel box pieces</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@svgdotjs/svg.js@3.0/dist/svg.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="tools.js"></script>

		<style>
			#left svg#side {
				transform: scaleX(-1);
			}

			#right2top	svg {
				transform: scaleY(-1) scaleX(-1);
			}
			
			#left2top	svg {
				transform: scaleY(-1);
			}


			#left2back svg {
				transform: scaleY(-1) rotate(90deg);
			}

			#right2back svg {
				transform: rotate(270deg);
			}

			#left2front	svg {
				transform: rotate(90deg) scaleY(-1);
			}

			#right2front	svg {
				transform: rotate(90deg);
			}


			#front svg {
				transform: scaleY(-1);
			}
		</style>
</head>
<body>

<p><a href="https://sendcutsend.com/materials/mdf/">Send Cut Sent</a></p>

<p><a href="https://www.amazon.com/LitOrange-Standoff-Threaded-Motherboard-Assortment/dp/B07TP2YYQB/ref=pd_bxgy_vft_none_sccl_2/145-9978842-6093049?pd_rd_w=Vno3p&content-id=amzn1.sym.26a5c67f-1a30-486b-bb90-b523ad38d5a0&pf_rd_p=26a5c67f-1a30-486b-bb90-b523ad38d5a0&pf_rd_r=4KAAG1EH43PEDPVP61G3&pd_rd_wg=IOzYk&pd_rd_r=9c902c4e-eb05-4807-8427-e4595ebd202d&pd_rd_i=B07TP2YYQB&th=1">
See fasteners</a>
</p>

<!---
<p>https://international.optimas.com/technical-resources/tapping-sizes/</p>

<p>https://www.mathopenref.com/coordpolycalc.html</p>

<p>https://www.amazon.com/HVAZI-320pcs-Standoffs-assortment-Male-Female/dp/B06XKWDSPT/ref=sr_1_21?c=ts&keywords=Spacers+%26+Standoffs&qid=1684127329&s=industrial&sr=1-21&ts_id=16413321</p>
--->
<cfinclude  template="images/3mm.svg">

<table class="table-bordered">
<tr>
	<td id="left2top" align="right">
		<cfinclude  template="images/side.svg">
	</td>
	<td id="top" valign="bottom"><cfinclude  template="images/front_top.svg"></td>
	<td id="right2top">
		<cfinclude  template="images/side.svg">
	</td>
</tr>
<tr>
	<td id="left2back" width="33%" style="padding-top : 7px"><cfinclude  template="images/side.svg"></td>
	<td><cfinclude  template="images/back.svg"></td>
	<td id="right2back" style="padding-top : 7px"><cfinclude  template="images/side.svg"></td>
</tr>
<tr>
	<td id="left"><cfinclude  template="images/side.svg"></td>
	<td><cfinclude  template="images/floor.svg"></td>
	<td style="background : gainsboro"><cfinclude  template="images/side.svg"></td>
</tr>
<tr>
	<td id="left2front"><cfinclude  template="images/side.svg"></td>
	<td id="front" valign="top" style="padding-top : 26px"><cfinclude  template="images/front_top.svg"></td>
	<td id="right2front"><cfinclude  template="images/side.svg"></td>
</tr>
</table>

<p></p>
<p></p>


</body>
</html>