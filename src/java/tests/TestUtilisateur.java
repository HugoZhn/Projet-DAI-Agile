/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tests;

import org.hibernate.Transaction;
import pojo.Client;
import hibernateutils.HibernateUtilProjetDAI;
import org.hibernate.Session;
import pojo.CoachAdmin;
import pojo.Programme;
import pojo.ProgrammeClient;

/**
 *
 * @author hzahn
 */
public class TestUtilisateur {

    public static void main(String args[]) {

        try{
            /*----- Ouverture de la session et de la transaction -----*/
            Session session = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
            Transaction t = session.beginTransaction();

//            Client c = new Client("LOGIN", "MPD");
//            session.save(c);
//
//
//            CoachAdmin cadm = new CoachAdmin( "LOGIN", "MPD");
//            session.save(cadm);

            Client c = (Client)session.get(Client.class, 1);
            System.out.println(c.getProgrammes());
            
            
            t.commit();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally{
            System.exit(0);
        }
    }

}
