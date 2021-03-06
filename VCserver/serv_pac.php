<?php
include "config.php";
include "utils.php";


$dbConn =  connect($db_pac);

/*
  Busqueda de datos del paciente
 */
if ($_SERVER['REQUEST_METHOD'] == 'GET'){
    if (isset($_GET['dni']) && isset($_GET['codigo_acceso'])){
        if ($_GET['accion']=="datos"){
            //Recibe un dni y un codigo de acceso.
            //Devuelve: nombre, apellidos y estado del paciente, más su historial con nota y fecha.
            $sql = $dbConn->prepare("SELECT nombre, apellido_1, apellido_2, estado FROM paciente WHERE dni=:dni AND codigo_acceso=:cac");
            $sql->bindValue(':dni', $_GET['dni']);
            $sql->bindValue(':cac', $_GET['codigo_acceso']);
            $sql->execute();
            $sql->setFetchMode(PDO::FETCH_ASSOC);
            echo json_encode($sql->fetchAll(),JSON_INVALID_UTF8_IGNORE);
            header("HTTP/1.1 200 OK");
            exit();
        }
        elseif ($_GET['accion']=="notas"){
            $sql = $dbConn->prepare("SELECT nota, fecha, id_usuario FROM nota WHERE dni_paciente=:dni ORDER BY fecha ASC ");
            $sql->bindValue(':dni', $_GET['dni']);
            $sql->execute();
            $sql->setFetchMode(PDO::FETCH_ASSOC);
            echo json_encode($sql->fetchAll(),JSON_INVALID_UTF8_IGNORE);
            
            header("HTTP/1.1 200 OK");
            exit();
        }
    }
}



//En caso de que ninguna de las opciones anteriores se haya ejecutado
header("HTTP/1.1 400 Bad Request");

?>