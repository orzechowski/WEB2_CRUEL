package ufpr.gerente.cruel;

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
public class Colaborador implements Serializable {    
    private int cpf;
    private String nome;
    private String email;
    private String endereco;
    private String senha;
    private int telefone;
    private int crn;
    private boolean ativo;
    private Cargo cargo;
       
    public void setCpf (int cpf){
        this.cpf = cpf;
    }
    public int getCpf (){
        return(this.cpf);
    }

    public void setNome(String nome){
        this.nome = nome;
    }
    public String getNome(){
        return(this.nome);
    }

    public void setEmail(String email){
        this.email = email;
    }
    public String getEmail(){
        return(this.email);
    }

    public void setEndereco(String endereco){
        this.endereco = endereco;
    }
    public String getEndereco(){
        return(this.endereco);
    }

    public void setSenha(String senha){
        this.senha = senha;
    }

    public void setTelefone(int telefone){
        this.telefone = telefone;
    }
    public int getTelefone(){
        return(this.telefone);
    }

    public void setCrn(int crn){
        this.crn = crn;
    }
    public int getCrn(){
        return(this.crn);
    }

    public void setAtivo(boolean ativo){
        this.ativo = ativo;
    }
    public boolean getAtivo(){
        return(this.ativo);
    }

    public void setCargo(Cargo cargo){
        this.cargo = cargo;
    }

    public Cargo getCargo(){
        return(this.cargo);
    }
}
