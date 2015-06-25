<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body>

</body>
</html>



<!-- ONE STEP TO INSTALL PLEASE WAIT MESSAGE:



  1.  Copy the coding into the BODY of your HTML document  -->



<!-- STEP ONE: Paste this code into the BODY of your HTML document  -->



<BODY>



<!-- This script and many more are available free online at -->

<!-- The JavaScript Source!! http://javascript.internet.com -->

<!-- Original:  Joseph McLaughlin (joe.mclaughlin@comcast.net) -->

<!-- Web Site:  http://solutionenterprises.com -->

		<script language="javascript">

		function do_totals1()

		{

		document.all.pleasewaitScreen.style.pixelTop = (document.body.scrollTop + 50);

		document.all.pleasewaitScreen.style.visibility="visible";

		window.setTimeout('do_totals2()',1);

		}	

		

		function do_totals2()

		{

		lengthy_calculation();

		document.all.pleasewaitScreen.style.visibility="hidden";

		}

		

		function lengthy_calculation()

		{

		var x,y

		

		for(x=0;x<1000000;x++)

			{

			y += (x * y) / (y - x);			

			}

		}

		</script>

		<DIV ID="pleasewaitScreen" STYLE="position:absolute;z-index:5;top:30%;left:42%;visibility:hidden">

			<TABLE BGCOLOR="#000000" BORDER="1" BORDERCOLOR="#000000" CELLPADDING="0" CELLSPACING="0" HEIGHT="100" WIDTH="150" ID="Table1">

				<TR>

					<TD WIDTH="100%" HEIGHT="100%" BGCOLOR="silver" ALIGN="CENTER" VALIGN="MIDDLE">

						<FONT FACE="Arial" SIZE="4" COLOR="blue"><B>Calculating<br>

								Please Wait</B></FONT>

					</TD>

				</TR>

			</TABLE>

		</DIV>

		
		<p align="center">

			<input type="button" name="btn_calc" value="Perform Calculation" onclick="do_totals1()">

		</p>



