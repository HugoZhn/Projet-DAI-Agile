package pojo;
// Generated 20 fvr. 2019 13:58:26 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

/**
 * SeanceBilan generated by hbm2java
 */
public class SeanceBilan  implements java.io.Serializable {


     private Integer codeScBilan;
     private Integer age;
     private Double poids;
     private Integer fcCinqminAll;
     private Integer fcTrenteflexions;
     private Integer fcUneminApexAll;
     private Boolean objectifMinceur;
     private Double mensBras;
     private Double mensPoitrine;
     private Double mensTaille;
     private Double mensHanches;
     private Double mensCuisses;
     private Set exerciceDeBilans = new HashSet(0);
     private Set utilisateurs = new HashSet(0);
     private Set seanceBilanAppartenirs = new HashSet(0);

    public SeanceBilan() {
    }

    public SeanceBilan(Integer age, Double poids, Integer fcCinqminAll, Integer fcTrenteflexions, Integer fcUneminApexAll, Boolean objectifMinceur, Double mensBras, Double mensPoitrine, Double mensTaille, Double mensHanches, Double mensCuisses, Set exerciceDeBilans, Set utilisateurs, Set seanceBilanAppartenirs) {
       this.age = age;
       this.poids = poids;
       this.fcCinqminAll = fcCinqminAll;
       this.fcTrenteflexions = fcTrenteflexions;
       this.fcUneminApexAll = fcUneminApexAll;
       this.objectifMinceur = objectifMinceur;
       this.mensBras = mensBras;
       this.mensPoitrine = mensPoitrine;
       this.mensTaille = mensTaille;
       this.mensHanches = mensHanches;
       this.mensCuisses = mensCuisses;
       this.exerciceDeBilans = exerciceDeBilans;
       this.utilisateurs = utilisateurs;
       this.seanceBilanAppartenirs = seanceBilanAppartenirs;
    }
   
    public Integer getCodeScBilan() {
        return this.codeScBilan;
    }
    
    public void setCodeScBilan(Integer codeScBilan) {
        this.codeScBilan = codeScBilan;
    }
    public Integer getAge() {
        return this.age;
    }
    
    public void setAge(Integer age) {
        this.age = age;
    }
    public Double getPoids() {
        return this.poids;
    }
    
    public void setPoids(Double poids) {
        this.poids = poids;
    }
    public Integer getFcCinqminAll() {
        return this.fcCinqminAll;
    }
    
    public void setFcCinqminAll(Integer fcCinqminAll) {
        this.fcCinqminAll = fcCinqminAll;
    }
    public Integer getFcTrenteflexions() {
        return this.fcTrenteflexions;
    }
    
    public void setFcTrenteflexions(Integer fcTrenteflexions) {
        this.fcTrenteflexions = fcTrenteflexions;
    }
    public Integer getFcUneminApexAll() {
        return this.fcUneminApexAll;
    }
    
    public void setFcUneminApexAll(Integer fcUneminApexAll) {
        this.fcUneminApexAll = fcUneminApexAll;
    }
    public Boolean getObjectifMinceur() {
        return this.objectifMinceur;
    }
    
    public void setObjectifMinceur(Boolean objectifMinceur) {
        this.objectifMinceur = objectifMinceur;
    }
    public Double getMensBras() {
        return this.mensBras;
    }
    
    public void setMensBras(Double mensBras) {
        this.mensBras = mensBras;
    }
    public Double getMensPoitrine() {
        return this.mensPoitrine;
    }
    
    public void setMensPoitrine(Double mensPoitrine) {
        this.mensPoitrine = mensPoitrine;
    }
    public Double getMensTaille() {
        return this.mensTaille;
    }
    
    public void setMensTaille(Double mensTaille) {
        this.mensTaille = mensTaille;
    }
    public Double getMensHanches() {
        return this.mensHanches;
    }
    
    public void setMensHanches(Double mensHanches) {
        this.mensHanches = mensHanches;
    }
    public Double getMensCuisses() {
        return this.mensCuisses;
    }
    
    public void setMensCuisses(Double mensCuisses) {
        this.mensCuisses = mensCuisses;
    }
    public Set getExerciceDeBilans() {
        return this.exerciceDeBilans;
    }
    
    public void setExerciceDeBilans(Set exerciceDeBilans) {
        this.exerciceDeBilans = exerciceDeBilans;
    }
    public Set getUtilisateurs() {
        return this.utilisateurs;
    }
    
    public void setUtilisateurs(Set utilisateurs) {
        this.utilisateurs = utilisateurs;
    }
    public Set getSeanceBilanAppartenirs() {
        return this.seanceBilanAppartenirs;
    }
    
    public void setSeanceBilanAppartenirs(Set seanceBilanAppartenirs) {
        this.seanceBilanAppartenirs = seanceBilanAppartenirs;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 67 * hash + Objects.hashCode(this.codeScBilan);
        hash = 67 * hash + Objects.hashCode(this.age);
        hash = 67 * hash + Objects.hashCode(this.poids);
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
        final SeanceBilan other = (SeanceBilan) obj;
        if (!Objects.equals(this.codeScBilan, other.codeScBilan)) {
            return false;
        }
        if (!Objects.equals(this.age, other.age)) {
            return false;
        }
        if (!Objects.equals(this.poids, other.poids)) {
            return false;
        }
        return true;
    }


}


