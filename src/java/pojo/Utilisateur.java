package pojo;
// Generated 19 f�vr. 2019 12:13:51 by Hibernate Tools 4.3.1


import pojo.ProfilClient;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Utilisateur generated by hbm2java
 */
public class Utilisateur  implements java.io.Serializable {

     private Integer numUser;
     
     private String type;
     private String nom;
     private String prenom;
     private Date dateNaissance;
     private String login;
     private String password;
     private String sexe;
     private Date dateInscritpion;

    public Utilisateur() {
    }

	
    public Utilisateur(String type, String login, String password, Date dateInscritpion) {
        this.type = type;
        this.login = login;
        this.password = password;
        this.dateInscritpion = dateInscritpion;
    }
    
    public Utilisateur(String type, String nom, String prenom, Date dateNaissance, String login, String password, String sexe, Date dateInscritpion) {
       
       this.type = type;
       this.nom = nom;
       this.prenom = prenom;
       this.dateNaissance = dateNaissance;
       this.login = login;
       this.password = password;
       this.sexe = sexe;
       this.dateInscritpion = dateInscritpion;
    }
   
    public Integer getNumUser() {
        return this.numUser;
    }
    
    public void setNumUser(Integer numUser) {
        this.numUser = numUser;
    }

    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    public String getNom() {
        return this.nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getPrenom() {
        return this.prenom;
    }
    
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    public Date getDateNaissance() {
        return this.dateNaissance;
    }
    
    public void setDateNaissance(Date dateNaissance) {
        this.dateNaissance = dateNaissance;
    }
    
    public String getLogin() {
        return this.login;
    }
    
    public void setLogin(String login) {
        this.login = login;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getSexe() {
        return this.sexe;
    }
    
    public void setSexe(String sexe) {
        this.sexe = sexe;
    }
    public Date getDateInscritpion() {
        return this.dateInscritpion;
    }
    
    public void setDateInscritpion(Date dateInscritpion) {
        this.dateInscritpion = dateInscritpion;
    }
}

