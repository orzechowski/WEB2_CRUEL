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
    
    /****************************************************************
     * 
     * FUNÇÃO SÓ COPIADA, NÃO TRABALHEI NEM UM POUCO NELA AINDA!!!
     * 
     ****************************************************************/
    public List<Cardapio> getPeriodo(String dtIni, String dtFin) throws SQLException{
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        ResultSet           rset    = null;
        
        try{
                                  
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtGetPeriodo);
            
            rset = stmt.executeQuery();
            List<Registro> listaTodos = new ArrayList();
            
            while (rset.next()) {
                TipoCliente tp = new TipoCliente();
                Registro reg = new Registro();
                
                tp.setIdTipoCliente(rset.getInt("id_tipo"));
                tp.setDescricao(rset.getString("descricao"));
                tp.setValor(rset.getDouble("valor"));
                tp.setAtivo(rset.getBoolean("ativo"));
                
                reg.setCpfColaborador(rset.getString("cpf_colaborador"));
                reg.setDtHora(rset.getDate("datahora"));
                reg.setValorCobrado((float)rset.getDouble("valor_cobrado"));
                reg.setTpCliente(tp);
                
                listaTodos.add(reg);
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
}
