/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author GabrielMunguia
 */
public class Conexion {
    Connection con;
    public Conexion(){
        try {
            //Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Class.forName("com.mysql.cj.jdbc.Driver");
            //con = DriverManager.getConnection("jdbc:sqlserver://ANDROID:1433;databaseName=midb;user=sa;password=root;");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error: \n"+e.getClass()+"\n"+e.getMessage());
             System.out.println("error en con");
        }
    }
    public Connection getConnection(){
       
        return con;
    }
}