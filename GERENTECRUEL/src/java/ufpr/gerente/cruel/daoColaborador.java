/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.gerente.cruel;

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
public class daoColaborador {
    
    private final String stmtValidarLogin = "select CLB.cpf,CLB.nome,CLB.email,"+
            " CLB.senha,CLB.endereco,CLB.telefone,CLB.crn,CLB.ativo," +
            " CR.nome as cargo, CR.id_cargo" +
            " from colaborador as CLB join cargo as CR on CLB.id_cargo = CR.id_cargo" +
            " where cpf = ? and senha=? and ativo=true";
    
    private final String stmtInserir = "INSERTO INTO colaborador VALUES(?,?,?,?,?,?,?,?,?)";
    
    private final String stmtUpdate = "UPDATE colaborador SET email=?,senha=?,endereco=?,telefone=?  WHERE cpf=?";
    
    private final String stmtGetFiltrado = "select CLB.cpf,CLB.nome,CLB.email," +
            " CLB.senha,CLB.endereco,CLB.telefone,CLB.crn,CLB.ativo," +
            " CR.nome as cargo, CR.id_cargo" +
            " from colaborador as CLB join cargo as CR on CLB.id_cargo = CR.id_cargo" +
            " where (CLB.cpf like '%{FILTRO}%') or (CLB.nome like '%{FILTRO}%')" +
            " or (CLB.crn like '%{FILTRO}%') and ativo=true";
    
    public Colaborador login(String usuario, String senha) throws SQLException {
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        ResultSet           rset    = null;
        Colaborador         colabValidado  = new Colaborador();
        Cargo               cargo   = new Cargo();
        
        try{
                                  
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtValidarLogin);
            stmt.setString(1, usuario);
            stmt.setString(2,senha);
            
            rset = stmt.executeQuery();
            colabValidado.setCpf(null);
            
            
            while (rset.next()) {
                cargo.setIdCargo(rset.getInt("id_cargo"));
                cargo.setDescricao(rset.getString("cargo"));
                colabValidado.setCargo(cargo);
                
                colabValidado.setAtivo(rset.getBoolean("ativo"));
                colabValidado.setCpf(rset.getString("cpf"));
                colabValidado.setCrn(rset.getString("crn"));
                colabValidado.setEmail(rset.getString("email"));
                colabValidado.setEndereco(rset.getString("endereco"));
                colabValidado.setNome(rset.getString("nome"));
                colabValidado.setTelefone(rset.getString("telefone"));
                
            }
            
            return colabValidado;
            
        }catch(SQLException ex){
            throw new RuntimeException("Erro ao validar Login." +ex.getMessage());
        }finally{
            try{rset.close();}catch(Exception ex){System.out.println("Erro ao finalizar lista de resultados: "+ex.getMessage());}
            try{stmt.close();  }catch(Exception ex){System.out.println("Erro ao finalizar busca: "+ex.getMessage());}
            try{conn.close();   }catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
    
    public void inserir(Colaborador colab) throws SQLException {
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        ResultSet           rset    = null;
        
        try{
                                  
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtInserir);
          
            stmt.setString(1, colab.getCpf());
            stmt.setString(2, colab.getNome());
            stmt.setString(3, colab.getEmail());
            stmt.setString(4, colab.getSenha());
            stmt.setString(5, colab.getEndereco());
            stmt.setString(6, colab.getTelefone());
            stmt.setString(7, colab.getCrn());
            stmt.setBoolean(8, colab.getAtivo());
            stmt.setInt(9, colab.getCargo().getIdCargo());
            
            
            stmt.executeUpdate();            
                        
        }catch(SQLException ex){
            throw new RuntimeException("Erro ao inserir Colaborador." +ex.getMessage());
        }finally{
            try{rset.close();}catch(Exception ex){System.out.println("Erro ao finalizar lista de resultados: "+ex.getMessage());}
            try{stmt.close();  }catch(Exception ex){System.out.println("Erro ao finalizar busca: "+ex.getMessage());}
            try{conn.close();   }catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
    
    public void update(Colaborador colab) throws SQLException {
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        ResultSet           rset    = null;
               
        try{
                                  
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtUpdate);
            
            stmt.setString(1, colab.getEmail());
            stmt.setString(2, colab.getSenha());
            stmt.setString(3, colab.getEndereco());
            stmt.setString(4, colab.getTelefone());
            stmt.setString(5, colab.getCpf());
            
            
            stmt.executeUpdate();            
                        
        }catch(SQLException ex){
            throw new RuntimeException("Erro ao atualizar Colaborador." +ex.getMessage());
        }finally{
            try{rset.close();}catch(Exception ex){System.out.println("Erro ao finalizar lista de resultados: "+ex.getMessage());}
            try{stmt.close();  }catch(Exception ex){System.out.println("Erro ao finalizar busca: "+ex.getMessage());}
            try{conn.close();   }catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
    }
    
    public List<Colaborador> getFiltrado(String filtro) {
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        ResultSet           rset    = null;
               
        try{               
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtGetFiltrado.replace("{FILTRO}", filtro));
            List <Colaborador> listaColab = new ArrayList();
            
            rset = stmt.executeQuery();
                        
            while (rset.next()) {
                Colaborador colab  = new Colaborador();
                Cargo cargo   = new Cargo();
                
                cargo.setIdCargo(rset.getInt("id_cargo"));
                cargo.setDescricao(rset.getString("cargo"));
                colab.setCargo(cargo);
                
                colab.setAtivo(rset.getBoolean("ativo"));
                colab.setCpf(rset.getString("cpf"));
                colab.setCrn(rset.getString("crn"));
                colab.setEmail(rset.getString("email"));
                colab.setEndereco(rset.getString("endereco"));
                colab.setNome(rset.getString("nome"));
                colab.setTelefone(rset.getString("telefone"));   
                
                listaColab.add(colab);
            }
            
            return listaColab;
            
        }catch(SQLException ex){
            throw new RuntimeException("Erro ao atualizar Colaborador." +ex.getMessage());
        }finally{
            try{rset.close();}catch(Exception ex){System.out.println("Erro ao finalizar lista de resultados: "+ex.getMessage());}
            try{stmt.close();  }catch(Exception ex){System.out.println("Erro ao finalizar busca: "+ex.getMessage());}
            try{conn.close();   }catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
        
    }
    
}
