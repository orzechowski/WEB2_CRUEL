
import java.io.Serializable;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author orzechowski
 */
public class Ingrediente implements Serializable{
    
    private int idIngrediente;
    private String nome;
    private String descricao;
    private tipoIngrediente tipoIngrediente;
    public Ingrediente(){
   
    }
    public int getIdIngrediente(){
        return this.idIngrediente;
    }
    public void setIdIngrediente(int idIngrediente){
        this.idIngrediente =  idIngrediente;
    }
    public String getNome(){
        return this.nome;
    }
    public void setNome(String nome){
        this.nome = nome;
    }
    public String getDescricao(){
        return this.descricao;
    }
    public void setDescricao(String descricao){
        this.descricao = descricao;
    }
    
}
