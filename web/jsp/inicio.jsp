<%-- 
    Document   : inicio
    Created on : 29/11/2023, 1:45:42 p. m.
    Author     : lica-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mi Aplicación</title>
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                padding: 0px;
            }

            .topbar {
                background-color: rgba(37, 91, 141, 1);
                color: #fff;
                padding: 10px;
                text-align: center;
                display: flex;
                height: 60px;
                width:100%;
                position: fixed;
            }

            .topbar h1{
                height: 20px;
                color: white;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                position: absolute;
                left: 550px;
            }

            .topbar button {
                position: absolute;
                top: 10px;
                right: 10px;
                cursor: pointer;
                width: 150px;
                padding: 12px 20px;
                margin: 10px 10px;
                box-sizing: border-box;
                border: 3px solid rgba(119, 159, 161, 1);
                border-radius: 4px;
                background-color: whitesmoke;
                color: rgba(119, 159, 161, 1);
                font-weight: 30px;
                font-size: 15px;
                flex: 1;
            }

            .sidebar {
                height: 100%;
                width: 280px;
                position: fixed;
                background-color: rgba(119, 159, 161, 1);
                padding-top: 60px; /* Ajusta según el tamaño de la barra superior */
                padding-left: 10px;
                color: white;
                margin-top: 80px;
            }

            .content {
                margin-left: 280px;
                padding: 16px;
                background-color: red;
                margin-left: 280px;

            }

            .content h2{
                width: 370px;
                height: 50px;
                background-color: rgba(119, 159, 161, 1);
                color: white;
                text-align: center;
                margin-bottom: 0px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-top-left-radius: 20px;
                border-top-right-radius: 20px;
                font-size: 20px;
                margin-top: 120px;
            }

            .content p{
                width: 370px;
                height: 50px;
                background-color: rgba(119, 159, 161, 1);
                color: white;
                text-align: center;
                margin-bottom: 0px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-top-left-radius: 20px;
                border-top-right-radius: 20px;
                font-size: 20px;
            }

            .sidebar button {
                display: block;
                width: 95%;
                text-align: left;
                padding: 10px;
                margin-bottom: 5px;
                font-size: 16px;
                cursor: pointer;
                box-sizing: border-box;
                border: 3px solid rgba(119, 159, 161, 1);
                border-radius: 4px;
                background-color: whitesmoke;
                color: rgba(119, 159, 161, 1);
                font-weight: 30px;
                font-size: 15px;
                flex: 1;
            }

        </style>
    </head>
    <body>

        <div class = "topbar" >
            <h1>BudgetBuddy</h1>
            <button onclick="cerrarSesion()">Cerrar Sesión</button>
        </div>

        <div class="sidebar">
            <button onclick="cargarContenido('<%= request.getContextPath()%>/resumen', 'GET')">Inicio</button>
            <button onclick="cargarContenido('<%= request.getContextPath()%>/presupuesto', 'GET')">Presupuesto</button>
            <button onclick="cargarContenido('<%= request.getContextPath()%>/mercado', 'GET')">Sugerencias</button>
        </div>

        <div class="content" id="contenidoPrincipal">
            <!-- Contenido principal de la página -->
    <body>
                    <!-- Primera sección con 3 cajas: Total, Gastos e Ingresos -->
            <section>
                <h2>Sección 1: Finanzas</h2>

                <div>
                    <label>Total:</label>
                    <label><%= request.getAttribute("totalGastos") %></label>
                </div>

                <div>
                    <label>Gastos:</label>
                    <label><%= request.getAttribute("totalGastos") %></label>
                </div>

                <div>
                    <label>Ingresos:</label>
                    <label><%= request.getAttribute("totalIngresos") %></label>
                </div>
            </section>

            <!-- Segunda sección con el nombre de un platillo y sus ingredientes -->
            <section>
                <h2>Sección 2: Recomendaciones</h2>

                <div>
                    <label>Nombre del platillo:</label>
                    <label></label>
                </div>

                <div>
                    <label>Ingredientes:</label>
                    <label></label>
                </div>
            </section>
    </body>

        </div>

        <!-- comment<button class="bottombutton" onclick="realizarAccion()">Botón Inferior</button> -->

        <script>
            function cargarContenido(url, method, data) {
                // Usa AJAX para hacer una solicitud al servlet y cargar el contenido en el div 'contenidoPrincipal'
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            document.getElementById('contenidoPrincipal').innerHTML = xhr.responseText;
                        } else {
                            alert('Error al cargar el contenido.');
                        }
                    }
                };
                if (method.toUpperCase() === 'GET') {
                    xhr.open('GET', url, true);
                    xhr.send();
                } else if (method.toUpperCase() === 'POST') {
                    xhr.open('POST', url, true);
                    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    xhr.send(data);
                } else {
                    alert('Método no válido');
                }
            }
            function consultarIngredientes() {
                // Obtén los valores de los ingredientes desde los campos de entrada
                var ingrediente1 = document.getElementsByName("ingrediente1")[0].value;
                var ingrediente2 = document.getElementsByName("ingrediente2")[0].value;
                var ingrediente3 = document.getElementsByName("ingrediente3")[0].value;

                // Construye la cadena de datos para la solicitud POST
                var postData = "ingrediente1=" + encodeURIComponent(ingrediente1) +
                        "&ingrediente2=" + encodeURIComponent(ingrediente2) +
                        "&ingrediente3=" + encodeURIComponent(ingrediente3);

                // Llama a cargarContenido con método POST y datos
                cargarContenido('<%= request.getContextPath()%>/mercado', 'POST', postData);
            }

            function cerrarSesion() {
                // Lógica para cerrar sesión
                alert('Sesión cerrada');
            }

            function realizarAccion() {
                // Lógica para la acción del botón inferior
                alert('Acción realizada');
            }
        </script>

    </body>
</html>
