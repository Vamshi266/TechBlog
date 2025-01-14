/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.helper;

import java.sql.*;

/**
 *  
 * @author vamsh
 */
public class ConnectionProvider {
    
    private static Connection connection;
    
    public static Connection getConnection()
    {
        
        try 
        {
            
            if(connection != null)
                return connection;
            
            //loading driver class
            Class.forName("com.mysql.jdbc.Driver");
            
            //create a connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "root");        
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return connection;
    }
    
}
