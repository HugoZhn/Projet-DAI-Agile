/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.util.Date;


/**
 * Cette classe represente un caoch administrateur de l'applcation.
 * @author hzahn.
 */
public class CoachAdmin extends Utilisateur implements java.io.Serializable{
    
     private String mailCoach;
     private String mailAdmin;
     
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
     
    
        public CoachAdmin(){
    }
    
    public CoachAdmin(String login, String password) {
        super("coachadmin", login, password);
    }

    public CoachAdmin(String nom, String prenom, Date dateNaissance, String mailCoach, String mailAdmin, 
            String login, String password, String sexe) {

        super("coachadmin", nom, prenom, dateNaissance, login, password, sexe);
        this.mailAdmin=mailAdmin;
        this.mailCoach=mailCoach;
    }
}
