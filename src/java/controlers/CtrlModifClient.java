/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlers;

import hibernateutils.HibernateUtilProjetDAI;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Client;
import pojo.ProfilClient;

/**
 *
 * @author fhamzaoui
 */
public class CtrlModifClient extends HttpServlet {

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

        String login = request.getParameter("login");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String birthDay = request.getParameter("birthDay");
        String email = request.getParameter("email");
        String numberPhone = request.getParameter("numberPhone");
        String sexe = request.getParameter("sexe");
        String sportProfil = "";
        String idsportProfil = "";
        if (request.getParameter("idsportProfil") != null) {
            idsportProfil = request.getParameter("idsportProfil");
            System.out.println(idsportProfil);
        }

        String typeAbo = request.getParameter("typeAbo");
        String passwordClient = request.getParameter("passwordClient");
        
//        System.out.println("login "+login);
//        System.out.println("nom "+firstName);
//        System.out.println("prénom "+lastName);
//        System.out.println("anniversaire "+birthDay);
//        System.out.println("email "+email);
//        System.out.println("numTel "+numberPhone);
//        System.out.println("sexe "+sexe);
//        System.out.println("nom Profil Sportif " +idsportProfil);
//        System.out.println("code Profil Sportif " +sportProfil);
//        System.out.println("typeAbonnement "+typeAbo);
//        System.out.println("MDP "+passwordClient);

        try {
            HttpSession session =request.getSession();
            Client theClient = (Client) session.getAttribute("theClient");
            Session sessionHibernate = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
            Transaction t = sessionHibernate.beginTransaction();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");            
            
            theClient = (Client) sessionHibernate.get(Client.class, theClient.getNumUser().intValue() );
            
            
            theClient.setNom(firstName);
            theClient.setPrenom(lastName);
            theClient.setDateNaissance(df.parse(birthDay));
            theClient.setMailClient(email);
            theClient.setTelephone(numberPhone);
            theClient.setSexe(sexe);
            ProfilClient profilClientModifie=null;
            if (!idsportProfil.isEmpty()) {
                 profilClientModifie = (ProfilClient) sessionHibernate.load(ProfilClient.class, Integer.parseInt(idsportProfil));
                theClient.setProfilClient(profilClientModifie);
                System.out.println("PROFIL modifié derniere etape " + profilClientModifie.getNomProfil());
            }
            theClient.setTypeAbonnement(typeAbo);
            theClient.setPassword(passwordClient);

            sessionHibernate.saveOrUpdate(theClient);
            System.out.println("NOM " + theClient.getNom());
           
            t.commit();

            session = request.getSession(true);
            session.setAttribute("theClient", theClient);

            RequestDispatcher rd = request.getRequestDispatcher("CtrlListeClients");
            request.setAttribute("msg_avrt", "Ok");
            rd.forward(request, response);

        } catch (IOException | ServletException | HibernateException ex) {
            
            System.out.println(ex.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("editionExercice");
            request.setAttribute("msg_avrt", ex.getMessage());
            rd.forward(request, response);

        } catch (ParseException ex) {
            Logger.getLogger(CtrlModifClient.class.getName()).log(Level.SEVERE, null, ex);
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
