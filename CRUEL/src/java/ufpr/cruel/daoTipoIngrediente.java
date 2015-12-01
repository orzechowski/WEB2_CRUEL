/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.cruel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Cristopher
 */
public class daoTipoIngrediente {
    
    private final String stmtInserir = "INSERT INTO tipoingrediente(descricao) VALUES (?)";
    
    public void inserir(TipoIngrediente Tp){
        
        Connection        conn   = null;
        PreparedStatement stmt  = null;
        try{
            conn  = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtInserir);
            stmt.setString(1, Tp.getDescricao());
            stmt.execute();
            
        }catch(SQLException ex){
               throw new RuntimeException("Erro ao inserir ingrediente: "+ex.getMessage());            
        }finally{
            try{stmt.close();}catch(Exception ex){System.out.println("Erro ao finalizar transação: "+ex.getMessage());}
            try{conn.close(); }catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
        
    }
}
