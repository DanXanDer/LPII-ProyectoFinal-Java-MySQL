/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package negocio.modelo.DAO;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import negocio.conexion.Conexion;
import negocio.modelo.Comida;

/**
 *
 * @author Daniel
 */
public class ComidaDAO {

    public static ArrayList<Comida> mostrarComidas() {
        ArrayList<Comida> comidas = new ArrayList();
        Comida comida = null;
        String sql = "SELECT * FROM COMIDA";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                comida = new Comida();
                comida.setIdcomida(rs.getInt("idcomida"));
                comida.setNombre(rs.getString("nombre"));
                comida.setDescripcion(rs.getString("descripcion"));
                comida.setPrecio(rs.getFloat("precio"));
                comida.setFoto(rs.getBinaryStream("foto"));
                comida.setIdcategoria(rs.getInt("idcategoria"));
                comidas.add(comida);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comidas;
    }

    public static ArrayList<Comida> mostrarComidasSegunCategoria(int idcategoria) {
        ArrayList<Comida> comidas = new ArrayList();
        Comida comida = null;
        String sql = "SELECT * FROM COMIDA WHERE IDCATEGORIA = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idcategoria);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                comida = new Comida();
                comida.setIdcomida(rs.getInt("idcomida"));
                comida.setNombre(rs.getString("nombre"));
                comida.setDescripcion(rs.getString("descripcion"));
                comida.setPrecio(rs.getFloat("precio"));
                comida.setFoto(rs.getBinaryStream("foto"));
                comida.setIdcategoria(rs.getInt("idcategoria"));
                comidas.add(comida);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comidas;
    }
    
    public static Comida mostrarComidaSegunId(int idcomida) {
        
        Comida comida = null;
        String sql = "SELECT * FROM COMIDA WHERE IDCOMIDA = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idcomida);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                comida = new Comida();
                comida.setIdcomida(rs.getInt("idcomida"));
                comida.setNombre(rs.getString("nombre"));
                comida.setDescripcion(rs.getString("descripcion"));
                comida.setPrecio(rs.getFloat("precio"));
                comida.setFoto(rs.getBinaryStream("foto"));
                comida.setIdcategoria(rs.getInt("idcategoria"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comida;
    }

    public static void listarImg(int id, HttpServletResponse response) throws IOException {
        String sql = "select * from comida where idcomida = ?";
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            outputStream = response.getOutputStream();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("foto");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ComidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static Comida comidaSegunID(int idcomida) {
        Comida comida = null;
        String sql = "SELECT * FROM COMIDA WHERE IDCOMIDA = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idcomida);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                comida = new Comida();
                comida.setIdcomida(rs.getInt("idcomida"));
                comida.setNombre(rs.getString("nombre"));
                comida.setDescripcion(rs.getString("descripcion"));
                comida.setPrecio(rs.getFloat("precio"));
                comida.setFoto(rs.getBinaryStream("foto"));
                comida.setIdcategoria(rs.getInt("idcategoria"));
            }
            cn.close();
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ComidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comida;
    }
    
    public static void agregarComida(Comida c){
        String sql = "INSERT INTO COMIDA (NOMBRE, DESCRIPCION, PRECIO, FOTO, IDCATEGORIA) VALUES (?,?,?,?,?)";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getDescripcion());
            ps.setFloat(3, c.getPrecio());
            ps.setBlob(4, c.getFoto());
            ps.setInt(5, c.getIdcategoria());
            ps.execute();
            cn.close();
            ps.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(ComidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static void editarComida(Comida c){
        String sql = "UPDATE COMIDA SET NOMBRE=?, DESCRIPCION=?, PRECIO=?, IDCATEGORIA=? WHERE IDCOMIDA = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getDescripcion());
            ps.setFloat(3, c.getPrecio());
            
            ps.setInt(4, c.getIdcategoria());
            ps.setInt(5, c.getIdcomida());
            ps.execute();
            cn.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ComidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void editarComidaImagen(Comida c){
        String sql = "UPDATE COMIDA SET FOTO = ? WHERE IDCOMIDA = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setBlob(1, c.getFoto());
            ps.setInt(2, c.getIdcomida());
            ps.execute();
            cn.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ComidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void eliminarComida(int idcomida){
        String sql = "DELETE FROM COMIDA WHERE IDCOMIDA = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idcomida);
            ps.execute();
            cn.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ComidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static ArrayList<Comida> buscarComidaPorNombre(String nombre){
        ArrayList<Comida> comidas = new ArrayList();
        String sql = "SELECT * FROM COMIDA WHERE NOMBRE LIKE ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, "%"+nombre+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Comida comida = new Comida();
                comida.setIdcomida(rs.getInt("idcomida"));
                comida.setNombre(rs.getString("nombre"));
                comida.setDescripcion(rs.getString("descripcion"));
                comida.setPrecio(rs.getFloat("precio"));
                comida.setFoto(rs.getBinaryStream("foto"));
                comida.setIdcategoria(rs.getInt("idcategoria"));
                comidas.add(comida);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ComidaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comidas;
    }
}
