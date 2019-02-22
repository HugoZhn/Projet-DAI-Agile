/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlers;

import bd.Bd;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.ProfilClient;
import pojo.Seance;
import hibernateutils.HibernateUtilProjetDAI;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import org.hibernate.HibernateException;
import pojo.Exercice;

/**
 *
 * @author 21402458
 */
public class CtrlCreationSeance extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        // récupération des éléments inscrits dans le formulaire
        String profilClientSeance = request.getParameter("profilClientSeance");
        String nameSeance = request.getParameter("nameSeance");
        String recupSeance = request.getParameter("recupSeance");
        String echauffementSeance = request.getParameter("echauffementSeance");
        String[] exerciceSeance = (String[]) request.getParameterValues("exerciceProg");

        try {

            
            int g = Integer.parseInt(profilClientSeance); //convertir string récupérer du formulaire en integer vu que c'est un code
                    Session sessionHibernate = (Session) HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
                    Transaction tc = sessionHibernate.beginTransaction();

            ProfilClient profilc = (ProfilClient) sessionHibernate.load(ProfilClient.class, g); //recuperation de l'objet à partir de son identifiant g
            
            
            Seance s1 = new Seance(nameSeance, recupSeance, echauffementSeance); //enregistrement de la séance
            s1.setProfilClient(profilc);
            sessionHibernate.save(s1);    

                       
            tc.commit(); // Commit et flush automatique de la session   
            
            for (String exercice : exerciceSeance) {

                if (!exercice.equals("0")) {

                    Session sessionHibernate2 = (Session) HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
                    Transaction t = sessionHibernate2.beginTransaction();
            
                    String str[] = exercice.split(",");

                    int ordre = Integer.parseInt(str[0]);
                    int codeSc = Integer.parseInt(str[1]);
                    
                    System.out.println("requete");

                    Exercice exerciceSc = (Exercice) sessionHibernate2.load(Exercice.class, codeSc);

                    Bd.enregistrerExerciceSeance(exerciceSc.getCodeEx(), s1.getCodeSc(), exerciceSc.getTempsBaseEx(), exerciceSc.getRepsBaseEx(), 1, ordre);
                    
                    System.out.println("requete 2");
                    
                    s1.getSeanceAppartenirs().add(exerciceSc);
                    
                    System.out.println("requete 3");
                    
                    t.commit();

                }

            }
 

            RequestDispatcher rd = request.getRequestDispatcher("listSeance");
            rd.forward(request, response);
            
        } catch (HibernateException ex) {
            RequestDispatcher rd = request.getRequestDispatcher("listSeance");
            request.setAttribute("msg_avrt", ex.getMessage());
            rd.forward(request, response);
        }
    }
    //}

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CtrlCreationSeance.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CtrlCreationSeance.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
