/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.cruel.resource;

import ufpr.cruel.TipoCliente;
import ufpr.cruel.daoTipoCliente;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


/**
 * REST Web Service
 *
 * @author acv28
 */
@Path("TipoCliente")
public class TipoClienteResource {
    
    private daoTipoCliente dtc = null;

    @Context
    private UriInfo context;

    public TipoClienteResource() {
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public String putJson( TipoCliente tipocliente) {
        
        try{
            dtc = new daoTipoCliente();   	
            dtc.update(tipocliente);
            return "OK";
            
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<TipoCliente> produceJSON() {
        
        try{
            daoTipoCliente tc = new daoTipoCliente();
            List<TipoCliente> ltc = new ArrayList();
            
            ltc = tc.getTudo();
            /*TipoCliente[] array_tc = new TipoCliente[ltc.size()];
            ltc.toArray(array_tc);
            
            return array_tc;*/
            return ltc;
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
