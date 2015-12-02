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
        + " where (ING.nome like '%{FILTRO}%')"
	+ " or (ING.descricao like '%{FILTRO}%')"
        + " or (TPI.descricao like '%{FILTRO}%')";
    
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
            throw new RuntimeException("Erro ao buscar Ingredientes." + stmtGetFiltrado +ex.getMessage());
        }finally{
            try{rset.close();}catch(Exception ex){System.out.println("Erro ao finalizar lista de resultados: "+ex.getMessage());}
            try{stmt.close();  }catch(Exception ex){System.out.println("Erro ao finalizar busca: "+ex.getMessage());}
            try{conn.close();   }catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
    
}
