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
public class daoRegistro {
    
    private final String stmtInserir = "INSERT INTO registro VALUES"
            + "(now(),?,?,?)";
    
    private final String stmtGetPeriodo = "select REG.datahora,REG.valor_cobrado,"
            + " REG.cpf_colaborador,"
            + " TP.id_tipo, TP.descricao, TP.valor, TP.ativo"
            + " from registro as REG join tipocliente as TP on REG.categoria_cliente = TP.id_tipo"
            + " where datahora between ? and ?";
    
    private final String stmtGetDia = "select REG.datahora,REG.valor_cobrado,"
            + " REG.cpf_colaborador,"
            + " TP.id_tipo, TP.descricao, TP.valor, TP.ativo"
            + " from registro as REG join tipocliente as TP on REG.categoria_cliente = TP.id_tipo"
            + " --where datahora <= CURRENT_DATE";
    
    private final String stmtUpdate = "UPDATE registro SET valor_cobrado=?, cpf_colaborador=?, categoria_cliente=? WHERE datahora=?";
    private final String stmtExcluir = "DELETE FROM registro where datahora=?";
    
    public void inserir (TipoCliente cli, String user){
        
        Connection con = null;
        PreparedStatement stmt = null;
        
        try{
            con = ConnectionFactory.getConnection();
            stmt = con.prepareStatement(stmtInserir);
            
            stmt.setDouble(1, cli.getValor());
            stmt.setString(2, user);
            stmt.setInt(3, cli.getIdTipoCliente());
            
            stmt.executeUpdate();
        }catch(SQLException ex){
               throw new RuntimeException("Erro ao adicionar Registro: "+ex.getMessage());            
        }finally{
            try{stmt.close();}catch(Exception ex){System.out.println("Erro ao finalizar transação: "+ex.getMessage()); }
            try{con.close();}catch(Exception ex){ System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
    
    public List<Registro> getFiltrado(String dtIni, String dtFin) throws SQLException{
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
                reg.setDtHora(rset.getTimestamp("datahora"));
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
    
    public List<Registro> getDia() throws SQLException{
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        ResultSet           rset    = null;
        
        try{
                                  
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtGetDia);
            
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
    
    public void update(Registro reg, String user){
        Connection        con      = null;
        PreparedStatement stmt     = null;
        
        try{
            con  = ConnectionFactory.getConnection();
            stmt = con.prepareStatement(stmtUpdate);
            
            stmt.setDouble(1, reg.getValorCobrado());
            stmt.setString(2, user);
            stmt.setInt(3, reg.getTpCliente().getIdTipoCliente());
            stmt.setTimestamp(4, new java.sql.Timestamp((reg.getDtHora()).getTime()));
            
            stmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Erro ao atualizar Registro ");
            throw new RuntimeException(e);
        }finally{
            try{stmt.close();}catch(Exception ex){System.out.println("Erro ao finalizar transação: "+ex.getMessage());}
            try{con.close();}catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
    
    public void excluir(Registro reg){
        Connection        con      = null;
        PreparedStatement stmt     = null;
        
        try{
            con  = ConnectionFactory.getConnection();
            stmt = con.prepareStatement(stmtExcluir);
            
            stmt.setTimestamp(1, new java.sql.Timestamp((reg.getDtHora()).getTime()));
            
            stmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Erro ao excluir Registro ");
            throw new RuntimeException(e);
        }finally{
            try{stmt.close();}catch(Exception ex){System.out.println("Erro ao finalizar transação: "+ex.getMessage());}
            try{con.close();}catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
}
