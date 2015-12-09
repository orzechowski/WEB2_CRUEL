/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.gerente.cruel;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author orzechowski
 */
public class Cardapio implements Serializable{
    private int idCardapio;
    private String data;
    private int refeicao;
    private List<Ingrediente> listaIngredientes;
    
    Cardapio(){
        listaIngredientes = new ArrayList();
    }
    public int getIdCardapio(){
        return this.idCardapio;
    }
    public void setIdCardapio(int idCardapio){
        this.idCardapio =  idCardapio;
    }
    public String getData(){
        return this.data;
    }
    public void setData(String data){
        this.data = data;
    }
    public int getRefeicao(){
        return this.refeicao;
    }
    public void setRefeicao(int refeicao){
        this.refeicao = refeicao;
    }
    public String getDescricaoRefeicao(){
        if (this.refeicao == 1)
            return "Almoco";
        else
           return "Jantar";
    }
    public void setListaIngredientes(List<Ingrediente> listaIng){
        this.listaIngredientes = listaIng;
    }
    
    public void addIngrediente(Ingrediente ing){
        this.listaIngredientes.add(ing);
    }
    
    public List<Ingrediente> getListaIngredientes(){
        return this.listaIngredientes;
    }
    
}