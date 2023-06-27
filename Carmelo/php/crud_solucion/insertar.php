<?php

global $conn;
include("header.php");
include("footer.php");
?>
<form action="insert.php" method="post">
    <div class="mb-3">
        <label for="idcomentario" class="form-label">Id de comentario</label>
        <input type="number" class="form-control" id="idcomentario" name="id">
    </div>
    <div class="mb-3">
        <label for="comentario" class="form-label">Comentario</label>
    </div>
    <button type="submit" class="btn btn-primary">Guardar comentario</button>
</form>

