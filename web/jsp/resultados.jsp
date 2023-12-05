<%@page import="budgetbuddy.model.Recomendacion"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resultados de la Consulta</title>
</head>
<body>
    <h2>Resultados de la Consulta</h2>

    <%
        Map<String, Recomendacion> recomendacionesMap = (Map<String, Recomendacion>) request.getAttribute("recomendacionesMap");

        if (recomendacionesMap != null && !recomendacionesMap.isEmpty()) {
            // Iterar sobre el Map
            for (Map.Entry<String, Recomendacion> entry : recomendacionesMap.entrySet()) {
                String key = entry.getKey();
                Recomendacion recomendacion = entry.getValue();

                // Obtener datos de la recomendación
                String nombrePlatillo = recomendacion.getNombrePlatillo();
                double similitud = recomendacion.getSimilitud();
                String ingredientes = recomendacion.getIngredientes();
    %>

                <h2><%= "Recomendación " + key %></h2>
                <p>Nombre Platillo: <%= nombrePlatillo %></p>
                <p>Similitud: <%= similitud %></p>
                <p>Ingredientes: <%= ingredientes %></p>

    <%
            }
        }
    %>
</body>
</html>
