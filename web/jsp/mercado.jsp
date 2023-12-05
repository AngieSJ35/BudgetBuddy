<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        
        <title>Consulta de Recetas</title>
    </head>
    <body>
        <h2>Consulta de Recetas</h2>

        <form >
            <label for="ingrediente1">Ingrediente 1:</label>
            <input type="text" name="ingrediente1" required><br>

            <label for="ingrediente2">Ingrediente 2:</label>
            <input type="text" name="ingrediente2" required><br>

            <label for="ingrediente3">Ingrediente 3:</label>
            <input type="text" name="ingrediente3" required><br>

            <button type="button" onclick="consultarIngredientes()">Consultar Ingredientes</button>

        </form>

    </body>
</html>
