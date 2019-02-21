/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tests;

import org.hibernate.Transaction;
import pojo.Client;
import hibernateutils.HibernateUtilProjetDAI;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
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

        try {
            /*----- Ouverture de la session et de la transaction -----*/
            Session session = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
            Transaction t = session.beginTransaction();

////            Client c = new Client("LOGIN", "MPD", new Date());
////            session.save(c);
////
////
////            CoachAdmin cadm = new CoachAdmin( "LOGIN", "MPD", new Date());
////            session.save(cadm);
//
//            Client c = (Client)session.get(Client.class, 32);
//            ProgrammeClient test = new ProgrammeClient(c, "ProTest");
//            session.save(test);
//            System.out.println(c.getProgrammes());
            Query q = session.createQuery("from ExerciceDeSeance e where e.id.codeSc = ?");
            q.setInteger(0, 2);

            List x = q.list();

            System.out.println(x);

            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.exit(0);
        }
    }

}
