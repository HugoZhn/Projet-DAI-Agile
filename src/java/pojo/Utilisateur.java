package pojo;
// Generated 20 fvr. 2019 13:58:26 by Hibernate Tools 4.3.1

import java.util.Date;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

/**
 * Utilisateur generated by hbm2java
 */
public class Utilisateur implements java.io.Serializable {

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

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 79 * hash + Objects.hashCode(this.numUser);
        hash = 79 * hash + Objects.hashCode(this.type);
        hash = 79 * hash + Objects.hashCode(this.login);
        hash = 79 * hash + Objects.hashCode(this.password);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Utilisateur other = (Utilisateur) obj;
        if (!Objects.equals(this.type, other.type)) {
            return false;
        }
        if (!Objects.equals(this.login, other.login)) {
            return false;
        }
        if (!Objects.equals(this.password, other.password)) {
            return false;
        }
        if (!Objects.equals(this.numUser, other.numUser)) {
            return false;
        }
        return true;
    }

}
