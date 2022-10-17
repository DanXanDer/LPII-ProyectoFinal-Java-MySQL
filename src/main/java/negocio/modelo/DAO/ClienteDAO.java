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
import negocio.modelo.Cliente;

/**
 *
 * @author Daniel
 */
public class ClienteDAO {
    
    public static void agregarCliente(Cliente c){
        String sql = "INSERT INTO CLIENTE (usuario, email, celular, clave, distrito, direccion) values (?,?,?,?,?,?)";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, c.getUsuario());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getCelular());
            ps.setString(4, c.getClave());
            ps.setString(5, c.getDistrito());
            ps.setString(6, c.getDireccion());
            ps.execute();
            cn.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static Cliente validarCliente(String email, String cl){
        Cliente c = null;
        String sql = "SELECT * FROM CLIENTE WHERE EMAIL=? AND CLAVE=?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, cl);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                c = new Cliente();
                c.setUsuario(rs.getString("usuario"));
                c.setCelular(rs.getString("celular"));
                c.setClave(rs.getString("clave"));
                c.setEmail(rs.getString("email"));
                c.setIdcliente(rs.getInt("idcliente"));
                c.setDistrito(rs.getString("distrito"));
                c.setDireccion(rs.getString("direccion"));
            }
            cn.close();
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
    
    public static void editarCliente(Cliente c){
        String sql = "UPDATE CLIENTE SET USUARIO=?, EMAIL=?, CELULAR=?, DISTRITO=?, DIRECCION=? WHERE IDCLIENTE = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, c.getUsuario());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getCelular());            
            ps.setString(4, c.getDistrito());
            ps.setString(5, c.getDireccion());
            ps.setInt(6, c.getIdcliente());
            ps.executeUpdate();
            cn.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static void editarClave(String cl, int idcliente){
        String sql = "UPDATE CLIENTE SET CLAVE = ? WHERE IDCLIENTE = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, cl);
            ps.setInt(2, idcliente);
            ps.executeUpdate();
            cn.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static boolean verificarClave(String cl){
        boolean existe = false;
        String sql = "SELECT * FROM CLIENTE WHERE CLAVE = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, cl);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                existe = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return existe;
    }
    public static void eliminarCliente(int id){
        String sql = "DELETE FROM CLIENTE WHERE IDCLIENTE = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            cn.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
     
    }
    public static Cliente mostrarClienteSegunID(int id){
        Cliente c = null;
        String sql = "SELECT * FROM CLIENTE WHERE IDCLIENTE=?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                c = new Cliente();
                c.setUsuario(rs.getString("usuario"));
                c.setCelular(rs.getString("celular"));
                c.setClave(rs.getString("clave"));
                c.setEmail(rs.getString("email"));
                c.setIdcliente(rs.getInt("idcliente"));
                c.setDistrito(rs.getString("distrito"));
                c.setDireccion(rs.getString("direccion")); 
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
    
     public static ArrayList<Cliente> mostrarClientes(){
        ArrayList<Cliente> clientes = new ArrayList();
        Cliente c = null;
        String sql = "SELECT * FROM CLIENTE";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                c = new Cliente();
                c.setUsuario(rs.getString("usuario"));
                c.setCelular(rs.getString("celular"));
                c.setClave(rs.getString("clave"));
                c.setEmail(rs.getString("email"));
                c.setIdcliente(rs.getInt("idcliente"));
                c.setDistrito(rs.getString("distrito"));
                c.setDireccion(rs.getString("direccion")); 
                clientes.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clientes;
    }
}
