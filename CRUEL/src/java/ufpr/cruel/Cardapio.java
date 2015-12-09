/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.cruel;

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
    
    public String getDia(){
        String[] splited = (this.getData()).split("-");
        
        return splited[0];
    }
    public String getMes(){
        String[] splited = (this.getData()).split("-");
        
        String mes = splited[1];
        String mesLit = "";
        
        switch(mes){
            case "01":
                mesLit = "JAN";
                break;
            case "02":
                mesLit = "FEV";
                break;
            case "03":
                mesLit = "MAR";
                break;
            case "04":
                mesLit = "ABR";
                break;
            case "05":
                mesLit = "MAI";
                break;
            case "06":
                mesLit = "JUL";
                break;
            case "07":
                mesLit = "JUL";
                break;
            case "08":
                mesLit = "AGO";
                break;
            case "09":
                mesLit = "SET";
                break;
            case "10":
                mesLit = "OUT";
                break;
            case "11":
                mesLit = "NOV";
                break;
            case "12":
                mesLit = "DEZ";
                break;
            default:
                mesLit = "DEZ";
                break;
                        
        }
        return mesLit;
    }
    
}