/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.gerente.cruel;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
            String action = request.getParameter("action");
            
            if (action.equals("addtpcli")){
                String nome     = request.getParameter("nome");
                String valor    = request.getParameter("valor");
                TipoCliente tp  = new TipoCliente();
                tp.setDescricao(nome);
                tp.setValor(Double.parseDouble(valor));
                
                tp.setAtivo(true);
                //AQUI VAI INSERÇÃO DO BANCO
                
                Client client = ClientBuilder.newClient();

                client
                        .target("http://localhost:8080/CRUEL/webresources/TipoCliente")
                        .request(MediaType.APPLICATION_JSON)
                        .post(Entity.json(tp));
                
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/cadastro_tipo_cliente.jsp");
                rd.forward(request, response);
                
                
            }else if (action.equals("buscatpcliente")){
                             
                Client client = ClientBuilder.newClient();

                List<TipoCliente> retorno = client
                        .target("http://localhost:8080/CRUEL/webresources/TipoCliente")
                        .request(MediaType.APPLICATION_JSON)
                        .get(new GenericType<List<TipoCliente>>(){});
                
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/cadastro_tipo_cliente.jsp");
                rd.forward(request, response);
                
                
            }else if (action.equals("buscacolaborador")){
                String filtroColaborador = request.getParameter("filtroColaborador");
                //BUSCA NO BANCO
                List <Colaborador> l_colaboradores = new ArrayList <>();               
                Colaborador colaborador = new Colaborador();
                Cargo c1 = new Cargo();
                c1.setDescricao("outra");
                colaborador.setAtivo(false);
                colaborador.setNome(filtroColaborador);
                colaborador.setCargo(c1);
                l_colaboradores.add(colaborador);
                l_colaboradores.add(colaborador);
                l_colaboradores.add(colaborador);
                request.setAttribute("l_colaboradores", l_colaboradores);
                RequestDispatcher rd = request.getRequestDispatcher("/consulta_funcionarios.jsp");
                rd.forward(request, response);
            }else if(action.equals("cadastrarfuncionario")){
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
                    /* INCLUSAO NO BANCO */
                }else{ 
                    /* Senha e confirmação não batem */
                }
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/cadastro_funcionario.jsp");
                rd.forward(request, response); 
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

}
