<?php

global $conn;
include("header.php");
include("footer.php");
require ("conexion.php");
$result=$conn->query("UPDATE comentarios SET comentario='$_POST[comentario]' WHERE id=$_POST[id]");
echo ("<p>Comentario actualizado correctamente</p>");
echo ("<a href='mostrar.php'>Consultar cambios</a>");

?>

