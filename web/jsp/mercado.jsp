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

        <script>
            function consultarIngredientes() {
                console.log('hola')
                // Obtén los valores de los ingredientes desde los campos de entrada
                var ingrediente1 = document.getElementsByName("ingrediente1")[0].value;
                var ingrediente2 = document.getElementsByName("ingrediente2")[0].value;
                var ingrediente3 = document.getElementsByName("ingrediente3")[0].value;

                // Construye la cadena de datos para la solicitud POST
                var postData = "ingrediente1=" + encodeURIComponent(ingrediente1) +
                        "&ingrediente2=" + encodeURIComponent(ingrediente2) +
                        "&ingrediente3=" + encodeURIComponent(ingrediente3);
                
                // Llama a cargarContenido con método POST y datos
                //cargarContenido('/BudgetBuddy/Mercado', 'POST', postData);
            }
        </script>
    </body>
</html>
