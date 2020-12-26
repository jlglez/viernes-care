<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Cliente</title>
		<script type="text/javascript" src="cliente.js"></script>
		<link rel="stylesheet" type="text/css" href="estilos.css">

	</head>
	<body>
		<header id="header" class="">
			<h1>Banco de pruebas de servicios ViernesCare</h1>			
		</header>
		<nav>
			<button class="boton" onclick="datosPac()" title="Introduce los datos en el campo 1">Datos de pacientes</button>
			<button class="boton" onclick="alta()" title="Introduce los datos en el campo 2">Alta paciente</button>
			<button class="boton" onclick="lista()" title="Fija los filtros en el campo 3">Listado pacientes</button>
			<button class="boton" onclick="datosRas()" title="Introduce el DNI en el campo 4">Datos pacienes Rast.</button>
			<button class="boton" onclick="modif()" title="Use el campo 4 para introducir el DNI">Modificar paciente</button>
			<button class="boton" onclick="histor()" title="Introduce el DNI en el campo 4">Historial paciente</button>
			<button class="boton" onclick="nota()">Agregar nota</button>
		</nav>
		<div id="formulario">
			<div>Campo 1</div>
			<label for="dni_paciente">DNI paciente (12345678X): <input type="text" name="dni_paciente" id="dni_paciente" required></label>
			<label for="codigo_acceso">Código de acceso (8 caracteres): <input type="text" name="codigo_acceso" id="codigo_acceso" required></label><br>
			<hr>
			<div>Campo 2</div>
			<form action="gestion/alta.php" id="alta" method="POST" enctype="multipart/form-data">
				<label for="id_usuario">Id usuario: <input type="text" name="id_usuario" id="id_usuario" required></label><br>
				<label for="nombre">Nombre: <input type="text" name="nombre" id="nombre"></label>
				<label for="apellido_1">Apellido: <input type="text" name="apellido_1" id="apellido_1"></label>
				<label for="apellido_2">Segundo apellido: <input type="text" name="apellido_2" id="apellido_2"></label><br>

				<label for="dni">DNI: <input type="text" name="dni" id="dni"></label>
				<label for="email">Email: <input type="email" name="email" id="email"></label>
				<label for="telefono">Telefono: <input type="text" name="telefono" id="telefono"></label><br>
				<div id="actualizar"><div>
				<label>Notas</label><br>
				<textarea id="nota" name="nota"></textarea><br>
			</form>

			<hr>

			<div>Campo 3</div>
			<label for="contagiado"><input type="checkbox" name="filtro" id="contagiado" value="contagiado" checked> Contagiado</label><br>
			<label for="curado"><input type="checkbox" name="filtro" id="curado" value="curado"> Curado</label><br>
			<label for="fallecido"><input type="checkbox" name="filtro" id="fallecido" value="fallecido"> Fallecido</label><br>
			<hr>

			<div>Campo 4</div>
			<label for="dni_rast">Dni del paciente: <input type="text" name="dni_rast" id="dni_rast"></label><br>
			<hr>
		</div>
		<div id="seccion">
		</div>

		
	</body>
</html>