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

            <!-- comment<button class="bottombutton" onclick="realizarAccion()">Botón Inferior</button> -->

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
