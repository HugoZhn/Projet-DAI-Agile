package pojo;
// Generated 19 f�vr. 2019 12:38:57 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * ProfilClient generated by hbm2java
 */
public class ProfilClient  implements java.io.Serializable {


     private Integer codeProfil;
     private String nomProfil;
     private Set programmes = new HashSet(0);
     private Set utilisateurs = new HashSet(0);
     private Set seances = new HashSet(0);

    public ProfilClient() {
    }

	
    public ProfilClient(String nomProfil) {
        this.nomProfil = nomProfil;
    }
    public ProfilClient(String nomProfil, Set programmes, Set utilisateurs, Set seances) {
       this.nomProfil = nomProfil;
       this.programmes = programmes;
       this.utilisateurs = utilisateurs;
       this.seances = seances;
    }
   
    public Integer getCodeProfil() {
        return this.codeProfil;
    }
    
    public void setCodeProfil(Integer codeProfil) {
        this.codeProfil = codeProfil;
    }
    public String getNomProfil() {
        return this.nomProfil;
    }
    
    public void setNomProfil(String nomProfil) {
        this.nomProfil = nomProfil;
    }
    public Set getProgrammes() {
        return this.programmes;
    }
    
    public void setProgrammes(Set programmes) {
        this.programmes = programmes;
    }
    public Set getUtilisateurs() {
        return this.utilisateurs;
    }
    
    public void setUtilisateurs(Set utilisateurs) {
        this.utilisateurs = utilisateurs;
    }
    public Set getSeances() {
        return this.seances;
    }
    
    public void setSeances(Set seances) {
        this.seances = seances;
    }




}

