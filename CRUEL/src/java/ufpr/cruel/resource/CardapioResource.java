/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.cruel.resource;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;
import ufpr.cruel.Cardapio;
import ufpr.cruel.TipoCliente;
import ufpr.cruel.daoCardapio;
import ufpr.cruel.daoTipoCliente;

@Path("Cardapio")
public class CardapioResource {

    @Context
    private UriInfo context;

    public CardapioResource() {
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Cardapio> getJson() {
        try{
            daoCardapio tc = new daoCardapio();
            List<Cardapio> ltc = new ArrayList();
            
            ltc = tc.getSemana();
            
            return ltc;
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
