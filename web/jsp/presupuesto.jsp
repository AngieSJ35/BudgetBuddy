<%-- 
    Document   : presupuesto
    Created on : 29/11/2023, 7:50:53 p. m.
    Author     : lica-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="budgetbuddy.model.Gastos" %>
<%@ page import="budgetbuddy.model.Ingresos" %>

<%
    // Obtener la lista de gastos desde el objeto request
    List<Gastos> listaGastos = (List<Gastos>) request.getAttribute("listaGastos");
    List<Ingresos> listaIngresos = (List<Ingresos>) request.getAttribute("listaIngresos");
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Presupuesto</title>
        <!-- Agrega los enlaces a tus archivos CSS si es necesario -->
        <!-- Agrega enlaces a las bibliotecas de jQuery si es necesario -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <style>
            /* Estilos aquí */
            .saldo {
                text-align: center;
                margin-bottom: 20px;
                /*background-color: yellow;*/
            }
            
            .saldo h2{
                width: 370px;
                height: 50px;
                background-color: buttonface;
                color: rgba(36, 82, 124, 1);
                text-align: center;
                margin-bottom: 0px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 20px;
                border-radius: 10pc;
            }
            
            .gastos, .ingresos {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
                background-color: yellow;
            }
            .cuadro {
                width: 48%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                /*background-color: pink;*/
            }
            
            .cuadro form{
                width: 200px;
                height: 200px;
                background-color: rgba(223, 203, 168, 0.5);
                border-bottom-left-radius: 20px;
                border-bottom-right-radius: 20px;
            }
            
            label{
                margin: 10px 10px;
                font-weight: 30px;
                font-size: 15px;
                color: rgba(119, 159, 161, 1);
            }
            
            input[type=text], input[type=password]{
                 width: 80%;
                 height: 10px;
                 padding: 12px 20px;
                 margin: 4px 10px;
                 box-sizing: border-box;
                 border: 3px solid rgba(119, 159, 161, 1);
                 border-radius: 4px;
                 background-color: rgba(223, 203, 168, 0.5);
            }
            
            .btnAgregar{
                width: 110px;
                height: 30px;
                padding: 0px;
                margin: 10px 40px;
                box-sizing: border-box;
                border: 3px solid rgba(119, 159, 161, 1);
                border-radius: 4px;
                background-color: rgba(223, 203, 168, 0.5);
                color: rgba(119, 159, 161, 1);
                font-weight: 0px;
                font-size: 13px;
                align-items: center;
            }
            
            .cuadro h3{
                width: 200px;
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
            
            .cuadro p {
                width: 200px;
                height: 200px;
                background-color: rgba(223, 203, 168, 0.5);
                color: white;
                text-align: center;
                margin-top: 0px;
                margin-bottom: 0px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-bottom-left-radius: 20px;
                border-bottom-right-radius: 20px;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                font-size: 20px;
            }
            
            
            .agregarGasto, .agregarIngreso {
                text-align: center;
                margin-top: 20px;
                
            }
        </style>
    </head>
    <body>

        <div class="saldo">
            <H2>Saldo: $<%= request.getAttribute("saldo") %></H2>
        </div>

        <div class="gastos">
            <%        // Mostrar la caja de agregar gasto solo si la lista de gastos no está vacía
                if (listaGastos != null) {
            %>
            <% for (Gastos gasto : listaGastos) {%>
            <div class="cuadro">
                <h3><%= gasto.getNombre()%></h3>
                <p>Monto: $<%= gasto.getValor()%></p>
            </div>
            <% } %>
            <% }%>


            <div class="cuadro">
                <h3>Agregar Gasto</h3>
                <!-- Formulario para agregar un nuevo gasto -->
                <form action="/BudgetBuddy/presupuesto" method="post" accept-charset="UTF-8">
                    <label for="nombre">Nombre del Gasto:</label>
                    <input type="text" id="nombre" name="nombre" required><br>

                    <label for="valor">Monto:</label>
                    <input type="text" id="valor" name="valor" required><br>

                    <button type="submit" name="gasto" class = "btnAgregar">Agregar Gasto</button>
                </form>
            </div>
        </div>

        <div class="ingresos">
                        <%        // Mostrar la caja de agregar gasto solo si la lista de gastos no está vacía
                if (listaIngresos != null) {
            %>
            <% for (Ingresos ingreso : listaIngresos) {%>
            <div class="cuadro">
                <h3><%= ingreso.getNombre()%></h3>
                <p>Monto: $<%= ingreso.getValor()%></p>
            </div>
            <% } %>
            <% }%>

            <div class="cuadro">
                <h3>Agregar Ingreso</h3>
                <!-- Formulario para agregar un nuevo ingreso -->
                <form action="/BudgetBuddy/presupuesto" method="post" accept-charset="UTF-8">
                    <label for="nombre">Nombre del Ingreso:</label>
                    <input type="text" id="nombre" name="nombre" required><br>

                    <label for="valor">Monto:</label>
                    <input type="text" id="valor" name="valor" required><br>

                    <button type="submit" name="ingreso" class = "btnAgregar">Agregar Ingreso</button>
                </form>

            </div>
        </div>

    </body>
</html>

