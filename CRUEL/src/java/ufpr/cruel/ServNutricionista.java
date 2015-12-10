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
            daoIngrediente     daoIng = new daoIngrediente();
            daoCardapio        daoCar = new daoCardapio();
            
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
            }else if(action.equals("atualizaringrediente")){
                int id_ingrediente = Integer.parseInt(request.getParameter("id_ingrediente"));
                String nome = request.getParameter("nome");
                int tipo = Integer.parseInt(request.getParameter("selectbasic"));
                String descricao = request.getParameter("descricao");
                
                TipoIngrediente tp = new TipoIngrediente();
                Ingrediente i = new Ingrediente();
                
                tp.setIdTipoIngrediente(tipo);
                i.setIdIngrediente(id_ingrediente);
                i.setNome(nome);
                i.setDescricao(descricao);
                i.setTipoIngrediente(tp);
                
                daoIng.update(i);
                response.sendRedirect(request.getContextPath() + "/consulta_ingredientes.jsp");
            }else if (action.equals("carregaingrediente")){
                List<Cardapio>    listaCar = new ArrayList(); 
                List<Ingrediente> listaIng = new ArrayList();
                
                try{listaIng = daoIng.getFiltrado("");}
                catch(SQLException ex){/*IARIAIRRAI*/}
                
                try{listaCar = daoCar.getAll();}
                catch(SQLException ex){/*IARIAIRRAI*/}
                
                request.setAttribute("listaIng", listaIng);
                request.setAttribute("listaCar", listaCar);
                
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/index_nutricionista.jsp");
                rd.forward(request, response);                            
            }else if (action.equals("excluiingrediente")){
                int idIngrediente    = Integer.parseInt(request.getParameter("idIngrediente"));
                
                Ingrediente i = new Ingrediente();
                i.setIdIngrediente(idIngrediente);
                
                daoIng.excluir(i);
                
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/consulta_ingredientes.jsp");
                rd.forward(request, response);                            
            }else if (action.equals("alterarCardapio")){
                /* PARAMETROS */
                String almoco_arroz             = request.getParameter("almoco_arroz");
                String almoco_feijao            = request.getParameter("almoco_feijao");
                String almoco_salada            = request.getParameter("almoco_salada");
                String almoco_carne             = request.getParameter("almoco_carne");
                String almoco_acompanhamento    = request.getParameter("almoco_acompanhamento");
                String almoco_sobremesa         = request.getParameter("almoco_sobremesa");
                String tp_refeicao              = request.getParameter("tp_refeicao");
                String dt_refeicao              = request.getParameter("dt_refeicao");
                int    id_refeicao              = Integer.parseInt(request.getParameter("id_refeicao"));
                
                /* Caso algum elemento não tenha sido selecionado */
                if(almoco_arroz.equals("0") || almoco_feijao.equals("0") || almoco_salada.equals("0")
                    || almoco_carne.equals("0") || almoco_acompanhamento.equals("0") || almoco_sobremesa.equals("0")
                ){
                    request.setAttribute("ERRMSG", "Favor preencher todos os ingredientes.");
                    response.sendRedirect(request.getContextPath() + "/index_nutricionista.jsp");
                }else{
                    /* TIPO INGREDIENTE */
                    TipoIngrediente tp_arroz            = new TipoIngrediente();
                    TipoIngrediente tp_feijao           = new TipoIngrediente();
                    TipoIngrediente tp_salada           = new TipoIngrediente();
                    TipoIngrediente tp_carne            = new TipoIngrediente();
                    TipoIngrediente tp_acompanhamento   = new TipoIngrediente();
                    TipoIngrediente tp_sobremesa        = new TipoIngrediente();

                    tp_arroz.setIdTipoIngrediente(1);
                    tp_feijao.setIdTipoIngrediente(2);
                    tp_salada.setIdTipoIngrediente(3);
                    tp_carne.setIdTipoIngrediente(4);
                    tp_acompanhamento.setIdTipoIngrediente(5);
                    tp_sobremesa.setIdTipoIngrediente(6);

                    /* INGREDIENTES */
                    Ingrediente arroz           = new Ingrediente();
                    Ingrediente feijao          = new Ingrediente();
                    Ingrediente salada          = new Ingrediente();
                    Ingrediente carne           = new Ingrediente();
                    Ingrediente acompanhamento  = new Ingrediente();
                    Ingrediente sobremesa       = new Ingrediente();  

                    arroz.setIdIngrediente(Integer.parseInt(almoco_arroz));
                    arroz.setTipoIngrediente(tp_arroz);
                    feijao.setIdIngrediente(Integer.parseInt(almoco_feijao));
                    feijao.setTipoIngrediente(tp_feijao);
                    salada.setIdIngrediente(Integer.parseInt(almoco_salada));
                    salada.setTipoIngrediente(tp_salada);
                    carne.setIdIngrediente(Integer.parseInt(almoco_carne));
                    carne.setTipoIngrediente(tp_carne);
                    acompanhamento.setIdIngrediente(Integer.parseInt(almoco_acompanhamento));
                    acompanhamento.setTipoIngrediente(tp_acompanhamento);
                    sobremesa.setIdIngrediente(Integer.parseInt(almoco_sobremesa));
                    sobremesa.setTipoIngrediente(tp_sobremesa);

                    /* CARDAPIO */
                    Cardapio c = new Cardapio();
                    c.setData(dt_refeicao);
                    c.setIdCardapio(id_refeicao);
                    c.setRefeicao(Integer.parseInt(tp_refeicao));
                    c.addIngrediente(arroz);
                    c.addIngrediente(feijao);
                    c.addIngrediente(salada);
                    c.addIngrediente(carne);
                    c.addIngrediente(acompanhamento);
                    c.addIngrediente(sobremesa);

                    try {
                        daoCar.Update(c);
                    }catch(Exception ex){
                        //NOPE
                    }
                    response.sendRedirect(request.getContextPath() + "/index_nutricionista.jsp");
                }
            }else if (action.equals("cadastrarCardapio")){
                /* PARAMETROS */
                String almoco_arroz             = request.getParameter("almoco_arroz");
                String almoco_feijao            = request.getParameter("almoco_feijao");
                String almoco_salada            = request.getParameter("almoco_salada");
                String almoco_carne             = request.getParameter("almoco_carne");
                String almoco_acompanhamento    = request.getParameter("almoco_acompanhamento");
                String almoco_sobremesa         = request.getParameter("almoco_sobremesa");
                
                String dt_refeicao              = request.getParameter("nova_dt_refeicao");
                
                String janta_arroz             = request.getParameter("janta_arroz");
                String janta_feijao            = request.getParameter("janta_feijao");
                String janta_salada            = request.getParameter("janta_salada");
                String janta_carne             = request.getParameter("janta_carne");
                String janta_acompanhamento    = request.getParameter("janta_acompanhamento");
                String janta_sobremesa         = request.getParameter("janta_sobremesa");
                
                if (almoco_carne.equals(janta_carne) || almoco_sobremesa.equals(janta_sobremesa)){                   
                    request.setAttribute("ERRMSG", "Carne/Sobremesa do Almoço e Janta não podem ser iguais.");
                    response.sendRedirect(request.getContextPath() + "/index_nutricionista.jsp");
                }else{
                    /* TIPO INGREDIENTE */
                    TipoIngrediente tp_arroz            = new TipoIngrediente();
                    TipoIngrediente tp_feijao           = new TipoIngrediente();
                    TipoIngrediente tp_salada           = new TipoIngrediente();
                    TipoIngrediente tp_carne            = new TipoIngrediente();
                    TipoIngrediente tp_acompanhamento   = new TipoIngrediente();
                    TipoIngrediente tp_sobremesa        = new TipoIngrediente();

                    tp_arroz.setIdTipoIngrediente(1);
                    tp_feijao.setIdTipoIngrediente(2);
                    tp_salada.setIdTipoIngrediente(3);
                    tp_carne.setIdTipoIngrediente(4);
                    tp_acompanhamento.setIdTipoIngrediente(5);
                    tp_sobremesa.setIdTipoIngrediente(6);

                    /* INGREDIENTES */
                    Ingrediente a_arroz           = new Ingrediente();
                    Ingrediente a_feijao          = new Ingrediente();
                    Ingrediente a_salada          = new Ingrediente();
                    Ingrediente a_carne           = new Ingrediente();
                    Ingrediente a_acompanhamento  = new Ingrediente();
                    Ingrediente a_sobremesa       = new Ingrediente();

                    Ingrediente j_arroz           = new Ingrediente();
                    Ingrediente j_feijao          = new Ingrediente();
                    Ingrediente j_salada          = new Ingrediente();
                    Ingrediente j_carne           = new Ingrediente();
                    Ingrediente j_acompanhamento  = new Ingrediente();
                    Ingrediente j_sobremesa       = new Ingrediente();  

                    a_arroz.setIdIngrediente(Integer.parseInt(almoco_arroz));
                    a_arroz.setTipoIngrediente(tp_arroz);
                    a_feijao.setIdIngrediente(Integer.parseInt(almoco_feijao));
                    a_feijao.setTipoIngrediente(tp_feijao);
                    a_salada.setIdIngrediente(Integer.parseInt(almoco_salada));
                    a_salada.setTipoIngrediente(tp_salada);
                    a_carne.setIdIngrediente(Integer.parseInt(almoco_carne));
                    a_carne.setTipoIngrediente(tp_carne);
                    a_acompanhamento.setIdIngrediente(Integer.parseInt(almoco_acompanhamento));
                    a_acompanhamento.setTipoIngrediente(tp_acompanhamento);
                    a_sobremesa.setIdIngrediente(Integer.parseInt(almoco_sobremesa));
                    a_sobremesa.setTipoIngrediente(tp_sobremesa);

                    j_arroz.setIdIngrediente(Integer.parseInt(janta_arroz));
                    j_arroz.setTipoIngrediente(tp_arroz);
                    j_feijao.setIdIngrediente(Integer.parseInt(janta_feijao));
                    j_feijao.setTipoIngrediente(tp_feijao);
                    j_salada.setIdIngrediente(Integer.parseInt(janta_salada));
                    j_salada.setTipoIngrediente(tp_salada);
                    j_carne.setIdIngrediente(Integer.parseInt(janta_carne));
                    j_carne.setTipoIngrediente(tp_carne);
                    j_acompanhamento.setIdIngrediente(Integer.parseInt(janta_acompanhamento));
                    j_acompanhamento.setTipoIngrediente(tp_acompanhamento);
                    j_sobremesa.setIdIngrediente(Integer.parseInt(janta_sobremesa));
                    j_sobremesa.setTipoIngrediente(tp_sobremesa);

                    /* CARDAPIO ALMOÇO */
                    Cardapio a_cardapio = new Cardapio();
                    a_cardapio.setData(dt_refeicao);
                    a_cardapio.setRefeicao(1);
                    a_cardapio.addIngrediente(a_arroz);
                    a_cardapio.addIngrediente(a_feijao);
                    a_cardapio.addIngrediente(a_salada);
                    a_cardapio.addIngrediente(a_carne);
                    a_cardapio.addIngrediente(a_acompanhamento);
                    a_cardapio.addIngrediente(a_sobremesa);

                    /* CARDAPIO JANTA */
                    Cardapio j_cardapio = new Cardapio();
                    j_cardapio.setData(dt_refeicao);
                    j_cardapio.setRefeicao(2);
                    j_cardapio.addIngrediente(j_arroz);
                    j_cardapio.addIngrediente(j_feijao);
                    j_cardapio.addIngrediente(j_salada);
                    j_cardapio.addIngrediente(j_carne);
                    j_cardapio.addIngrediente(j_acompanhamento);
                    j_cardapio.addIngrediente(j_sobremesa);

                    try{daoCar.Inserir(a_cardapio);}
                    catch(SQLException ex){/*IARIAIRRAI*/}
                    try{daoCar.Inserir(j_cardapio);}
                    catch(SQLException ex){/*IARIAIRRAI*/}

                    response.sendRedirect(request.getContextPath() + "/index_nutricionista.jsp");
                }
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
