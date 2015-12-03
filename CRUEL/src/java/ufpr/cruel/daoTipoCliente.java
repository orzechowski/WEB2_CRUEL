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
public class daoTipoCliente {
    
    private final String stmtGetTodos = "SELECT * FROM tipocliente";
    private final String stmtUpdate = "UPDATE TipoCliente SET valor=?, ativo=? WHERE descricao=?";
    
    public List<TipoCliente> getTudo() throws SQLException{
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        ResultSet           rset    = null;
        
        try{
                                  
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtGetTodos);
            
            rset = stmt.executeQuery();
            List<TipoCliente> listaTodos = new ArrayList();
            
            while (rset.next()) {
                
                TipoCliente     cli = new TipoCliente();
                                      
                cli.setIdTipoCliente(rset.getInt("id_tipoc"));
                cli.setDescricao(rset.getString("descricao"));
                cli.setValor(rset.getDouble("valor"));
                cli.setAtivo(rset.getBoolean("ativo"));
                
                listaTodos.add(cli);
            }
            
            return listaTodos;
            
        }catch(SQLException ex){
            throw new RuntimeException("Erro ao buscar Ingredientes." +ex.getMessage());
        }finally{
            try{rset.close();}catch(Exception ex){System.out.println("Erro ao finalizar lista de resultados: "+ex.getMessage());}
            try{stmt.close();  }catch(Exception ex){System.out.println("Erro ao finalizar busca: "+ex.getMessage());}
            try{conn.close();   }catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
    
    public void update(TipoCliente cli){
        Connection        con      = null;
        PreparedStatement stmt     = null;
        
        try{
            con  = ConnectionFactory.getConnection();
            stmt = con.prepareStatement(stmtUpdate);
            
            stmt.setDouble(1, cli.getValor());
            stmt.setBoolean(2, cli.getAtivo());
            stmt.setString(3, cli.getDescricao());
            
            stmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Erro ao atualizar Tipo de Cliente ");
            throw new RuntimeException(e);
        }finally{
            try{stmt.close();}catch(Exception ex){System.out.println("Erro ao finalizar transação: "+ex.getMessage());}
            try{con.close();}catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
    
}
