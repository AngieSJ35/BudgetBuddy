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
            }

            .topbar {
                background-color: #333;
                color: white;
                padding: 10px;
                text-align: right;
            }

            .sidebar {
                height: 100%;
                width: 250px;
                position: fixed;
                background-color: #111;
                padding-top: 60px; /* Ajusta según el tamaño de la barra superior */
                padding-left: 10px;
                color: white;
            }

            .content {
                margin-left: 250px;
                padding: 16px;
            }
            .sidebar button {
                display: block;
                width: 100%;
                text-align: left;
                padding: 10px;
                margin-bottom: 5px;
                background-color: #f1f1f1;
                border: none;
                text-decoration: none;
                font-size: 16px;
                color: black;
                cursor: pointer;
            }
            .bottombutton {
                position: fixed;
                bottom: 10px;
                left: 10px;
            }
        </style>
    </head>
    <body>

        <div class="topbar">
            <button onclick="cerrarSesion()">Cerrar Sesión</button>
        </div>

        <div class="sidebar">
            <button onclick="cargarContenidoPrincipal()">Inicio</button>
            <button onclick="cargarContenido('calendario.jsp')">Calendario</button>
            <button onclick="cargarContenido('<%= request.getContextPath()%>/Presupuesto')">Presupuesto</button>
            <button onclick="cargarContenido('mercado.jsp')">Mercado</button>
        </div>

        <div class="content" id="contenidoPrincipal">
            <!-- Contenido principal de la página -->
            <h2>Contenido Principal</h2>
            <p>Selecciona una opción en la barra lateral.</p>
        </div>

        <button class="bottombutton" onclick="realizarAccion()">Botón Inferior</button>

        <script>
            function cargarContenido(url) {
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
                xhr.open('GET', url, true);
                xhr.send();
            }


            function cargarContenidoPrincipal() {
                // Cargar el contenido principal (puedes ajustar según sea necesario)
                document.getElementById('contenidoPrincipal').innerHTML =
                        '<h2>Contenido Principal</h2><p>Selecciona una opción en la barra lateral.</p>';
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
