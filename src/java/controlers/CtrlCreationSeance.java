/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.ProfilClient;
import pojo.Seance;
import hibernateutils.HibernateUtilProjetDAI;
import static hibernateutils.HibernateUtilProjetDAI.getSessionFactory;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import org.hibernate.HibernateException;
import pojo.Client;
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
            throws ServletException, IOException {
      
           
        // récupération des éléments inscrits dans le formulaire
        String profilClientSeance =request.getParameter("profilClientSeance");
        String nameSeance = request.getParameter("nameSeance");
        String recupSeance = request.getParameter("recupSeance");
        String echauffementSeance = request.getParameter("echauffementSeance");

                try {

                   Session ses = (Session) HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
                   Integer g = Integer.parseInt(profilClientSeance); //convertir string récupérer du formulaire en integer vu que c'est un code
                   Transaction tc = ses.beginTransaction() ;
                   ProfilClient profilc = (ProfilClient) ses.load(ProfilClient.class, g); //recuperation de l'objet à partir de son identifiant g

                   Seance s1  = new Seance(nameSeance,recupSeance, echauffementSeance); //enregistrement de la séance
                   s1.setProfilClient(profilc);
                   ses.save(s1);
                   tc.commit(); // Commit et flush automatique de la session       

                    //redirection vers la liste des seances une fois finie
                    RequestDispatcher rd = request.getRequestDispatcher("listSeance");
                    rd.forward(request, response);
                    
                    } 
                    catch (HibernateException e)
                    {
                    System.out.println("Problème :" + e.getMessage());
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
