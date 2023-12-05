package budgetbuddy.controller;


import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class ApiConnection {
    public static List<Object> consultarAPI(String ingrediente1, String ingrediente2, String ingrediente3) {
        List<Object> resultList = new ArrayList<>();

        try {
            // Construye la URL de la API (ajusta la URL según tu configuración)
            String apiUrl = "http://localhost:5000/?ingrediente1=" + ingrediente1 + "&ingrediente2=" + ingrediente2 + "&ingrediente3=" + ingrediente3;

            // Crea una URL
            URL url = new URL(apiUrl);

            // Abre una conexión HTTP
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Establece el método de solicitud (GET, POST, etc.)
            connection.setRequestMethod("GET");

            // Obtiene la respuesta del servidor
            int responseCode = connection.getResponseCode();

            if (responseCode == 200) { // Código 200 significa éxito
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
                StringBuilder response = new StringBuilder();
                String inputLine;

                while ((inputLine = reader.readLine()) != null) {
                    response.append(inputLine);
                }
                reader.close();
                System.out.println(response);

                // Modificar la lógica de conversión según tus necesidades
                // Aquí, simplemente añadimos el JSONObject a la lista
                resultList.add(response.toString());
            } else {
                System.out.println("La solicitud falló. Código de respuesta: " + responseCode);
            }

            // Cierra la conexión
            connection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultList;
    }
}
