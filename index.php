<?php
include_once 'conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$_POST = json_decode(file_get_contents("php://input"), true);

$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';

$id =(isset($_POST['id'])) ? $_POST['id'] : '';
$contenido = (isset($_POST['contenido'])) ? $_POST['contenido'] : '';
$referencias = (isset($_POST['referencias'])) ? $_POST['referencias'] : '';
$pais = (isset($_POST['pais'])) ? $_POST['pais'] : '';
$categoria = (isset($_POST['categoria'])) ? $_POST['categoria'] : '';
$tabla = (isset($_POST['tabla'])) ? $_POST['tabla'] : '';
$buscar = (isset($_POST['buscar'])) ? $_POST['buscar'] : '';
$data = '';
switch($opcion){
    case 1:
        $consulta = "INSERT INTO contenidos (contenido, referencias, id_paises, id_categorias) VALUES ('$contenido', '$referencias', '$pais', '$categoria')";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        break;
    case 2:
        $consulta = "UPDATE contenidos SET contenido = '$contenido', referencias = '$referencias', id_paises = '$pais', id_categorias = '$categoria' WHERE id='$id'";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
    case 3:
        $consulta = "DELETE FROM contenidos WHERE id='$id'";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        break;
    case 4:
        switch($tabla){
            case "contenidos":
                $consulta = "SELECT * FROM contenidos C LEFT JOIN paises P ON C.id_paises = P.id_paises LEFT JOIN categorias Ca ON C.id_categorias = Ca.id_categorias ";
                if ($buscar != ""){
                    $consulta .= "WHERE C.contenido LIKE '%" . $buscar ."%' OR P.pai_nombre LIKE '%" . $buscar ."%' OR Ca.cat_nombre LIKE '%" . $buscar ."%'";
                }
                
                break;
            case "paises":
            case "categorias":
                $consulta = "SELECT * FROM " . $tabla;
                break;
        }
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);
$conexion = NULL;
