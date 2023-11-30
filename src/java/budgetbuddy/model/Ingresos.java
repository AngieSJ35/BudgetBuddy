package budgetbuddy.model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author lica-
 */
public class Ingresos {
    
    private int id;
    private String nombre;
    private int valor;
    private boolean pagado;
    private int usuario;

    public Ingresos(int id, String nombre, int valor, boolean pagado, int usuario) {
        this.id = id;
        this.nombre = nombre;
        this.valor = valor;
        this.pagado = pagado;        
        this.usuario = usuario;

    }

    public int getUsuario() {
        return usuario;
    }

    public Ingresos() {
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public boolean isPagado() {
        return pagado;
    }

    public void setPagado(boolean pagado) {
        this.pagado = pagado;
    }
    
    
}
