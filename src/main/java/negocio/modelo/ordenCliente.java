/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package negocio.modelo;

import java.sql.Date;

/**
 *
 * @author Daniel
 */
public class ordenCliente {
    private int idcomida;
    private int idcliente;
    private int idorden;
    private int cantidad;
    private float precioTotal;
    private Date fecha;

    public ordenCliente(int idcomida, int idcliente, int cantidad, float precioTotal) {
        this.idcomida = idcomida;
        this.idcliente = idcliente;
        this.precioTotal = precioTotal;
        this.cantidad = cantidad;
        
    }

    public ordenCliente() {
    }

    public int getIdcomida() {
        return idcomida;
    }

    public void setIdcomida(int idcomida) {
        this.idcomida = idcomida;
    }

    public int getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(int idcliente) {
        this.idcliente = idcliente;
    }

    public int getIdorden() {
        return idorden;
    }

    public void setIdorden(int idorden) {
        this.idorden = idorden;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

  

    public float getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(float precioTotal) {
        this.precioTotal = precioTotal;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    
}
