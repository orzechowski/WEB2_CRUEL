package ufpr.cruel;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ufpr.cruel.TipoIngrediente;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
            daoTipoIngrediente daoTp = new daoTipoIngrediente();
            daoIngrediente daoIng = new daoIngrediente();
            
            if (action.equals("addtping")){
                String desc = request.getParameter("nome");
                TipoIngrediente t = new TipoIngrediente();
                
                
                t.setDescricao(desc);
                daoTp.inserir(t);
                
                //MSG SUCESSO? COMO MOSTRAR ERRO?(PEGANDO CODIGO DE RETORNO DO HTTP?)
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/cadastro_tipo_ingrediente.jsp");
                rd.forward(request, response);
            }else if (action.equals("buscaingrediente")){
                String filtroIngrediente = request.getParameter("filtroIngrediente");
                List <Ingrediente> l_ingredientes = new ArrayList(); 
                
                try{
                    l_ingredientes = daoIng.getFiltrado(filtroIngrediente);
                } catch(SQLException ex){
                    //MAGIC
                }
                /*
               Ingrediente ingrediente = new Ingrediente();
               TipoIngrediente t1 = new TipoIngrediente();
                ingrediente.setNome(filtroIngrediente);
                //ingrediente.setDescricao("feijao preto");
                t1.setDescricao("outra");
                ingrediente.setTipoIngrediente(t1);
                l_ingredientes.add(ingrediente);
                l_ingredientes.add(ingrediente);
                l_ingredientes.add(ingrediente);*/
                request.setAttribute("l_ingredientes", l_ingredientes);
                RequestDispatcher rd = request.getRequestDispatcher("/consulta_ingredientes.jsp");
                rd.forward(request, response);
            }else if (action.equals("buscatpingrediente")){
                List <TipoIngrediente> l_tpingredientes = new ArrayList();
                
                try{
                    l_tpingredientes = daoTp.getTodos();                    
                } catch(SQLException ex){
                    //MAGIC
                }
                
                request.setAttribute("l_tpingredientes", l_tpingredientes);
                RequestDispatcher rd = request.getRequestDispatcher("/consulta_tipos_ingredientes.jsp");
                rd.forward(request, response);
            }else if (action.equals("cadastrar_ingrediente")){
                String nome         = request.getParameter("nome");
                String descricao    = request.getParameter("descricao");
                int tpIngrediente   = Integer.parseInt(request.getParameter("selectbasic"));
                Ingrediente i       = new Ingrediente();
                TipoIngrediente t   = new TipoIngrediente();
                t.setIdTipoIngrediente(tpIngrediente);
                String descricaoTpIngrediente = null;
                switch (tpIngrediente)
                {
                    case 1:
                        descricaoTpIngrediente = "Arroz";
                    case 2:
                        descricaoTpIngrediente = "Feijao";
                    case 3:
                        descricaoTpIngrediente = "Salada";
                    case 4:
                        descricaoTpIngrediente = "Carne";
                    case 5:
                        descricaoTpIngrediente = "Acompanhamento";
                    case 6:
                        descricaoTpIngrediente = "Sobremesa";
                }
                t.setDescricao(descricaoTpIngrediente);
                i.setTipoIngrediente(t);
                i.setNome(nome);
                i.setDescricao(descricao);
                daoIng.inserir(i);
                
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/cadastro_ingrediente.jsp");
                rd.forward(request, response);                
            }else if (action.equals("carregaingrediente")){
                List<Ingrediente> listaIng = new ArrayList();
                try{listaIng = daoIng.getFiltrado("");}
                catch(SQLException ex){/*IARIAIRRAI*/}
                
                request.setAttribute("listaIng", listaIng);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index_nutricionista.jsp");
                rd.forward(request, response);                            
            }else if (action.equals("excluiingrediente")){
                String idIngrediente    = request.getParameter("idIngrediente");
                
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/consulta_nutricionista.jsp");
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
