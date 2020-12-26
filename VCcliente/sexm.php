<?php 
$db = [
    'host' => 'localhost',
    'username' => 'root',
    'password' => '',
    'db' => 'miblog' //Cambiar al nombre de tu base de datos
];


function connect($db){
	try {
		$conn = new PDO("mysql:host={$db['host']};dbname={$db['db']}", $db['username'], $db['password']);

    	// set the PDO error mode to exception
    	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    	return $conn;
  	}
  	catch (PDOException $exception) {
    	exit($exception->getMessage());
  	}
}


$dbConn =  connect($db);

// $_SERVER['REQUEST_METHOD'] = 'DELETE';




if ($_SERVER['REQUEST_METHOD'] == 'GET'){

	if (isset($_GET['accion'])){
      
		switch ($_GET['accion']) {

            case 'entradas_10':
            	// recibe: nada
				// devuelve: listado de la 10 últimas entradas
                $sql = $dbConn->prepare("SELECT * FROM articulo ORDER BY fecha DESC LIMIT 10;");
                $sql->execute();
                $sql->setFetchMode(PDO::FETCH_ASSOC);
                header("HTTP/1.1 200 OK");
                $x=$sql->fetchAll();
                echo json_encode($x,JSON_INVALID_UTF8_IGNORE);
                exit();
                break;

            case 'categorias':
            	// recibe: nada
				// devuelve: todas las categorías            
                $sql = $dbConn->prepare("SELECT * FROM categoria;");
                $sql->execute();
                $sql->setFetchMode(PDO::FETCH_ASSOC);
                header("HTTP/1.1 200 OK");
                echo json_encode($sql->fetchAll(),JSON_INVALID_UTF8_IGNORE);
                exit();
                break;

            case 'entradas_10Xcat':
            	// recibe un filtro, que es una id_categoría.
				// devuelve todos los registros de la categoría pedida limitado a los 10 primeros más recientes
                $sql = $dbConn->prepare("SELECT * FROM articulo WHERE id_categoria=:cat ORDER BY fecha DESC LIMIT 10;");
                $sql->bindValue(':cat', $_GET["id_categoria"]);
                $sql->execute();
                $sql->setFetchMode(PDO::FETCH_ASSOC);
                header("HTTP/1.1 200 OK");
                echo json_encode($sql->fetchAll(),JSON_INVALID_UTF8_IGNORE);
                exit();
                break;

            case 'entredas_Xfecha':
	           	// recibe un nombre de usuario y un passwd
				// si existe el usuario, devuelve su id, nombre y rol y si no existe devuelve vacío.
            	$fecha1=$_GET["desde"];
            	if (isset($_GET["hasta"])) {
            		if ($_GET["hasta"]!=""){
            			$fecha2=$_GET["hasta"];
            		}
            		else {
            			$fecha2=date("Y-m-d H:i:s");
            		}
            	}

            	if ($fecha1>$fecha2) {
            		$swap=$fecha1;
            		$fecha1=$fecha2;
            		$fecha2=$swap;
            	}

                $sql = $dbConn->prepare("SELECT * FROM articulo WHERE fecha BETWEEN :fecha1 AND :fecha2 ORDER BY fecha DESC;");
                $sql->bindValue(':fecha1', $fecha1);
				$sql->bindValue(':fecha2', $fecha2);

                $sql->execute();
                $sql->setFetchMode(PDO::FETCH_ASSOC);
                header("HTTP/1.1 200 OK");
                echo json_encode($sql->fetchAll(),JSON_INVALID_UTF8_IGNORE);
                exit();
                break;
        }
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE'){
	// recibe: nombre, passwd e id_articulo. Para verificar que el usuario existe y tiene privilegios y el id del artículo a eliminar.
	// devuelve: imagen. El nombre de la imagen para que pueda ser eliminada en local

	if (isset($_GET)){
		// validamos usuario
		$sql = $dbConn->prepare("SELECT * FROM usuario WHERE nombre=:nombre AND passwd=:passwd;");
		$sql->bindValue(':nombre', $_GET["nombre"]);
		$sql->bindValue(':passwd', $_GET["passwd"]);               
		$sql->execute();
		header("HTTP/1.1 200 OK");
		$datos=$sql->fetchAll(PDO::FETCH_ASSOC);
       
		if ($datos!=NULL) {
            $datos=$datos[0];
		    $respuesta=array("id_usuario"=>$datos["id_usuario"], "nombre"=>$datos["nombre"], "rol"=>$datos["rol"]);
            
            if ($respuesta["rol"]="adm"){

                // Recogemos el nombre de la imagen para devolver como respuesta..
                $sql = $dbConn->prepare("SELECT imagen FROM articulo WHERE id_articulo=:ida;");
                $sql->bindValue(':ida', $_GET["id_articulo"]);
                $sql->execute();    
                header("HTTP/1.1 200 OK");
                $datos = $sql->fetchAll(PDO::FETCH_ASSOC);

                if ($datos!=null) {
                    $respuesta=$datos[0]["imagen"];
                }
                else {
                    $respuesta="No tiene imagen";
                }

                // borramos el post.
                $sql = $dbConn->prepare("DELETE FROM articulo WHERE id_articulo=:ida;");
                $sql->bindValue(':ida', $_GET["id_articulo"]);
                $sql->execute(); 
            }
            else{
                $respuesta="No tiene permisos";
            }



        }
		else {
		    $respuesta="Usuario no encontrado";
		}

        echo "<br>";    
    
	}
	echo $respuesta;
	exit();
}


?>