
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
    private int idCardapio;
    private String data;
    private int refeicao;
    
    Cardapio(){    
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
    private int getRefeicao(){
        return this.refeicao;
    }
    private void setRefeicao(int refeicao){
        this.refeicao = refeicao;
    }
    private String getDescricaoRefeicao(){
        if (this.refeicao == 1)
            return "Almoco";
        else
           return "Jantar";
        
    }
}
