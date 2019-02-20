package pojo;
// Generated 20 fvr. 2019 11:34:49 by Hibernate Tools 4.3.1



/**
 * ExerciceDeSeanceId generated by hbm2java
 */
public class ExerciceDeSeanceId  implements java.io.Serializable {


     private int codeEx;
     private int codeSc;

    public ExerciceDeSeanceId() {
    }

    public ExerciceDeSeanceId(int codeEx, int codeSc) {
       this.codeEx = codeEx;
       this.codeSc = codeSc;
    }
   
    public int getCodeEx() {
        return this.codeEx;
    }
    
    public void setCodeEx(int codeEx) {
        this.codeEx = codeEx;
    }
    public int getCodeSc() {
        return this.codeSc;
    }
    
    public void setCodeSc(int codeSc) {
        this.codeSc = codeSc;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof ExerciceDeSeanceId) ) return false;
		 ExerciceDeSeanceId castOther = ( ExerciceDeSeanceId ) other; 
         
		 return (this.getCodeEx()==castOther.getCodeEx())
 && (this.getCodeSc()==castOther.getCodeSc());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getCodeEx();
         result = 37 * result + this.getCodeSc();
         return result;
   }   


}


