/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.gerente.cruel;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import static java.lang.Boolean.parseBoolean;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import ufpr.gerente.cruel.TipoCliente;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.GenericType;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.util.*;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author vishi_000
 */
@WebServlet(name = "ServGerente", urlPatterns = {"/ServGerente"})
public class ServGerente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            String action = request.getParameter("action");
            daoColaborador daoColab = new daoColaborador();
            
            if (action.equals("atualizarTpCliente")){
                String nome     = request.getParameter("descricao");
                String valor    = request.getParameter("valor");
                valor = valor.replace(',', '.');
                TipoCliente tp  = new TipoCliente();
                tp.setDescricao(nome);
                tp.setValor(Double.parseDouble(valor));
                tp.setAtivo(true);
                
                Client client = ClientBuilder.newClient();

                client
                        .target("http://localhost:8080/CRUEL/webresources/TipoCliente")
                        .request(MediaType.APPLICATION_JSON)
                        .post(Entity.json(tp));
                
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/cadastro_tipo_cliente.jsp");
                rd.forward(request, response);
                
            }else if (action.equals("buscatpcliente")){
                Client client = ClientBuilder.newClient();

                List<TipoCliente> l_tpCliente = client
                        .target("http://localhost:8080/CRUEL/webresources/TipoCliente")
                        .request(MediaType.APPLICATION_JSON)
                        .get(new GenericType<List<TipoCliente>>(){});
                
                request.setAttribute("l_tpCliente", l_tpCliente);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/cadastro_tipo_cliente.jsp");
                rd.forward(request, response);
                   
            }else if (action.equals("buscacardapio")){
                Client client = ClientBuilder.newClient();

                List<Cardapio> l_cardapio = client
                        .target("http://localhost:8080/CRUEL/webresources/Cardapio")
                        .request(MediaType.APPLICATION_JSON+ ";charset=utf-8")
                        .get(new GenericType<List<Cardapio>>(){});
                
                request.setAttribute("l_cardapio", l_cardapio);
                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
                
            
                
            }else if (action.equals("relatorioMensal")){
                Connection conn = null;
                String filtroAno    = request.getParameter("selectAno");
                String filtroMes    = request.getParameter("selectMes");
                
                try{
                    conn = ConnectionFactory.getConnectionReport();
                    
                    try{
                    
                    String relMensal = request.getContextPath() + "/registrosCRUEL.jasper";
                    String host = "http://" + request.getServerName() + ":" + request.getServerPort();
                    URL relURL = new URL(host + relMensal);

                    HashMap params = new HashMap();
                    double dtAno = Double.parseDouble(filtroAno);
                    double dtMes = Double.parseDouble(filtroMes);
                    params.put("dtAno", dtAno);
                    params.put("dtMes", dtMes);
                    byte[] bytes = JasperRunManager.runReportToPdf(relURL.openStream(), params, conn);
                    
                    if (bytes != null) {
                        response.setContentType("application/pdf");
                        OutputStream ops = null;
                        ops = response.getOutputStream();
                        ops.write(bytes);
                    }
                    }catch(JRException jrEx){
                        //MAGIC OVERFLOW
                        jrEx.printStackTrace();
                        request.setAttribute("ERRMSG", "Erro ao carregar relatório" + jrEx.getMessage());
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/gerar_relatorio_mensal.jsp");
                        rd.forward(request, response);
                    }

                }catch(SQLException sqlEx){
                    request.setAttribute("ERRMSG", "Erro ao na conexão com banco de dados");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/gerar_relatorio_mensal.jsp");
                    rd.forward(request, response);
                }finally{
                    try{conn.close();}catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
                }
                

            
            }else if (action.equals("relatorioAnual")){
               Connection conn = null;
                String filtroAno    = request.getParameter("selectAno");
                
                try{
                    conn = ConnectionFactory.getConnectionReport();
                    
                    try{
                    
                    String relMensal = request.getContextPath() + "/registrosCRUEL_Anual.jasper";
                    String host = "http://" + request.getServerName() + ":" + request.getServerPort();
                    URL relURL = new URL(host + relMensal);

                    HashMap params = new HashMap();
                    double dtAno = Double.parseDouble(filtroAno);
                    
                    params.put("dtAno", dtAno);
                    byte[] bytes = JasperRunManager.runReportToPdf(relURL.openStream(), params, conn);
                    
                    if (bytes != null) {
                        response.setContentType("application/pdf");
                        OutputStream ops = null;
                        ops = response.getOutputStream();
                        ops.write(bytes);
                    }
                    }catch(JRException jrEx){
                        //MAGIC OVERFLOW
                        jrEx.printStackTrace();
                        request.setAttribute("ERRMSG", "Erro ao carregar relatório" + jrEx.getMessage());
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/gerar_relatorio_mensal.jsp");
                        rd.forward(request, response);
                    }

                }catch(SQLException sqlEx){
                    request.setAttribute("ERRMSG", "Erro ao na conexão com banco de dados");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/gerar_relatorio_mensal.jsp");
                    rd.forward(request, response);
                }finally{
                    try{conn.close();}catch(Exception ex){System.out.println("Erro ao finalizar conexão: "+ex.getMessage());}
                }             
                
            
            }else if (action.equals("buscacolaborador")){
                String filtroColaborador = request.getParameter("filtroColaborador");
                List <Colaborador> l_colaboradores = new ArrayList();  
                l_colaboradores = daoColab.getFiltrado(filtroColaborador);
                
                /*Colaborador colaborador = new Colaborador();
                Cargo c1 = new Cargo();
                c1.setDescricao("outra");
                colaborador.setAtivo(true);
                colaborador.setNome(filtroColaborador);
                colaborador.setCargo(c1);
                l_colaboradores.add(colaborador);
                l_colaboradores.add(colaborador);
                l_colaboradores.add(colaborador);*/
                request.setAttribute("l_colaboradores", l_colaboradores);
                RequestDispatcher rd = request.getRequestDispatcher("/consulta_funcionarios.jsp");
                rd.forward(request, response);
            }else if(action.equals("atualizarfuncionario")){
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String confirma_senha = request.getParameter("confirma_senha");
            String endereco = request.getParameter("endereco");
            String telefone = request.getParameter("telefone");
            String cpf = request.getParameter("cpf");
            Colaborador col = new Colaborador();
            cpf = cpf.replace(".", "").replace("-", "");
            telefone = telefone.replace("(", "").replace(")", "").replace("-", "");
            col.setCpf(cpf);
            col.setSenha(senha);
            col.setEmail(email);
            col.setEndereco(endereco);
            col.setTelefone(telefone);
            try{
                if (senha.equals(confirma_senha)){
                daoColab.update(col);
                request.setAttribute("ERRMSG", "Funcionário editado com successo");
               }
            }catch(Exception ex){
                request.setAttribute("ERRMSG", "Erro ao editar funcionário"+ex);
            }
             RequestDispatcher rd = getServletContext().getRequestDispatcher("/consulta_funcionarios.jsp");
                rd.forward(request, response);
            
            }else if(action.equals("desativarfuncionario")){
                String cpf              = request.getParameter("cpfColaborador");
                boolean ativo           = parseBoolean(request.getParameter("ativo"));
                Colaborador col = new Colaborador();
                col.setCpf(cpf);
                col.setAtivo(ativo);
                try{
                        daoColab.trocaStatus(col);
                        request.setAttribute("ERRMSG", "Funcionário Ativado/Desativado");
                    }catch(Exception ex){
                        request.setAttribute("ERRMSG", "Erro ao ativar/desativar");
                    }
                response.sendRedirect(request.getContextPath() + "/consulta_funcionarios.jsp");
            }
            else if(action.equals("cadastrarfuncionario")){
                String nome             = request.getParameter("nome");
                String cpf              = request.getParameter("cpf");
                String senha            = request.getParameter("senha");
                String confirma_senha   = request.getParameter("confirma_senha");
                String email            = request.getParameter("email");
                String endereco         = request.getParameter("endereco");
                String telefone         = request.getParameter("telefone");
                String crn              = request.getParameter("crn");
                int    id_cargo         = Integer.parseInt(request.getParameter("cargo"));
                
                Cargo       car = new Cargo();
                Colaborador col = new Colaborador();

                car.setIdCargo(id_cargo);
                
                cpf = cpf.replace(".", "").replace("-", "");
                telefone = telefone.replace("(", "").replace(")", "").replace("-", "");
                
                col.setNome(nome);
                col.setCpf(cpf);
                col.setSenha(senha);
                col.setEmail(email);
                col.setEndereco(endereco);
                col.setTelefone(telefone);
                col.setCrn(crn);
                col.setAtivo(true);
                col.setCargo(car);
                    
                request.setAttribute("col", col);
                if (senha.equals(confirma_senha)){
                    try{
                        daoColab.inserir(col);
                        request.setAttribute("ERRMSG", "Funcionário Cadastrado com successo");
                    }catch(Exception ex){
                        request.setAttribute("ERRMSG", "Erro ao cadastrar funcionário");
                    }
                }else{
                    request.setAttribute("ERRMSG", "Senhas não são idênticas");
                }
                response.sendRedirect(request.getContextPath() + "/cadastro_funcionario.jsp");
            }else{
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void and(boolean equals) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
