/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Cette classe represente un utilisateur du site.
 *
 * @author hzahn
 */
public class Client extends Utilisateur implements Serializable {

    private ProfilClient profilClient;
    private SeanceBilan seanceBilan;
    private String mailClient;
    private String telephone;
    private String typeAbonnement;
    private Set programmes = new HashSet(0);
    private Set documentses = new HashSet(0);

    public Client() {
        super();
    }

    public Client(String login, String password, Date dateInscritpion) {
        super("client", login, password, dateInscritpion);
    }

    public Client(ProfilClient profilClient, SeanceBilan seanceBilan, String mailClient,
            String telephone, String typeAbonnement, String nom, String prenom,
            Date dateNaissance, String login, String password, String sexe, Date dateInscritpion) {
        super("client", nom, prenom, dateNaissance, login, password, sexe, dateInscritpion);
        this.profilClient = profilClient;
        this.seanceBilan = seanceBilan;
        this.mailClient = mailClient;
        this.telephone = telephone;
        this.typeAbonnement = typeAbonnement;
    }

    public ProfilClient getProfilClient() {
        return this.profilClient;
    }

    public void setProfilClient(ProfilClient profilClient) {
        this.profilClient = profilClient;
    }

    public SeanceBilan getSeanceBilan() {
        return this.seanceBilan;
    }

    public void setSeanceBilan(SeanceBilan seanceBilan) {
        this.seanceBilan = seanceBilan;
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
        return this.programmes;
    }

    public void setProgrammes(Set programmes) {
        this.programmes = programmes;
    }

    public Set getDocumentses() {
        return this.documentses;
    }

    public void setDocumentses(Set documentses) {
        this.documentses = documentses;
    }
    
    public ProgrammeClient getCurrentProgramme(){
        for (ProgrammeClient programme : (Set<ProgrammeClient>) this.programmes){
            if (!programme.isFini()){
                return programme;
            }
        }
        return null;
    }

}
