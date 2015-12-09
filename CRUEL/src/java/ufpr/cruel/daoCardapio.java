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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import jdk.nashorn.internal.runtime.ParserException;

/**
 *
 * @author Cristopher
 */
public class daoCardapio {
    
    private final String stmtGetPeriodo = "select * from cardapio as CAR where CAR.data between current_date and current_date+7;";
    private final String stmtGetSemana = "select * from cardapio as CAR where CAR.data between CURRENT_DATE and (CURRENT_DATE+5)";
    private final String stmtGetAll = "select * from cardapio";
    private final String stmtGetIngredientes = "select ING.id_ingrediente, ING.nome,ING.descricao,"
            +" ING.id_tipoingrediente,TP.descricao as tp_descricao from ingredientescardapio as INC"
            +" join ingrediente as ING on INC.ingrediente = ING.id_ingrediente join tipoingrediente as TP"
            +" on ING.id_tipoingrediente = TP.id_tipoingrediente where INC.id_cardapio=?";
    
    private final String stmtInserirCardapio = "INSERT INTO cardapio(data, id_refeicao) VALUES (?,?)";
    private final String stmtInserirIngredientesCardapio = "INSERT INTO ingredientescardapio(id_cardapio, ingrediente) values (?,?)";
    private final String stmtExcluirIngredientesCardapio = "DELETE FROM ingredientescardapio WHERE id_cardapio = ?";
    
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
            
            rset = stmt.executeQuery();
            List<Cardapio> listaTodos = new ArrayList();
            
            while (rset.next()) {
                Cardapio cardapio = new Cardapio();
                List<Ingrediente> ingredientes = new ArrayList();
                
                cardapio.setData(rset.getDate("data").toString());
                cardapio.setIdCardapio(rset.getInt("id_cardapio"));
                
                try{
                    stmtING = conn.prepareStatement(stmtGetIngredientes);
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
                }catch(SQLException ex){
                    throw new RuntimeException("Erro ao buscar ingredientes do cardapio." +ex.getMessage());
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
    
    public void Inserir(Cardapio cardapio) throws SQLException {
        Connection conn = null;
        PreparedStatement stmtCAR = null;
        PreparedStatement stmtINGCAR = null;
        ResultSet rset = null;
        java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
        
        try{
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            //Date customDate = new Date();
            //String dataCAR = dateFormat.format(cardapio.getData());
            sqlDate = new java.sql.Date(dateFormat.parse(cardapio.getData()).getTime());
        }catch(ParseException pEx){
            throw new RuntimeException("Erro ao converter data." + pEx.getMessage());
        }

        try {
            conn = ConnectionFactory.getConnection();
            stmtCAR = conn.prepareStatement(stmtInserirCardapio, PreparedStatement.RETURN_GENERATED_KEYS);
            stmtCAR.setDate(1, sqlDate);
            stmtCAR.setInt(2, cardapio.getRefeicao());

            stmtCAR.execute();
            rset = stmtCAR.getGeneratedKeys();

            rset.next();
            int idCAR = rset.getInt(1);

            for(Ingrediente ING : cardapio.getListaIngredientes()){
                stmtINGCAR = conn.prepareStatement(stmtInserirIngredientesCardapio);
                stmtINGCAR.setInt(1, idCAR);
                stmtINGCAR.setInt(2,ING.getIdIngrediente());

                stmtINGCAR.execute();
            }
        
            
        }catch(SQLException ex){
            throw new RuntimeException("Erro ao Inserir Cardapio." +ex.getMessage());
        }finally{
            //try{rset.close();}catch(Exception ex){System.out.println("Erro ao finalizar lista de resultados: "+ex.getMessage());}
            try{stmtCAR.close();  }catch(Exception ex){System.out.println("Erro ao finalizar busca: "+ex.getMessage());}
            try{conn.close();   }catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
        }
        
    }
    
    public void Update(Cardapio cardapio) throws SQLException {
        Connection conn = null;
        PreparedStatement stmtEXC = null;
        PreparedStatement stmtINGCAR = null;
              
        /*
        java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
        
        try{
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            //Date customDate = new Date();
            //String dataCAR = dateFormat.format(cardapio.getData());
            sqlDate = new java.sql.Date(dateFormat.parse(cardapio.getData()).getTime());
        }catch(ParseException pEx){
            throw new RuntimeException("Erro ao converter data." + pEx.getMessage());
        }
        */
        try {
            conn = ConnectionFactory.getConnection();
            
            stmtEXC = conn.prepareStatement(stmtExcluirIngredientesCardapio);
            stmtEXC.setInt(1,cardapio.getIdCardapio());

            stmtEXC.execute();                    
            

            for(Ingrediente ING : cardapio.getListaIngredientes()){
                stmtINGCAR = conn.prepareStatement(stmtInserirIngredientesCardapio);
                stmtINGCAR.setInt(1, cardapio.getIdCardapio());
                stmtINGCAR.setInt(2,ING.getIdIngrediente());

                stmtINGCAR.execute();
            }
        
            
        }catch(SQLException ex){
            throw new RuntimeException("Erro ao Inserir Cardapio." +ex.getMessage());
        }finally{
            //try{rset.close();}catch(Exception ex){System.out.println("Erro ao finalizar lista de resultados: "+ex.getMessage());}
            try{stmtEXC.close();  }catch(Exception ex){System.out.println("Erro ao finalizar busca: "+ex.getMessage());}
            try{stmtINGCAR.close();  }catch(Exception ex){System.out.println("Erro ao finalizar busca: "+ex.getMessage());}
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

            rset = stmt.executeQuery();
            List<Cardapio> listaTodos = new ArrayList();
            
            while (rset.next()) {
                Cardapio cardapio = new Cardapio();
                
                cardapio.setData(rset.getDate("data").toString());
                cardapio.setIdCardapio(rset.getInt("id_cardapio"));
                cardapio.setRefeicao(rset.getInt("id_refeicao"));
                
                listaTodos.add(cardapio);
            }
            
            for(Cardapio CARD : listaTodos){
                try {
                    stmtING = conn.prepareStatement(stmtGetIngredientes);
                    stmtING.setInt(1,CARD.getIdCardapio());
                    rsetING = stmtING.executeQuery();
                    List<Ingrediente> ingredientes = new ArrayList();
                    
                    while (rsetING.next()) {
                    
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
                    
                    CARD.setListaIngredientes(ingredientes);
                } catch (SQLException ex){
                    throw new RuntimeException("Erro ao buscar Cardapio." +ex.getMessage());
                }
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
    
    public List<Cardapio> getSemana() throws SQLException{
        Connection          conn    = null;
        PreparedStatement   stmt    = null;
        PreparedStatement   stmtING = null;
        ResultSet           rset    = null;
        ResultSet           rsetING = null;
        
        try{
                                  
            conn = ConnectionFactory.getConnection();
            stmt = conn.prepareStatement(stmtGetSemana);

            rset = stmt.executeQuery();
            List<Cardapio> listaTodos = new ArrayList();
            
            while (rset.next()) {
                Cardapio cardapio = new Cardapio();
                
                cardapio.setData(rset.getDate("data").toString());
                cardapio.setIdCardapio(rset.getInt("id_cardapio"));
                cardapio.setRefeicao(rset.getInt("id_refeicao"));
                
                listaTodos.add(cardapio);
            }
            
            for(Cardapio CARD : listaTodos){
                try {
                    stmtING = conn.prepareStatement(stmtGetIngredientes);
                    stmtING.setInt(1,CARD.getIdCardapio());
                    rsetING = stmtING.executeQuery();
                    List<Ingrediente> ingredientes = new ArrayList();
                    
                    while (rsetING.next()) {
                    
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
                    
                    CARD.setListaIngredientes(ingredientes);
                } catch (SQLException ex){
                    throw new RuntimeException("Erro ao buscar Cardapio." +ex.getMessage());
                }
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
