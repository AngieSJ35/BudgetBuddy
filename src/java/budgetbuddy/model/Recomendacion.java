/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package budgetbuddy.model;

/**
 *
 * @author lica-
 */
public class Recomendacion {
    private String ingredientes;
    private String nombrePlatillo;
    private double similitud;
    private int usuario;

    public Recomendacion(String ingredientes, String nombrePlatillo, double similitud) {
        this.ingredientes = ingredientes;
        this.nombrePlatillo = nombrePlatillo;
        this.similitud = similitud;
        this.usuario = usuario;
    }

    public Recomendacion(String ingredientes, String nombrePlatillo) {
        this.ingredientes = ingredientes;
        this.nombrePlatillo = nombrePlatillo;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public Recomendacion() {
    }

    public String getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(String ingredientes) {
        this.ingredientes = ingredientes;
    }

    public String getNombrePlatillo() {
        return nombrePlatillo;
    }

    public void setNombrePlatillo(String nombrePlatillo) {
        this.nombrePlatillo = nombrePlatillo;
    }

    public double getSimilitud() {
        return similitud;
    }

    public void setSimilitud(double similitud) {
        this.similitud = similitud;
    }

    
}

