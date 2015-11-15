/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.Serializable;
import java.util.*;
/**
 *
 * @author vishi_000
 */
public class Registro implements Serializable{
    private Date dtHora;
    private float valorCobrado;
    private int cpfColaborador;
    private TipoCliente tpCliente;
    
    public void setDtHora(Date dtHora){
        this.dtHora = dtHora;
    }
    public Date getDtHora(){
        return(this.dtHora);
    }
    
    public void setValorCobrado(float valorCobrado){
        this.valorCobrado = valorCobrado;
    }
    public float getValorCobrado(){
        return(this.valorCobrado);
    }
    
    public void setCpfColaborador(int cpfColaborador){
        this.cpfColaborador = cpfColaborador;
    }
    public int getCpfColaborador(){
        return(this.cpfColaborador);
    }
    
    public void setTpCliente(TipoCliente tpCliente){
        this.tpCliente = tpCliente;
    }
    public TipoCliente getTpCliente(){
        return(this.tpCliente);
    }
}
