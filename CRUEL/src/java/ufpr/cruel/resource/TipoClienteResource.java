/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.cruel.resource;

import ufpr.cruel.TipoCliente;
import ufpr.cruel.daoTipoCliente;
import java.sql.SQLException;
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
    public String putJson( TipoCliente tipocliente) {
        
        try{
            dtc = new daoTipoCliente();   	
            dtc.update(tipocliente);
            return "OK";
            
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }
        
        /*String output = tipocliente.toString();
        return Response.status(200).entity(output).build();*/
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public TipoCliente produceJSON() {
        
        TipoCliente st = new TipoCliente();
                    st.setIdTipoCliente(1);
                    st.setDescricao("Professor2");
                    st.setValor(3);
                    st.setAtivo(true);
        return st;
        
    }
    
    /*@Path("{listTipoCliente}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<TipoCliente> getList() {
        return "Chegou aqui";
    }; */
}
