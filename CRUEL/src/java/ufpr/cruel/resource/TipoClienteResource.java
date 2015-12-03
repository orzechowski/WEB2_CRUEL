/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.cruel.resource;

import static java.util.Collections.singleton;
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
import ufpr.cruel.TipoCliente;
import ufpr.cruel.daoTipoCliente;

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

    /**
     * Creates a new instance of TipoClienteResource
     */
    public TipoClienteResource() {
    }
    
    /**
     * PUT method for updating or creating an instance of TipoClienteResource
     * @param content representation for the resource
     */
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response putJson( TipoCliente tipocliente) {
        
        dtc = new daoTipoCliente();   	
    	dtc.update(tipocliente);
        
        String output = tipocliente.toString();
        return Response.status(200).entity(output).build();
    }
    
    /*@Path("{listTipoCliente}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<TipoCliente> getList() {
        return "Chegou aqui";
    }; */
}
