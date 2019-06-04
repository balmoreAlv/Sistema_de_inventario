<!doctype html>
<html>
<head>
<script type="text/javascript">

function imprimircliente() {



	var url='reportes.php?id='+document.getElementById('desde').value;

	return url;

}
</script>

</head>
<body>

<a href="javascript:window.open(imprimir())">
<img src="images/dclk.png" border=0>
</a>


<form>
	<input type="text" name="desde" id="desde">
</form>
</body>
</html>