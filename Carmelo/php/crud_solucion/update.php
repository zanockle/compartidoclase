<?php
global $conn;
include("header.php");
echo "<h1>Update - Actualizar registros</h1>";
$result=$conn->query("UPDATE comentarios SET comentario='$_POST[comentario]' WHERE id=$_POST[id]");
echo ("<p>Comentario actualizado correctamente</p>");
echo ("<a href='mostrar.php'>Consultar cambios</a>");


include("footer.php");
?>
