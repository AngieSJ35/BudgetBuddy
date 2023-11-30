<%-- 
    Document   : presupuesto
    Created on : 29/11/2023, 7:50:53 p. m.
    Author     : lica-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="tu.paquete.Gasto" %>
<%@ page import="tu.paquete.ConsultaGastos" %>
<%
    // Simula obtener la lista de gastos desde la base de datos
    List<Gasto> listaGastos = ConsultaGastos.obtenerGastos(); // Ajusta esto según tu implementación
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
    <h2>Saldo Actual: $5000</h2>
</div>

<div class="gastos">

    <% for (Gasto gasto : listaGastos) { %>
        <div class="cuadro">
            <h3><%= gasto.getNombre() %></h3>
            <p>Monto: $<%= gasto.getMonto() %></p>
        </div>
    <% } %>


    <div class="cuadro">
        <h3>Agregar Gasto</h3>
        <!-- Formulario para agregar un nuevo gasto -->
        <form id="formGasto">
            <label for="nombreGasto">Nombre del Gasto:</label>
            <input type="text" id="nombreGasto" name="nombreGasto" required><br>

            <label for="montoGasto">Monto:</label>
            <input type="text" id="montoGasto" name="montoGasto" required><br>

            <button type="button" onclick="agregarGasto()">Agregar Gasto</button>
        </form>
    </div>
</div>

<div class="ingresos">
    <div class="cuadro">
        <h3>Ingresos</h3>
        <!-- Aquí puedes mostrar los datos de tus ingresos desde la base de datos -->
        <p>Ingreso 1: $1000</p>
        <p>Ingreso 2: $800</p>
        <!-- ... Agrega más según sea necesario -->
    </div>

    <div class="cuadro">
        <h3>Agregar Ingreso</h3>
        <!-- Formulario para agregar un nuevo ingreso -->
        <form id="formIngreso">
            <label for="nombreIngreso">Nombre del Ingreso:</label>
            <input type="text" id="nombreIngreso" name="nombreIngreso" required><br>

            <label for="montoIngreso">Monto:</label>
            <input type="text" id="montoIngreso" name="montoIngreso" required><br>

            <button type="button" onclick="agregarIngreso()">Agregar Ingreso</button>
        </form>
    </div>
</div>

<script>
    function agregarGasto() {
        // Lógica para agregar gasto (usando AJAX para interactuar con la base de datos)
        // ...
        alert("Gasto agregado correctamente");
    }

    function agregarIngreso() {
        // Lógica para agregar ingreso (usando AJAX para interactuar con la base de datos)
        // ...
        alert("Ingreso agregado correctamente");
    }
</script>

</body>
</html>

