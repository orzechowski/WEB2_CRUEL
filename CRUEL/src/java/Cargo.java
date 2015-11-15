/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.Serializable;
/**
 *
 * @author vishi_000
 */
public class Cargo implements Serializable{
    private int idCargo;
    private String descricao;
    
    public void setIdCargo(int idCargo){
        this.idCargo = idCargo;
    }
    public int getIdCargo(){
        return(this.idCargo);
    }
    
    public void setDescricao(String descricao){
        this.descricao = descricao;
    }
    public String getDescricao(){
        return(this.descricao);
    }
}
