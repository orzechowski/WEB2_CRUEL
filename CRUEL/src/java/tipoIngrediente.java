
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
class tipoIngrediente implements Serializable{
    private int id_tipoIngrediente;
    private String descricao;
    
    tipoIngrediente(){    
    }
    public int getId_tipoIngrdiente(){
        return this.id_tipoIngrediente;
    }
    public void setId_tipoIngrediente(int id_tipoIngrediente){
        this.id_tipoIngrediente =  id_tipoIngrediente;
    }
    public String getDescricao(){
        return this.descricao;
    }
    public void setDescricao(String descricao){
        this.descricao = descricao;
    }
}
