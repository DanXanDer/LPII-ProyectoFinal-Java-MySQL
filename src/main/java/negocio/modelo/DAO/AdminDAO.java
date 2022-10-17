/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package negocio.modelo.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import negocio.conexion.Conexion;
import negocio.modelo.Admin;

/**
 *
 * @author Daniel
 */
public class AdminDAO {
    
    public static Admin buscarAdmin(String email, String clave){
        Admin admin = null;
        String sql = "SELECT * FROM ADMIN WHERE EMAIL = ? AND CLAVE = ?";
        Connection cn = Conexion.abrir();
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, clave);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                admin = new Admin(rs.getString("email"),rs.getString("clave"));
                admin.setIdadmin(rs.getInt("idadmin"));
            }
            cn.close();
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return admin;
    }
}
