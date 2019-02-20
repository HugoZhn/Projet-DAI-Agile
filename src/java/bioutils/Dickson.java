/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bioutils;

/**
 * Cette classe propose les outils pour documenter et calculer l'indice Dickson.
 * @author 21808985
 */
public class Dickson {
    
    
    /**
     Cette méthode retourne une chaine html fournissant les exercices de prèparation pour calculer 
     * de la valeur de l'indice Dickson d'une personne.
     * @return strHtml
     */
    public static String getPreparationPhysiqueHTML(){
        String strHtml="<h2>Le principe</h2><p>Vous vous reposer en position allongée une minute, " + 
                "vous prenez une première fois votre fréquence cardiaque (on notera C0). Pendant 45 secondes" + 
                " vous effectuez une trentaine de flexions avec les bras tendus à l&rsquo;horizontal. "  +
                "vous prenez une deuxième fois votre fréquence (on notera C1) ensuite vous vous reposez pendant 1 minutes et 30 secondes. " + 
                " Vous prenez une dernière fois votre fréquence cardiaque (on notera C2).</p>";
        return strHtml;
    }
    
    
    /**
     * Cette méthode retourne une chaine html fournissant les elements d'interpretation
     * de la valeur de l'indice Dickson d'une personne.
     * @return strHtml
     */
    public static String getInterpretationResultatHTML(){
        String strHtml="<h2>l&rsquo;analyse</h2>" +
                "A partir de l&rsquo;indice de Dickson," +
                " on a une indication sur son état de forme, et son  adaptation à l&rsquo;effort. " +
                "Plus il est élevé, plus l&rsquo;adaptation à l&rsquo;effort est mauvaise. " +
                "Le tableau de résultat est le suivant :</p>" +
                "<ul><li> &lt; 0 = excellent</li><li>0 à 2 = très bon</li><li>2 à 4 = bon</li><li>4 à 6 = moyen</li>" + 
                "<li>6 à 8 = faible</li><li>8 à 10 = très faible</li><li>&gt; 10 = mauvaise adaptation à l&rsquo;effort</li></ul>";
        return strHtml;
    }
    
    
    /**
     * 
     * Retourne l'indice de Dickson, I = ((C1-70) + 2(C2-C0))/10 si le calcul est possible.
     * Retourne -9000 sinon.
     * 
     * @param frequenceCardiaque0
     * @param frequenceCardiaque1
     * @param frequenceCardiaque2
     * @return 
     */
    public static float getIndiceDickson(int frequenceCardiaque0,int frequenceCardiaque1,int frequenceCardiaque2){
        float indice = -90000F;
        try{
            indice = ((frequenceCardiaque1 - 70) + 2 *(frequenceCardiaque2 -frequenceCardiaque0)) / 10;
            return indice;
        }
        catch(Exception e){
            return indice;
        }
    }
    
}
