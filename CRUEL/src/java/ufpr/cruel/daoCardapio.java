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
public class daoCardapio {
    
    private final String stmtGetPeriodo = "select * from cardapio as CAR where CAR.data between ? and ?";
    private final String stmtGetAll = "select * from cardapio";
    private final String stmtGetIngredientes = "select * from ingredientescardapio where id_cardapio=?";
    
    public List<Cardapio> getPeriodo(String dtIni, String dtFin) throws SQLException{
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        PreparedStatement   stmtING = null;
        ResultSet           rset    = null;
        ResultSet           rsetING = null;
        
        try{
                                  
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtGetPeriodo);
            stmt.setString(1, dtIni);
            stmt.setString(2, dtFin);
            
            stmtING = conn.prepareStatement(stmtGetIngredientes);
            
            
            rset = stmt.executeQuery();
            List<Cardapio> listaTodos = new ArrayList();
            
            while (rset.next()) {
                Cardapio cardapio = new Cardapio();
                List<Ingrediente> ingredientes = new ArrayList();
                
                cardapio.setData(rset.getDate("data").toString());
                cardapio.setIdCardapio(rset.getInt("id_cardapio"));
                
                stmtING.setInt(1,cardapio.getIdCardapio());
                rsetING = stmtING.executeQuery();
                while (rset.next()) {
                    
                    Ingrediente novoING = new Ingrediente();
                    TipoIngrediente novoTipo = new TipoIngrediente();
                    
                    novoTipo.setIdTipoIngrediente(rsetING.getInt("id_tipoingrediente"));
                    novoTipo.setDescricao(rsetING.getString("tp_descricao"));
                    
                    novoING.setIdIngrediente(rsetING.getInt("id_ingrediente"));
                    novoING.setNome(rsetING.getString("nome"));
                    novoING.setDescricao(rsetING.getString("descricao"));
                    novoING.setTipoIngrediente(novoTipo);
                    
                    ingredientes.add(novoING);
                }

                listaTodos.add(cardapio);
            }
            
            return listaTodos;
            
        }catch(SQLException ex){
            throw new RuntimeException("Erro ao buscar Cardapio." +ex.getMessage());
        }finally{
            try{rset.close();}catch(Exception ex){System.out.println("Erro ao finalizar lista de resultados: "+ex.getMessage());}
            try{stmt.close();  }catch(Exception ex){System.out.println("Erro ao finalizar busca: "+ex.getMessage());}
            try{conn.close();   }catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
    
    public List<Cardapio> getAll() throws SQLException{
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        PreparedStatement   stmtING = null;
        ResultSet           rset    = null;
        ResultSet           rsetING = null;
        
        try{
                                  
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtGetAll);
                        
            stmtING = conn.prepareStatement(stmtGetIngredientes);
            
            
            rset = stmt.executeQuery();
            List<Cardapio> listaTodos = new ArrayList();
            
            while (rset.next()) {
                Cardapio cardapio = new Cardapio();
                List<Ingrediente> ingredientes = new ArrayList();
                
                cardapio.setData(rset.getDate("data").toString());
                cardapio.setIdCardapio(rset.getInt("id_cardapio"));
                
                stmtING.setInt(1,cardapio.getIdCardapio());
                rsetING = stmtING.executeQuery();
                while (rset.next()) {
                    
                    Ingrediente novoING = new Ingrediente();
                    TipoIngrediente novoTipo = new TipoIngrediente();
                    
                    novoTipo.setIdTipoIngrediente(rsetING.getInt("id_tipoingrediente"));
                    novoTipo.setDescricao(rsetING.getString("tp_descricao"));
                    
                    novoING.setIdIngrediente(rsetING.getInt("id_ingrediente"));
                    novoING.setNome(rsetING.getString("nome"));
                    novoING.setDescricao(rsetING.getString("descricao"));
                    novoING.setTipoIngrediente(novoTipo);
                    
                    ingredientes.add(novoING);
                }
                
                cardapio.setListaIngredientes(ingredientes);
                listaTodos.add(cardapio);
            }
            
            return listaTodos;
            
        }catch(SQLException ex){
            throw new RuntimeException("Erro ao buscar Cardapio." +ex.getMessage());
        }finally{
            try{rset.close();}catch(Exception ex){System.out.println("Erro ao finalizar lista de resultados: "+ex.getMessage());}
            try{stmt.close();  }catch(Exception ex){System.out.println("Erro ao finalizar busca: "+ex.getMessage());}
            try{conn.close();   }catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
}
