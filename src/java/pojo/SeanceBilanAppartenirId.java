package pojo;
// Generated 21 f�vr. 2019 10:27:40 by Hibernate Tools 4.3.1



/**
 * SeanceBilanAppartenirId generated by hbm2java
 */
public class SeanceBilanAppartenirId  implements java.io.Serializable {


     private int codeScBilan;
     private int codePrgrm;
     private int noSemaine;

    public SeanceBilanAppartenirId() {
    }

    public SeanceBilanAppartenirId(int codeScBilan, int codePrgrm, int noSemaine) {
       this.codeScBilan = codeScBilan;
       this.codePrgrm = codePrgrm;
       this.noSemaine = noSemaine;
    }
   
    public int getCodeScBilan() {
        return this.codeScBilan;
    }
    
    public void setCodeScBilan(int codeScBilan) {
        this.codeScBilan = codeScBilan;
    }
    public int getCodePrgrm() {
        return this.codePrgrm;
    }
    
    public void setCodePrgrm(int codePrgrm) {
        this.codePrgrm = codePrgrm;
    }
    public int getNoSemaine() {
        return this.noSemaine;
    }
    
    public void setNoSemaine(int noSemaine) {
        this.noSemaine = noSemaine;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof SeanceBilanAppartenirId) ) return false;
		 SeanceBilanAppartenirId castOther = ( SeanceBilanAppartenirId ) other; 
         
		 return (this.getCodeScBilan()==castOther.getCodeScBilan())
 && (this.getCodePrgrm()==castOther.getCodePrgrm())
 && (this.getNoSemaine()==castOther.getNoSemaine());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getCodeScBilan();
         result = 37 * result + this.getCodePrgrm();
         result = 37 * result + this.getNoSemaine();
         return result;
   }   


}


