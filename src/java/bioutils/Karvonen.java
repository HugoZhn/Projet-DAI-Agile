/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bioutils;

/**
 * Cette classe propose les outils pour documenter et calculer  la frequence cible de Karvonen.
 * @author 21808985
 */
public class Karvonen {
    

    
    /**
     * Cette méthode retourne une chaine html fournissant les elements sur les différents 
     * type de fréquence cible recherchées.
     * @return strHtml
     */
    public static String getInformationFrequenceCibleHTML(){
        String strHtml="<h2>Méthode de Karvonen au service de l'entraînement sportif</h2>" +
                "<p>Il y a plusieurs plages d'entraînement&#160;:</p>" +
                "<h3>Endurance fondamentale</h3>" +
                "<p>L'effort doit se retrouver autour de [70&#160;% de FC réserve + FC repos] et doit représenter au minimum 80&#160;% du temps d'effort (entraînement) hebdomadaire.</p>" +
                "<p>Zone de travail idéale pour l'élimination du stress, la perte de poids, et le travail aérobie</p>" +
                "<p>Attention&#160;: le travail effectué sous la barre des 50&#160;% ne sera pas bénéfique à l'augmentation de la capacité aérobie. En revanche, il sera utile pour les phases de récupération et d'échauffement.</p>" +
                "<h3>Résistance douce</h3>" +
                "<p>L'effort doit se retrouver autour de [70 à 85&#160;% de FC réserve + FC repos] et doit correspondre à 15&#160;% du temps de travail hebdomadaire.</p>" +
                "<p>Cette zone de travail permet d'améliorer la capacité de résistance à l’acide lactique à concentration modérée.</p>" +
                "<h3>Résistance dure</h3>" +
                "<p>L’effort doit se trouver autour de [85 à 95&#160;% de FC réserve + FC repos] et doit correspondre au maximum à 5&#160;% du temps de travail hebdomadaire.</p>" +
                "<p>Cette zone permet d'améliorer la capacité à supporter l’acide lactique à forte concentration.</p>";
        return strHtml;
    }
    
    /**
     * 
     * Retourne la frequence cardiaque cible pour une prèparation sportive.Par défut le pourcentage sera fixé à 70%
     * si la valeur passée est inferieur à 70. Cela correspond à un endurance fondamentale.
     * Retourne -9000 sinon.
     * 
     * 
     * @param frequenceCardiaqueMax
     * @param frequenceCardiaqueRepos
     * @param pourcentageFrequenceCible
     * @return frequenceCible
     */
    public static float getFcKarvonen(int frequenceCardiaqueMax,int frequenceCardiaqueRepos,int pourcentageFrequenceCible){
   
        float frequenceCible = -90000F;
        int frequenceReserve = 0;
        int pourcentage = 70;
        
        // on valorise le pourcentage
        if(pourcentageFrequenceCible>70)
            pourcentage = pourcentageFrequenceCible;
        
        // calcul de ma frequence
        try{
            frequenceReserve = frequenceCardiaqueMax - frequenceCardiaqueRepos;
            frequenceCible = frequenceCardiaqueRepos + (pourcentage *  frequenceReserve / 100);
            return frequenceCible;
        }
        catch(Exception e){
            return frequenceCible;
        }
    }
    
}
