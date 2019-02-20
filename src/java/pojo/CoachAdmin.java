/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author hzahn
 */
public class CoachAdmin extends Utilisateur implements Serializable {

    private String mailCoach;
    private String mailAdmin;

    public CoachAdmin() {
        super();
    }

    public CoachAdmin(String login, String password, Date dateInscritpion) {
        super("coachadmin", login, password, dateInscritpion);
    }

    public CoachAdmin(String mailCoach, String mailAdmin, String nom, String prenom, Date dateNaissance, String login, String password, String sexe, Date dateInscritpion) {
        super("coachadmin", nom, prenom, dateNaissance, login, password, sexe, dateInscritpion);
        this.mailCoach = mailCoach;
        this.mailAdmin = mailAdmin;
    }

    public String getMailCoach() {
        return this.mailCoach;
    }

    public void setMailCoach(String mailCoach) {
        this.mailCoach = mailCoach;
    }

    public String getMailAdmin() {
        return this.mailAdmin;
    }

    public void setMailAdmin(String mailAdmin) {
        this.mailAdmin = mailAdmin;
    }
}
