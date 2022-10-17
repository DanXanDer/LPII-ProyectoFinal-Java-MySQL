/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package negocio.modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import negocio.conexion.Conexion;
import negocio.modelo.ordenCliente;

/**
 *
 * @author Daniel
 */
public class OrdenClienteDAO {
    
    public static void agregarOrden(ordenCliente orden){
        String sql = "INSERT INTO ordencliente (idcliente,idcomida,cantidad,precioTotal) values (?,?,?,?)";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, orden.getIdcliente());
            ps.setInt(2, orden.getIdcomida());
            ps.setInt(3, orden.getCantidad());
            ps.setFloat(4, orden.getPrecioTotal());
            ps.execute();
            cn.close();
            ps.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(OrdenClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static ArrayList<ordenCliente> mostrarOrden(){
        ArrayList<ordenCliente> ordencliente = new ArrayList();
        String sql = "SELECT * FROM ordencliente";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ordenCliente orden = new ordenCliente();
                orden.setIdorden(rs.getInt("idorden"));
                orden.setIdcliente(rs.getInt("idcliente"));
                orden.setIdcomida(rs.getInt("idcomida"));
                orden.setCantidad(rs.getInt("cantidad"));
                orden.setPrecioTotal(rs.getFloat("precioTotal"));
                orden.setFecha(rs.getDate("fecha"));
                ordencliente.add(orden);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(OrdenClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ordencliente;
    }
    
     public static ArrayList<ordenCliente> mostrarOrdenDelCliente(int idcliente){
        ArrayList<ordenCliente> ordencliente = new ArrayList();
        String sql = "SELECT * FROM ordencliente WHERE IDCLIENTE = ? ORDER BY FECHA";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idcliente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ordenCliente orden = new ordenCliente();
                orden.setIdorden(rs.getInt("idorden"));
                orden.setIdcliente(rs.getInt("idcliente"));
                orden.setIdcomida(rs.getInt("idcomida"));
                orden.setCantidad(rs.getInt("cantidad"));
                orden.setPrecioTotal(rs.getFloat("precioTotal"));
                orden.setFecha(rs.getDate("fecha"));
                ordencliente.add(orden);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(OrdenClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ordencliente;
    }
     
     public static ArrayList<ordenCliente> ordenarPrecioAsc(){
        ArrayList<ordenCliente> ordencliente = new ArrayList();
        String sql = "SELECT * FROM ordencliente ORDER BY precioTotal";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);           
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ordenCliente orden = new ordenCliente();
                orden.setIdorden(rs.getInt("idorden"));
                orden.setIdcliente(rs.getInt("idcliente"));
                orden.setIdcomida(rs.getInt("idcomida"));
                orden.setCantidad(rs.getInt("cantidad"));
                orden.setPrecioTotal(rs.getFloat("precioTotal"));
                orden.setFecha(rs.getDate("fecha"));
                ordencliente.add(orden);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(OrdenClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ordencliente;
    }
     
     public static ArrayList<ordenCliente> ordenarPrecioDesc(){
        ArrayList<ordenCliente> ordencliente = new ArrayList();
        String sql = "SELECT * FROM ordencliente ORDER BY precioTotal DESC";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);           
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ordenCliente orden = new ordenCliente();
                orden.setIdorden(rs.getInt("idorden"));
                orden.setIdcliente(rs.getInt("idcliente"));
                orden.setIdcomida(rs.getInt("idcomida"));
                orden.setCantidad(rs.getInt("cantidad"));
                orden.setPrecioTotal(rs.getFloat("precioTotal"));
                orden.setFecha(rs.getDate("fecha"));
                ordencliente.add(orden);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(OrdenClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ordencliente;
    }
     
      public static ArrayList<ordenCliente> mostrarOrdenSegunIDComida(int idcomida){
        ArrayList<ordenCliente> ordencliente = new ArrayList();
        String sql = "SELECT * FROM ordencliente WHERE IDCOMIDA = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idcomida);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ordenCliente orden = new ordenCliente();
                orden.setIdorden(rs.getInt("idorden"));
                orden.setIdcliente(rs.getInt("idcliente"));
                orden.setIdcomida(rs.getInt("idcomida"));
                orden.setCantidad(rs.getInt("cantidad"));
                orden.setPrecioTotal(rs.getFloat("precioTotal"));
                orden.setFecha(rs.getDate("fecha"));
                ordencliente.add(orden);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(OrdenClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ordencliente;
    }
      
      public static ArrayList<ordenCliente> mostrarOrdenSegunIDComidaAsc(int idcomida){
        ArrayList<ordenCliente> ordencliente = new ArrayList();
        String sql = "SELECT * FROM ordencliente WHERE IDCOMIDA = ? ORDER BY PRECIOTOTAL";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idcomida);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ordenCliente orden = new ordenCliente();
                orden.setIdorden(rs.getInt("idorden"));
                orden.setIdcliente(rs.getInt("idcliente"));
                orden.setIdcomida(rs.getInt("idcomida"));
                orden.setCantidad(rs.getInt("cantidad"));
                orden.setPrecioTotal(rs.getFloat("precioTotal"));
                orden.setFecha(rs.getDate("fecha"));
                ordencliente.add(orden);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(OrdenClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ordencliente;
    }
      
      public static ArrayList<ordenCliente> mostrarOrdenSegunIDComidaDesc(int idcomida){
        ArrayList<ordenCliente> ordencliente = new ArrayList();
        String sql = "SELECT * FROM ordencliente WHERE IDCOMIDA = ? ORDER BY PRECIOTOTAL DESC";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idcomida);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ordenCliente orden = new ordenCliente();
                orden.setIdorden(rs.getInt("idorden"));
                orden.setIdcliente(rs.getInt("idcliente"));
                orden.setIdcomida(rs.getInt("idcomida"));
                orden.setCantidad(rs.getInt("cantidad"));
                orden.setPrecioTotal(rs.getFloat("precioTotal"));
                orden.setFecha(rs.getDate("fecha"));
                ordencliente.add(orden);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(OrdenClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ordencliente;
    }
}
