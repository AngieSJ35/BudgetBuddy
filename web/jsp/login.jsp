<%-- 
    Document   : login
    Created on : 29/11/2023, 9:22:27 a. m.
    Author     : lica-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            /* Estilos para la barra superior */
            .top-bar {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: center;
            }

            /* Estilos para los botones */
            .button {
                padding: 10px;
                margin: 5px;
                background-color: #555;
                color: #fff;
                border: none;
                cursor: pointer;
            }

            /* Estilos para el contenido */
            .content {
                padding: 20px;
            }

            /* Estilos específicos para el contenido de cada sección */
            .section1 {
                display: none; /* Inicialmente oculto */
            }

            .section2 {
                display: none; /* Inicialmente oculto */
            }
        </style>
    </head>
    <body>

        <!-- Barra Superior -->
        <div class="top-bar">
            <!-- Botones de la Barra Superior -->
            <button class="button" onclick="mostrarContenido('seccion1')">Iniciar Sesión</button>
            <button class="button" onclick="mostrarContenido('seccion2')">Registrarse</button>
        </div>

        <div class="content" id="seccion1">
            <H2>Inicia Sesión</H2>
            <form action="/BudgetBuddy/login" method="post">
                <label for="correo">Correo:</label>
                <input type="text" name="correo" required><br>

                <label for="contraseña">Contraseña:</label>
                <input type="password" name="contrasena" required><br>

                <button type="submit" name="login">Iniciar sesión</button>
            </form>
        </div>

        <div class="content" id="seccion2">            
            <H2>Registrate</H2>
            <form action="/BudgetBuddy/login" method="post" accept-charset="UTF-8">
                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" required><br>
                <label for="correo">Correo:</label>
                <input type="text" name="correo" required><br>

                <label for="contrasena">Contraseña:</label>
                <input type="password" name="contrasena" required><br>

                <button type="submit" name="register">Registrate</button>
            </form>
        </div>

        <!-- Script JavaScript para gestionar la visibilidad del contenido -->
        <script>

            window.onload = function () {
                mostrarContenido('seccion1');
            };
            function mostrarContenido(seccion) {
                // Oculta todos los contenidos
                document.getElementById('seccion1').style.display = 'none';
                document.getElementById('seccion2').style.display = 'none';

                // Muestra el contenido de la sección seleccionada
                document.getElementById(seccion).style.display = 'block';
            }
        </script>

    </body>
</html>
