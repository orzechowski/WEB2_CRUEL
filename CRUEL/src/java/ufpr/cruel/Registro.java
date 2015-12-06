/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ufpr.cruel;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Cristopher
 */
public class Registro implements Serializable {
    
    private Date dtHora;
    private double valorCobrado;
    private String cpfColaborador;
    private TipoCliente tpCliente;
    
    public void setDtHora(Date dtHora){
        this.dtHora = dtHora;
    }
    public Date getDtHora(){
        return(this.dtHora);
    }
    
    public void setValorCobrado(double valorCobrado){
        this.valorCobrado = valorCobrado;
    }
    public double getValorCobrado(){
        return(this.valorCobrado);
    }
    
    public void setCpfColaborador(String cpfColaborador){
        this.cpfColaborador = cpfColaborador;
    }
    public String getCpfColaborador(){
        return(this.cpfColaborador);
    }
    
    public void setTpCliente(TipoCliente tpCliente){
        this.tpCliente = tpCliente;
    }
    public TipoCliente getTpCliente(){
        return(this.tpCliente);
    }
    
}
