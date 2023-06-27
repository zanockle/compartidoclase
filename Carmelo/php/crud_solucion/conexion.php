<?php
// Configuración de la conexión a la base de datos
$host = 'localhost';
$port = 5432;
$dbname = 'ejerciciophp';
$user = 'root';
$password = '';
$db="test";
$conn=new mysqli($host, $user, $password, $db);
echo "El resultado de la conexión es correcto";