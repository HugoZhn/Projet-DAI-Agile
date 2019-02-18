/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Cette classe represente un utilisateur du site.
 *
 * @author hzahn.
 */
public class Client extends Utilisateur implements java.io.Serializable {

    private String mailClient;
    private String telephone;
    private String typeAbonnement;
    private Set programmes = new HashSet(0);
    private Set documentses = new HashSet(0);
    private ProfilClient profilClient;
    
    
    public Client(){
    }
    
    public Client(String login, String password) {
        super("client", login, password);
    }

    public Client(ProfilClient profilClient, String nom, String prenom, Date dateNaissance, String mailClient, String telephone,
            String typeAbonnement, String login, String password, String sexe, Set programmes, Set documentses) {

        super("client", nom, prenom, dateNaissance, login, password, sexe);
        this.mailClient = mailClient;
        this.telephone = telephone;
        this.typeAbonnement = typeAbonnement;
        this.programmes = programmes;
        this.documentses = documentses;
    }

    public String getMailClient() {
        return this.mailClient;
    }

    public void setMailClient(String mailClient) {
        this.mailClient = mailClient;
    }

    public String getTelephone() {
        return this.telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getTypeAbonnement() {
        return this.typeAbonnement;
    }

    public void setTypeAbonnement(String typeAbonnement) {
        this.typeAbonnement = typeAbonnement;
    }

    public Set getProgrammes() {
        return programmes;
    }

    public void setProgrammes(Set programmes) {
        this.programmes = programmes;
    }

    public Set getDocumentses() {
        return documentses;
    }

    public void setDocumentses(Set documentses) {
        this.documentses = documentses;
    }

    public ProfilClient getProfilClient() {
        return profilClient;
    }

    public void setProfilClient(ProfilClient profilClient) {
        this.profilClient = profilClient;
    }
}
