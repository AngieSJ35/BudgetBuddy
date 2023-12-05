<%-- 
    Document   : resumen
    Created on : 4/12/2023, 9:01:01 p. m.
    Author     : lica-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
 
    </head>
    <body>
                    <!-- Primera sección con 3 cajas: Total, Gastos e Ingresos -->
            <section>
                <h2>Sección 1: Finanzas</h2>

                <div>
                    <label>Total:</label>
                    <label><%= request.getAttribute("saldoInicio") %></label>
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
                <h2>Sección 2: Platillo de Comida</h2>

                <div>
                    <label>Nombre del platillo:</label>
                    <input type="text" name="nombrePlatillo" id="nombrePlatillo" />
                </div>

                <div>
                    <label>Ingredientes:</label>
                    <textarea name="ingredientes" id="ingredientes" rows="4" cols="50"></textarea>
                </div>
            </section>
    </body>
</html>
