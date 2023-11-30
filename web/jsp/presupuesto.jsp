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
            }
            .gastos, .ingresos {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }
            .cuadro {
                width: 48%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
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

                    <button type="submit" name="gasto">Agregar Gasto</button>
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

                    <button type="submit" name="ingreso">Agregar Ingreso</button>
                </form>

            </div>
        </div>

    </body>
</html>

