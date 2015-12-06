/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.gerente.resource;

import java.sql.SQLException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import ufpr.gerente.cruel.Colaborador;
import ufpr.gerente.cruel.daoColaborador;

/**
 * REST Web Service
 *
 * @author acv28
 */
@Path("Colaborador")
public class ColaboradorResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of ColaboradorResource
     */
    public ColaboradorResource() {
    }

    /**
     * Retrieves representation of an instance of ufpr.gerente.resource.ColaboradorResource
     * @return an instance of java.lang.String
     */
    @GET
    @Path("{login}/{senha}")
    @Produces(MediaType.APPLICATION_JSON)
    public Colaborador getJson(@PathParam("login") String login, @PathParam("senha") String senha) {
        try{
            daoColaborador dc = new daoColaborador();   
            Colaborador c = new Colaborador();
            c=dc.login(login,senha);
            return c;
            
        }catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * PUT method for updating or creating an instance of ColaboradorResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }
}
