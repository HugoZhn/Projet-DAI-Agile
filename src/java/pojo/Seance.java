package pojo;
// Generated 19 fvr. 2019 12:38:57 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Seance generated by hbm2java
 */
public class Seance  implements java.io.Serializable {


     private Integer codeSc;
     private ProfilClient profilClient;
     private String libelleSc;
     private String recupSc;
     private String echauffement;
     private Set exerciceDeSeances = new HashSet(0);
     private Set seanceAppartenirs = new HashSet(0);

    public Seance() {
    }

	
    public Seance(ProfilClient profilClient, String libelleSc, String recupSc, String echauffement) {
        this.profilClient = profilClient;
        this.libelleSc = libelleSc;
        this.recupSc = recupSc;
        this.echauffement = echauffement;
    }
    public Seance(ProfilClient profilClient, String libelleSc, String recupSc, String echauffement, Set exerciceDeSeances, Set seanceAppartenirs) {
       this.profilClient = profilClient;
       this.libelleSc = libelleSc;
       this.recupSc = recupSc;
       this.echauffement = echauffement;
       this.exerciceDeSeances = exerciceDeSeances;
       this.seanceAppartenirs = seanceAppartenirs;
    }
   
    public Integer getCodeSc() {
        return this.codeSc;
    }
    
    public void setCodeSc(Integer codeSc) {
        this.codeSc = codeSc;
    }
    public ProfilClient getProfilClient() {
        return this.profilClient;
    }
    
    public void setProfilClient(ProfilClient profilClient) {
        this.profilClient = profilClient;
    }
    public String getLibelleSc() {
        return this.libelleSc;
    }
    
    public void setLibelleSc(String libelleSc) {
        this.libelleSc = libelleSc;
    }
    public String getRecupSc() {
        return this.recupSc;
    }
    
    public void setRecupSc(String recupSc) {
        this.recupSc = recupSc;
    }
    public String getEchauffement() {
        return this.echauffement;
    }
    
    public void setEchauffement(String echauffement) {
        this.echauffement = echauffement;
    }
    public Set getExerciceDeSeances() {
        return this.exerciceDeSeances;
    }
    
    public void setExerciceDeSeances(Set exerciceDeSeances) {
        this.exerciceDeSeances = exerciceDeSeances;
    }
    public Set getSeanceAppartenirs() {
        return this.seanceAppartenirs;
    }
    
    public void setSeanceAppartenirs(Set seanceAppartenirs) {
        this.seanceAppartenirs = seanceAppartenirs;
    }




}


