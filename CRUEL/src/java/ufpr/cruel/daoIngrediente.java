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
public class daoIngrediente {
    
    private final String stmtGetFiltrado = "SELECT ING.id_ingrediente,ING.nome,"
        + " ING.descricao,TPI.id_tipoingrediente,TPI.descricao AS tp_descricao"
        + " FROM ingrediente AS ING JOIN tipoingrediente AS TPI"
        + " ON ING.id_tipoingrediente=TPI.id_tipoingrediente"
        + " where (ING.nome ilike '%{FILTRO}%')"
	+ " or (ING.descricao ilike '%{FILTRO}%')"
        + " or (TPI.descricao ilike '%{FILTRO}%')"
        + " order by tp_descricao asc, nome asc";
    
    private final String stmtInserir = "INSERT INTO ingrediente(nome,descricao,id_tipoingrediente) VALUES(?,?,?)";
    private final String stmtExcluirDoCardapio = "DELETE FROM ingredientescardapio WHERE ingrediente = ?";
    private final String stmtExcluir = "DELETE FROM ingrediente WHERE id_ingrediente = ?";
    
    // TODO UPDATE ATUALIZA NOME E DESCRIÇÃO, MESMO QUE CONTINUEM OS MESMOS
    private final String stmtUpdate = "UPDATE ingrediente SET nome=?, descricao=?, id_tipoingrediente=? WHERE id_ingrediente=?";
    
    public List<Ingrediente> getFiltrado(String filtro) throws SQLException{
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        ResultSet           rset    = null;
        
        try{
                                  
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtGetFiltrado.replace("{FILTRO}", filtro));
            
            rset = stmt.executeQuery();
            List<Ingrediente> listaTodos = new ArrayList();
            
            while (rset.next()) {
                TipoIngrediente tp = new TipoIngrediente();
                Ingrediente     ing = new Ingrediente();
                
                tp.setIdTipoIngrediente(rset.getInt("id_tipoingrediente"));
                tp.setDescricao(rset.getString("tp_descricao"));
                
                ing.setIdIngrediente(rset.getInt("id_ingrediente"));
                ing.setNome(rset.getString("nome"));
                ing.setDescricao(rset.getString("descricao"));
                ing.setTipoIngrediente(tp);
                
                listaTodos.add(ing);
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
    
    public void inserir (Ingrediente ing){
        
        Connection con = null;
        PreparedStatement stmt = null;
        
        try{
            con = ConnectionFactory.getConnection();
            stmt = con.prepareStatement(stmtInserir);
            
            stmt.setString(1, ing.getNome());
            stmt.setString(2, ing.getDescricao());
            stmt.setInt(3, ing.getTipoIngrediente().getIdTipoIngrdiente());
            
            stmt.executeUpdate();
        }catch(SQLException ex){
               throw new RuntimeException("Erro ao adicionar Ingrediente: "+ex.getMessage());            
        }finally{
            try{stmt.close();}catch(Exception ex){System.out.println("Erro ao finalizar transação: "+ex.getMessage()); }
            try{con.close();}catch(Exception ex){ System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
    
    public void excluir (Ingrediente ing){
        
        Connection con = null;
        PreparedStatement stmt = null;
        PreparedStatement stmtConsist = null;
        
        try{
            con = ConnectionFactory.getConnection();
            stmt = con.prepareStatement(stmtExcluir);
            stmtConsist = con.prepareStatement(stmtExcluirDoCardapio);
            
            stmt.setInt(1, ing.getIdIngrediente());
            stmtConsist.setInt(1, ing.getIdIngrediente());
            try{
                stmtConsist.executeUpdate();
            }catch(SQLException ex) {
                throw new RuntimeException("Erro ao excluir Ingrediente dos Cardapios: "+ex.getMessage());
            }
            stmt.executeUpdate();
        }catch(SQLException ex){
               throw new RuntimeException("Erro ao excluir Ingrediente: "+ex.getMessage());            
        }finally{
            try{stmt.close();}catch(Exception ex){System.out.println("Erro ao finalizar transação: "+ex.getMessage()); }
            try{con.close();}catch(Exception ex){ System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
    
    
    
    public void update(Ingrediente ing){
        Connection        con      = null;
        PreparedStatement stmt     = null;
        
        try{
            con  = ConnectionFactory.getConnection();
            stmt = con.prepareStatement(stmtUpdate);
            
            stmt.setString(1, ing.getNome());
            stmt.setString(2, ing.getDescricao());
            stmt.setInt(3, ing.getTipoIngrediente().getIdTipoIngrdiente());
            stmt.setInt(4, ing.getIdIngrediente());
            
            stmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Erro ao atualizar Ingrediente ");
            throw new RuntimeException(e);
        }finally{
            try{stmt.close();}catch(Exception ex){System.out.println("Erro ao finalizar transação: "+ex.getMessage());}
            try{con.close();}catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
    
}
