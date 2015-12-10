package ufpr.cruel;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import ufpr.cruel.Colaborador;

/**
 *
 * @author orzechowski
 */
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String usu = request.getParameter("usuario");
            
            //Preparar HASH MD5 senha
            
            StringBuffer md5Senha = new StringBuffer();
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(request.getParameter("senha").getBytes());
            
            byte byteData[] = md.digest();
            for( int i = 0; i < byteData.length; i++){
                md5Senha.append(Integer.toString( (byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            
            String sen = md5Senha.toString();
            HttpSession session = request.getSession();
            
            Client client = ClientBuilder.newClient();
            Colaborador retorno = client
                        .target("http://localhost:51270/GERENTECRUEL/webresources/Colaborador/" + usu + "/" +sen+ "/")
                        .request(MediaType.APPLICATION_JSON)
                        .get(Colaborador.class);
            
            if( (retorno.getEmail()!= null) ) {  
                if((retorno.getCargo().getDescricao().toLowerCase()).equals("gerente")){
                    request.setAttribute("ERRMSG", "Não é permitido login de Gerente nesta aplicação");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                    rd.forward(request,response);
                }
                else{
                    session.setAttribute("usuario", retorno.getCpf());
                    session.setAttribute("idcargo", retorno.getCargo().getIdCargo());
                    session.setAttribute("cargo", (retorno.getCargo().getDescricao()).toLowerCase() );
                }
            }
            else{
                request.setAttribute("ERRMSG", "Usuário ou Senha Inválidos");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                rd.forward(request,response);
            }
                                        
            if ("nutricionista".equals(session.getAttribute("cargo"))){
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index_nutricionista.jsp");
                rd.forward(request,response);
            }
            else{
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                rd.forward(request,response);
            }
        }catch(NoSuchAlgorithmException ex){
            throw new RuntimeException(ex.getMessage());
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
