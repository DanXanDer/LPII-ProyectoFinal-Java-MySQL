/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package negocio.conexion;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Daniel
 */
public class Conexion {

    private final static String url = "jdbc:mysql://localhost/cevicheria";
    private final static String usuario = "root";
    private final static String password = "";
    private static Connection cn;

    public static Connection abrir() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(url, usuario, password);
        } catch (Exception ex) {
            return null;
        }
        return cn;
    }
}
