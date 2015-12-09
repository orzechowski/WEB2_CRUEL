/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.cruel;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vishi_000
 */
@WebServlet(name = "ServAtendente", urlPatterns = {"/ServAtendente"})
public class ServAtendente extends HttpServlet {

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
            
            daoTipoCliente daoTpCliente = new daoTipoCliente();
            daoRegistro daoReg = new daoRegistro();
            daoCardapio darCar = new daoCardapio();
            
            if (action.equals("buscatpcliente")){
             List <TipoCliente> l_tpCliente = new ArrayList();

                try{
                    l_tpCliente = daoTpCliente.getTudo();                    
                } catch(SQLException ex){
                    
                }
                request.setAttribute("l_tpCliente", l_tpCliente);
                RequestDispatcher rd = request.getRequestDispatcher("/registro_entradas.jsp");
                rd.forward(request, response);
            }else if (action.equals("buscaRegistros")){
             List <Registro> l_registro = new ArrayList();

                try{
                    l_registro = daoReg.getDia();                    
                } catch(SQLException ex){
                }
                request.setAttribute("l_registro", l_registro);
                RequestDispatcher rd = request.getRequestDispatcher("/consulta_registros.jsp");
                rd.forward(request, response);
            }else if (action.equals("buscaCardapio")){
             List <Cardapio> l_cardapio = new ArrayList();

                try{
                    l_cardapio = darCar.getSemana();
                } catch(SQLException ex){
                    ex.printStackTrace();
                }
                request.setAttribute("l_cardapio", l_cardapio);
                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            }else if (action.equals("registrar")){
                String descricaoTpCliente         = request.getParameter("descricaoTpCliente");
                double valorCobrado              = Double.parseDouble(request.getParameter("valorCobrado"));
                int    idTpCliente         = Integer.parseInt(request.getParameter("idTpCliente"));
                TipoCliente tp  = new TipoCliente();
                tp.setIdTipoCliente(idTpCliente);
                tp.setDescricao(descricaoTpCliente);
                tp.setValor(valorCobrado);
                HttpSession session = request.getSession();
                String usuario = (String)session.getAttribute("usu");
                daoReg.inserir(tp,usuario );
                request.setAttribute("ERRMSG", "Registro efetuado com sucesso");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/registro_entradas.jsp");
                rd.forward(request, response);
            
            
            }
            else{
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            }
            
            
              
        //INSERIR REGISTRO(REGISTRAR ENTRADA)
        //CRIAR DAOREGISTRO
        //DAO.INSERIR(TIPOCLIENTE,SESSIONSCOPE.CPF_USUARIO)
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
