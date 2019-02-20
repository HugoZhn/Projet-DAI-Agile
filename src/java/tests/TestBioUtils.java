/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tests;

import bioutils.Dickson;
import bioutils.Karvonen;



/**
 * Classe de test des outils de calcul Dickson et Karvonen
 * @author 21808985
 */
public class TestBioUtils {
    
    public static void main (String[] args){
        System.out.println("INFOS DICKSON \n");
        
        System.out.println(Dickson.getInterpretationResultatHTML() + "\n");
        System.out.println(Dickson.getPreparationPhysiqueHTML() + "\n");
        System.out.println(Dickson.getIndiceDickson(80, 120, 145) + "\n");
        
        
        
        System.out.println("INFOS KARVONEN \n");
        
        System.out.println(Karvonen.getInformationFrequenceCibleHTML() + "\n");
        System.out.println(Karvonen.getFcKarvonen(175, 62, 77) + "\n");
     
    }
    
}
