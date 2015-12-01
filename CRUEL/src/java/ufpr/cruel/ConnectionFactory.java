/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.cruel;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author Cristopher
 */
public class ConnectionFactory {
    
    //TODO: Arquivo de propriedades para esconder os parametros de conexão
    public static Connection getConnection() throws SQLException{
        Connection conn = null;
        
        try {
            
            Class.forName("org.postgresql.Driver");
            
            String dbUrl = "jdbc:postgresql://localhost:5432/CRUEL_ORG";
            String dbUser = "postgres";
            String dbPwd = "admin";
            
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
            
            return conn;
        }catch (ClassNotFoundException ex){
            throw new RuntimeException("Erro no driver do BD" + ex.getMessage());}
            
        catch (SQLException ex){
            throw new RuntimeException("Não foi possível se conectar ao banco de dados" + ex.getMessage());}
    }
}
