
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
public class Cardapio implements Serializable{
    private int id_cardapio;
    private String data;
    private int id_refeicao;
    
    Cardapio(){    
    }
    public int getId_cardapio(){
        return this.id_cardapio;
    }
    public void setId_cardapio(int id_cardapio){
        this.id_cardapio =  id_cardapio;
    }
    public String getData(){
        return this.data;
    }
    public void setData(String data){
        this.data = data;
    }
    private int gettId_refeicao(){
        return this.id_refeicao;
    }
    private void setId_refeicao(int id_refeicao){
        this.id_refeicao = id_refeicao;
    }
    private String getDescricaoRefeicao(){
        if (this.id_refeicao == 1)
            return "Almoco";
        else
           return "Jantar";
        
    }
}
