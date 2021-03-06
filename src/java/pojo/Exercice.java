package pojo;
// Generated 19 f�vr. 2019 12:38:57 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

/**
 * Exercice generated by hbm2java
 */
public class Exercice  implements java.io.Serializable {


     private Integer codeEx;
     private TypeExercice typeExercice;
     private String nomEx;
     private String descriptionEx;
     private String ressourceEx;
     private Double tempsBaseEx;
     private String repsBaseEx;
     private String objectifsEx;
     private Set exerciceDeSeances = new HashSet(0);
     private Set exerciceDeBilans = new HashSet(0);

    public Exercice() {
    }

	
    public Exercice(TypeExercice typeExercice, String nomEx) {
        this.typeExercice = typeExercice;
        this.nomEx = nomEx;
    }
    public Exercice(TypeExercice typeExercice, String nomEx, String descriptionEx, String ressourceEx, Double tempsBaseEx, String repsBaseEx, String objectifsEx, Set exerciceDeSeances, Set exerciceDeBilans) {
       this.typeExercice = typeExercice;
       this.nomEx = nomEx;
       this.descriptionEx = descriptionEx;
       this.ressourceEx = ressourceEx;
       this.tempsBaseEx = tempsBaseEx;
       this.repsBaseEx = repsBaseEx;
       this.objectifsEx = objectifsEx;
       this.exerciceDeSeances = exerciceDeSeances;
       this.exerciceDeBilans = exerciceDeBilans;
    }
   
    public Integer getCodeEx() {
        return this.codeEx;
    }
    
    public void setCodeEx(Integer codeEx) {
        this.codeEx = codeEx;
    }
    public TypeExercice getTypeExercice() {
        return this.typeExercice;
    }
    
    public void setTypeExercice(TypeExercice typeExercice) {
        this.typeExercice = typeExercice;
    }
    public String getNomEx() {
        return this.nomEx;
    }
    
    public void setNomEx(String nomEx) {
        this.nomEx = nomEx;
    }
    public String getDescriptionEx() {
        return this.descriptionEx;
    }
    
    public void setDescriptionEx(String descriptionEx) {
        this.descriptionEx = descriptionEx;
    }
    public String getRessourceEx() {
        return this.ressourceEx;
    }
    
    public void setRessourceEx(String ressourceEx) {
        this.ressourceEx = ressourceEx;
    }
    public Double getTempsBaseEx() {
        return this.tempsBaseEx;
    }
    
    public void setTempsBaseEx(Double tempsBaseEx) {
        this.tempsBaseEx = tempsBaseEx;
    }
    public String getRepsBaseEx() {
        return this.repsBaseEx;
    }
    
    public void setRepsBaseEx(String repsBaseEx) {
        this.repsBaseEx = repsBaseEx;
    }
    public String getObjectifsEx() {
        return this.objectifsEx;
    }
    
    public void setObjectifsEx(String objectifsEx) {
        this.objectifsEx = objectifsEx;
    }
    public Set getExerciceDeSeances() {
        return this.exerciceDeSeances;
    }
    
    public void setExerciceDeSeances(Set exerciceDeSeances) {
        this.exerciceDeSeances = exerciceDeSeances;
    }
    public Set getExerciceDeBilans() {
        return this.exerciceDeBilans;
    }
    
    public void setExerciceDeBilans(Set exerciceDeBilans) {
        this.exerciceDeBilans = exerciceDeBilans;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 41 * hash + Objects.hashCode(this.codeEx);
        hash = 41 * hash + Objects.hashCode(this.nomEx);
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
        final Exercice other = (Exercice) obj;
        if (!Objects.equals(this.nomEx, other.nomEx)) {
            return false;
        }
        if (!Objects.equals(this.codeEx, other.codeEx)) {
            return false;
        }
        return true;
    }




}


