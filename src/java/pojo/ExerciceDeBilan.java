package pojo;
// Generated 18 f�vr. 2019 15:54:11 by Hibernate Tools 4.3.1



/**
 * ExerciceDeBilan generated by hbm2java
 */
public class ExerciceDeBilan  implements java.io.Serializable {


     private ExerciceDeBilanId id;
     private Exercice exercice;
     private SeanceBilan seanceBilan;
     private Integer tempsMax;
     private Integer repsMax;

    public ExerciceDeBilan() {
    }

	
    public ExerciceDeBilan(ExerciceDeBilanId id, Exercice exercice, SeanceBilan seanceBilan) {
        this.id = id;
        this.exercice = exercice;
        this.seanceBilan = seanceBilan;
    }
    public ExerciceDeBilan(ExerciceDeBilanId id, Exercice exercice, SeanceBilan seanceBilan, Integer tempsMax, Integer repsMax) {
       this.id = id;
       this.exercice = exercice;
       this.seanceBilan = seanceBilan;
       this.tempsMax = tempsMax;
       this.repsMax = repsMax;
    }
   
    public ExerciceDeBilanId getId() {
        return this.id;
    }
    
    public void setId(ExerciceDeBilanId id) {
        this.id = id;
    }
    public Exercice getExercice() {
        return this.exercice;
    }
    
    public void setExercice(Exercice exercice) {
        this.exercice = exercice;
    }
    public SeanceBilan getSeanceBilan() {
        return this.seanceBilan;
    }
    
    public void setSeanceBilan(SeanceBilan seanceBilan) {
        this.seanceBilan = seanceBilan;
    }
    public Integer getTempsMax() {
        return this.tempsMax;
    }
    
    public void setTempsMax(Integer tempsMax) {
        this.tempsMax = tempsMax;
    }
    public Integer getRepsMax() {
        return this.repsMax;
    }
    
    public void setRepsMax(Integer repsMax) {
        this.repsMax = repsMax;
    }




}


