/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlers;

import bd.Bd;
import hibernateutils.HibernateUtilProjetDAI;
import java.io.IOException;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.ProfilClient;
import pojo.Programme;


/**
 *
 * @author 21607860
 */
public class CtrlEditerProgramme extends HttpServlet {

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

        String libellePrgrm = request.getParameter("libellePrgrm");
        String codeProfil = request.getParameter("codeProfil");
        String[] seanceProg = (String[]) request.getParameterValues("seanceProg");

        try {

            System.out.println("Entrée try");
            Session sessionHibernate = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
            Transaction t = sessionHibernate.beginTransaction();
            
            System.out.println("Récupération profil client");
            
            ProfilClient profilClient = (ProfilClient) sessionHibernate.load(ProfilClient.class, Integer.parseInt(codeProfil));

            Programme newProg = new Programme(profilClient, libellePrgrm, false, null, null);

            sessionHibernate.save(newProg);

            t.commit();
            
            System.out.println("Début boucle");
            
            for (String seance : seanceProg) {

                if (!seance.equals("0")) {

                    String str[] = seance.split(",");

                    Integer codeSemaine = Integer.parseInt(str[0]);
                    Integer ordre = Integer.parseInt(str[1]);
                    Integer codeSc = Integer.parseInt(str[2]);
                    
                    System.out.println("Requete");
                    
                    Bd.enregistrerSeanceAppartenir(codeSc, newProg.getCodePrgrm(), codeSemaine, ordre);

                }

            }

            RequestDispatcher rd = request.getRequestDispatcher("editerProgramme");
            request.setAttribute("msg_avrt", "Ok");
            rd.forward(request, response);

        } catch (IOException | ServletException | HibernateException ex) {

            RequestDispatcher rd = request.getRequestDispatcher("editerProgramme");
            request.setAttribute("msg_avrt", ex.getMessage());
            System.out.println(ex.getMessage());
            rd.forward(request, response);

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CtrlEditerProgramme.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CtrlEditerProgramme.class.getName()).log(Level.SEVERE, null, ex);
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
