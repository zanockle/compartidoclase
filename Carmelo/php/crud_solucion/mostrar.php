<?php
global $conn;
include("header.php");
echo "<h1>Select - Mostrar registros</h1>";
require ("conexion.php");
$result=$conn->query("SELECT * FROM comentarios");
while ($item=$result->fetch_assoc())
{
    echo("<p>".$item['id']."</p>");
    echo("<p>".$item['comentario']."</p><hr>");
}

include("footer.php");
?>
