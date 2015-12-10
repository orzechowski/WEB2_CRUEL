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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Cristopher
 */
public class daoTipoIngrediente {
    
    private final String stmtInserir = "INSERT INTO tipoingrediente(descricao) VALUES (?)";
    private final String stmtGetTodos = "SELECT id_tipoingrediente, descricao FROM tipoingrediente ORDER BY descricao ASC";
    
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
    
    public List<TipoIngrediente> getTodos() throws SQLException{
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        ResultSet           rset    = null;
        
        try{
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtGetTodos);
            
            rset = stmt.executeQuery();
            List<TipoIngrediente> listaTodos = new ArrayList();
            
            while (rset.next()) {
                TipoIngrediente tp = new TipoIngrediente();
                
                tp.setIdTipoIngrediente(rset.getInt("id_tipoingrediente"));
                tp.setDescricao(rset.getString("descricao"));
                
                listaTodos.add(tp);
            }
            
            return listaTodos;
            
        }catch(SQLException ex){
            throw new RuntimeException("Erro ao buscar Tipos de Ingredientes. "+ex.getMessage());
        }finally{
            try{rset.close();}catch(Exception ex){System.out.println("Erro ao finalizar lista de resultados: "+ex.getMessage());}
            try{stmt.close();  }catch(Exception ex){System.out.println("Erro ao finalizar busca: "+ex.getMessage());}
            try{conn.close();   }catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
}
