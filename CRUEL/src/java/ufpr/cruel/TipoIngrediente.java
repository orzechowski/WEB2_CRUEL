/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.cruel;

import java.io.Serializable;

/**
 *
 * @author vishi_000
 */
public class TipoIngrediente implements Serializable{
    private int idTipoIngrediente;
    private String descricao;

    public int getIdTipoIngrdiente(){
        return this.idTipoIngrediente;
    }
    public void setIdTipoIngrediente(int idTipoIngrediente){
        this.idTipoIngrediente =  idTipoIngrediente;
    }
    public String getDescricao(){
        return this.descricao;
    }
    public void setDescricao(String descricao){
        this.descricao = descricao;
    }
}