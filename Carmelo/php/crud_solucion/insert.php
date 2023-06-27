<?php
global $conn;
include("header.php");
require ("conexion.php");
echo "<h1>Insert - Añadir registros</h1>";
$conn->query("insert into comentarios(id, comentario) VALUES($_POST[id], '$_POST[comentario]') ");
echo ("<p>Registro insertado correctamente</p>");
$conn->close();
include("footer.php");
?>
