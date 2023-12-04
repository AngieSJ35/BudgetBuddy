<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Resultados de la Consulta</title>
</head>
<body>
    <h2>Resultados de la Consulta</h2>

    <pre>
        <%-- Muestra la respuesta JSON formateada --%>
        <%= request.getAttribute("jsonResponse") %>
    </pre>
</body>
</html>
