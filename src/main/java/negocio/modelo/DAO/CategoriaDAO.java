
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
import negocio.modelo.Categoria;

/**
 *
 * @author Daniel
 */
public class CategoriaDAO {
    
    public static Categoria obtenerCategoria(int idcategoria){
        Categoria categoria = null;
        String sql = "SELECT * FROM CATEGORIA WHERE IDCATEGORIA = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idcategoria);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                categoria = new Categoria();
                categoria.setIdcategoria(rs.getInt("idcategoria"));
                categoria.setCategoria(rs.getString("categoria"));
            }
            cn.close();
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return categoria;
    }
    
    public static ArrayList<Categoria> listarCategorias(){
        ArrayList<Categoria> categorias = new ArrayList();
        Categoria cat = null;
        String sql = "SELECT * FROM CATEGORIA";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                cat = new Categoria();
                cat.setIdcategoria(rs.getInt("idcategoria"));
                cat.setCategoria(rs.getString("categoria"));
                categorias.add(cat);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorias;
    }
    
}
