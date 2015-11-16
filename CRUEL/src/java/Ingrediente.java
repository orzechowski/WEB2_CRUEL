
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
    
    private int id_ingrediente;
    private String nome;
    private String descricao;
    private tipoIngrediente tipoIngrediente;
    public Ingrediente(){
   
    }
    public int getId_ingrediente(){
        return this.id_ingrediente;
    }
    public void setId_ingrediente(int id_ingrediente){
        this.id_ingrediente =  id_ingrediente;
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
