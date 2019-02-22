/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlers;

import hibernateutils.HibernateUtilProjetDAI;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import org.hibernate.HibernateException;
import pojo.Exercice;
import pojo.Seance;
import pojo.ExerciceDeSeance;

/**
 *
 * @author 21402458
 */
@WebServlet(name = "CtrlVoirSeance", urlPatterns = {"/CtrlVoirSeance"})
public class CtrlVoirSeance extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    //Controleur qui va permettre de visualiser une seance (input : noSeance, output : une Seance). 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // récupération de la seance choisie
        String SeanceSelectionnee = request.getParameter("noSeance");
        
        try 
        {
        Session ses = (Session) HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
        Integer g = Integer.parseInt(SeanceSelectionnee); //convertir string récupérer du formulaire en integer vu que c'est un code
        Transaction tc = ses.beginTransaction();
        
        Seance seances = (Seance) ses.load(Seance.class, g); //recuperation de l'objet à partir de son identifiant g
        seances = (Seance) ses.get(Seance.class, g);
        seances.getExerciceDeSeances();
        seances.getProfilClient();
        
        System.out.println("Profil   " + seances.getProfilClient().getNomProfil());
        Set <ExerciceDeSeance> exES = seances.getExerciceDeSeances(); //recuperation des exercices associés à cette seance. 
        
        for ( ExerciceDeSeance es : exES) {
            es.getExercice();
            System.out.println(" LEBELLE EXERCICE : " + es.getExercice().getNomEx() );
        }
        
        tc.commit();

        //redirection vers la page jsp uneSeance pour l'afficher.
        request.setAttribute("maSeance", seances);
        RequestDispatcher rd = request.getRequestDispatcher("uneSeance"); //importer requestdispatcher
        rd.forward(request, response);
    }
    catch (HibernateException e)
    {
    System.out.println("Problème :" + e.getMessage());
    }

    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
