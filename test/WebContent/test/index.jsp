<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<title>HelloWorld</title>
<style type="text/css">
table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
}
</style>
<script src="jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	window.onload = function ()
    {
	   var table = document.getElementById ('table');
	   var tbody = table.tBodies[0];
	   var rows = tbody.rows;
	   var cells = rows[0].cells;
	   for ( var j = 0; j < cells.length; j++)
	   {
	   	cells[j].onclick = function ()
		   {
			   var asc = this.asc = !!this.asc ? -this.asc : -1;
			   var array = [];
			   array.index = this.cellIndex;
			   for ( var i = 1; i < rows.length; i++)
			   {
				   array.push (rows[i]);
			   }
			   array.sort (function (a, b)
			   {
				   var n1 = a.cells[array.index].firstChild.nodeValue;
				   var n2 = b.cells[array.index].firstChild.nodeValue;
				   if (n1 > n2)
				   {
					   return asc;
				   }
				   else if (n1 < n2)
				   {
					   return -asc;
				   }
				   else
				   {
					   return 0;
				   }
			   });
			   
			   for ( var i = 0; i < array.length; i++)
			   {
			   	tbody.appendChild (array[i]);
			   }
		   }
	   }
    }
</script>
</head>
<body style="text-align: center;">
	<table id="table">
		<tr>
			<td>编号</td>
			<td>姓名</td>
		</tr>
		<tr>
			<td>1</td>
			<td>李勇</td>
		</tr>
		<tr>
			<td>2</td>
			<td>张博</td>
		</tr>
		<tr>
			<td>3</td>
			<td>刘海</td>
		</tr>
		<tr>
			<td>4</td>
			<td>趁早</td>
		</tr>
	</table>
</body>
</html>