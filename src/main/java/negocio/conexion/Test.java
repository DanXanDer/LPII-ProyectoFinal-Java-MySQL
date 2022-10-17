/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package negocio.conexion;

import java.sql.Connection;

/**
 *
 * @author Daniel
 */
public class Test {

    public static void main(String[] args) {
        Connection cn = Conexion.abrir();
        System.out.println("Conexion: " + cn);
    }
}
