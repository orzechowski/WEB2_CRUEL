package ufpr.cruel;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ufpr.cruel.TipoIngrediente;
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


/**
 *
 * @author vishi_000
 */
@WebServlet(urlPatterns = {"/Nutricionista"})
public class ServNutricionista extends HttpServlet {

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
            
            if (action.equals("addtping")){
                String desc = request.getParameter("nome");
                TipoIngrediente t = new TipoIngrediente();
                t.setDescricao(desc);
                //AQUI VAI INSERÇÃO DO BANCO
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/cadastro_tipo_ingrediente.jsp");
                rd.forward(request, response);
            }else if (action.equals("buscaingrediente")){
                String filtroIngrediente = request.getParameter("filtroIngrediente");
                //BUSCA NO BANCO
               List <Ingrediente> l_ingredientes = new ArrayList <>();               
               Ingrediente ingrediente = new Ingrediente();
               TipoIngrediente t1 = new TipoIngrediente();
                ingrediente.setNome(filtroIngrediente);
                //ingrediente.setDescricao("feijao preto");
                t1.setDescricao("outra");
                ingrediente.setTipoIngrediente(t1);
                l_ingredientes.add(ingrediente);
                l_ingredientes.add(ingrediente);
                l_ingredientes.add(ingrediente);
                request.setAttribute("l_ingredientes", l_ingredientes);
                RequestDispatcher rd = request.getRequestDispatcher("/consulta_ingredientes.jsp");
                rd.forward(request, response);
            }else if (action.equals("buscatpingrediente")){
                //BUSCA NO BANCO
               List <TipoIngrediente> l_tpingredientes = new ArrayList <>();               
               TipoIngrediente t1 = new TipoIngrediente();
                t1.setDescricao("Carne");
                l_tpingredientes.add(t1);
                l_tpingredientes.add(t1);
                l_tpingredientes.add(t1);
                request.setAttribute("l_tpingredientes", l_tpingredientes);
                RequestDispatcher rd = request.getRequestDispatcher("/consulta_tipos_ingredientes.jsp");
                rd.forward(request, response);
            }else if (action.equals("cadastrar_ingrediente")){
                String nome         = request.getParameter("nome");
                int tpIngrediente   = Integer.parseInt(request.getParameter("selectbasic"));
                Ingrediente i       = new Ingrediente();
                TipoIngrediente t   = new TipoIngrediente();
                
                t.setIdTipoIngrediente(tpIngrediente);
                i.setTipoIngrediente(t);
                i.setNome(nome);
                
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/cadastro_ingrediente.jsp");
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