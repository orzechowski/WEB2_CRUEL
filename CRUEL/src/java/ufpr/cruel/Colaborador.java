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
public class Colaborador implements Serializable {    
    private String cpf;
    private String nome;
    private String email;
    private String endereco;
    private String senha;
    private String telefone;
    private String crn;
    private boolean ativo;
    private Cargo cargo;
       
    public void setCpf (String cpf){
        this.cpf = cpf;
    }
    public String getCpf (){
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
    
    public String getSenha() {
        return(this.senha);
    }

    public void setTelefone(String telefone){
        this.telefone = telefone;
    }
    public String getTelefone(){
        return(this.telefone);
    }

    public void setCrn(String crn){
        this.crn = crn;
    }
    public String getCrn(){
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
