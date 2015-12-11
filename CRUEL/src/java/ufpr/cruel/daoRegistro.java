/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.cruel;

import com.sun.xml.ws.security.impl.policy.Constants;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
            + " where (datahora)::date = (to_char(?::date,'YYYY-MM-DD'))::date order by REG.datahora desc";
    
    private final String stmtGetDia = "select to_char(REG.datahora,'DD/MM/YYYY HH24:MI:SS')as datahora,REG.valor_cobrado,"
            + " REG.cpf_colaborador,"
            + " TP.id_tipo, TP.descricao, TP.valor, TP.ativo"
            + " from registro as REG join tipocliente as TP on REG.categoria_cliente = TP.id_tipo"
            + " --where datahora <= CURRENT_DATE"
            + " order by REG.datahora desc";
    
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
    
    public List<Registro> getFiltrado(String filtroData) throws SQLException{
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        ResultSet           rset    = null;
        java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
        
        try{
                                  
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtGetPeriodo);
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                try{
                    //Date dtfiltro = sdf.parse(filtroData);
                    if (filtroData != null){
                        //sqlDate = new java.sql.Date(System.currentTimeMillis());
                        sqlDate = new java.sql.Date((sdf.parse(filtroData)).getTime());
                        
                    }else {
                        sqlDate = new java.sql.Date((Calendar.getInstance().getTime()).getTime());
                    }
                    
                    stmt.setDate(1, sqlDate);
                }catch(ParseException pEx){
                    throw new RuntimeException(pEx.getMessage());
                }
            
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
                
                //Date dtHora = new Date(rset.getDate("datahora").getTime());
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                try{
                    Date dtHora = sdf.parse(rset.getString("datahora"));
                    reg.setDtHora(dtHora);
                }catch(ParseException pEx){
                    throw new RuntimeException(pEx.getMessage());
                }
                
                
                reg.setCpfColaborador(rset.getString("cpf_colaborador"));
                
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
