package ufpr.cruel;

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
public class TipoCliente {
    private int idTpCliente;
    private String descricao;
    private double valor;
    private boolean ativo;
    
    public void setIdTipoCliente(int idTpCliente){
        this.idTpCliente = idTpCliente;
    }
    public int getIdTipoCliente(){
        return(this.idTpCliente);
    }
    public int getidTpCliente(){
        return(this.idTpCliente);
    }
    
    public void setDescricao(String descricao){
        this.descricao = descricao;
    }
    public String getDescricao(){
        return(this.descricao);
    }
    
    public void setValor(double valor){
        this.valor = valor;
    }
    public double getValor(){
        return(this.valor);
    }
    
    public void setAtivo(boolean ativo){
        this.ativo = ativo;
    }
    
    public boolean getAtivo(){
        return (this.ativo);
    }
}
