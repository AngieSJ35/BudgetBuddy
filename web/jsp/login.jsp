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
            body {
                background-color: white;
                
            }
            /* Estilos para la barra superior */
            .top-bar {
                background-color: rgba(37, 91, 141, 1);
                color: #fff;
                padding: 10px;
                text-align: center;
                display: flex;
            }
            
            article {
                flex: 1;
                padding: 10px;
                /*background-color: lightgoldenrodyellow;*/
                margin: 5px;
                display: flex;
            }
            

            
            img{
                display: flex;
                width: 70px;
                height: 70px;
                background-color: black;
                align-items: center;
            }

            /* Estilos para los botones */
            .button {
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

            /* Estilos para el contenido */
            .content {
                position: fixed;
                left: 38%;
                top: 30%;
                /*background-color: lightcyan;*/
                width: 370px;
                height: 330px;
            }

            /* Estilos específicos para el contenido de cada sección */
            #seccion1 h2{
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
            
            #seccion1 form{
                width: 370px;
                height: 240px;
                background-color: rgba(223, 203, 168, 0.5);
                border-bottom-left-radius: 20px;
                border-bottom-right-radius: 20px;
            }
            
            #seccion2 h2{
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
            
            #seccion2 form{
                width: 370px;
                height: 310px;
                background-color: rgba(223, 203, 168, 0.5);
                border-bottom-left-radius: 20px;
                border-bottom-right-radius: 20px;
            }
            
            label{
                color: red;
                margin: 5px 10px;
                 font-weight: 30px;
                font-size: 15px;
                color: rgba(119, 159, 161, 1);
                
            }
            
            input[type=text], input[type=password]{
                 width: 90%;
                 padding: 12px 20px;
                 margin: 8px 18px;
                 box-sizing: border-box;
                 border: 3px solid rgba(119, 159, 161, 1);
                 border-radius: 4px;
                 background-color: rgba(223, 203, 168, 0.5);
            }
            
            #BotonInciar {
                 width: 50%;
                 padding: 12px 20px;
                 margin: 10px 82px;
                 box-sizing: border-box;
                 border: 3px solid rgba(119, 159, 161, 1);
                 border-radius: 4px;
                 background-color: rgba(223, 203, 168, 0.5);
                color: rgba(119, 159, 161, 1);
                font-weight: 30px;
                font-size: 15px;
            
            }
            
            #BotonRegistro {
                width: 50%;
                 padding: 12px 20px;
                 margin: 10px 82px;
                 box-sizing: border-box;
                 border: 3px solid rgba(119, 159, 161, 1);
                 border-radius: 4px;
                 background-color: rgba(223, 203, 168, 0.5);
                color: rgba(119, 159, 161, 1);
                font-weight: 30px;
                font-size: 15px;
            }

  
        </style>
    </head>
    
    <body>

        <!-- Barra Superior -->
        <div class="top-bar">
            <!-- Botones de la Barra Superior -->
            <article id = "logo">
                <img src="${pageContext.request.contextPath}/recursos/Logo2.png" alt="Logo"/>
            </article>
            
            <article>
                <h1>BugetBuddy</h1>
            </article>
            
            <article>
                <button class="button" onclick="mostrarContenido('seccion1')">Iniciar Sesión</button>
                <button class="button" onclick="mostrarContenido('seccion2')">Registrarse</button>
            </article>
            
        </div>

        <div class="content" id="seccion1">
            
            <H2>Inicia Sesión en BudgetBuddy</H2>
            
            <form action="/BudgetBuddy/login" method="post">
                <label for="correo">Correo:</label>
                <input type="text" name="correo" required><br>

                <label for="contraseña">Contraseña:</label>
                <input type="password" name="contrasena" required><br>

                <button type="submit" name="login" id="BotonInciar">Iniciar sesión</button>
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

                <button type="submit" name="register" id="BotonRegistro">Registrate</button>
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
