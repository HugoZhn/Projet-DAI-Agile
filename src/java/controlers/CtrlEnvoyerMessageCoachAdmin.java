/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlers;

import static hibernateutils.HibernateUtilProjetDAI.getSessionFactory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Client;
import pojo.CoachAdmin;

/**
 *
 * @author 21808985
 */
public class CtrlEnvoyerMessageCoachAdmin extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String coachadmin = request.getParameter("jd");
            String message = request.getParameter("message");

            String destinataire = "";
            HttpSession session = request.getSession();
            Client clientConnecte  = (Client)session.getAttribute("clientSession");
            String mailClient = null;
            if(clientConnecte!= null)
                mailClient =  clientConnecte.getMailClient();
            else
                mailClient =  "VIDE !!";
           
            
            // recuperation de l'adresse mail du destinatire 
            //Session sessionH = (Session) hibernateutils.HibernateUtilProjetDAI.getSessionFactory();
            Session s = (Session) getSessionFactory().getCurrentSession();
            Transaction t = s.beginTransaction();
            CoachAdmin coachAdmin =null;
            coachAdmin = (CoachAdmin) s.get(CoachAdmin.class,24 );
            
            
            if (coachadmin.equals("au coach")) {
                //Do action
                destinataire = "COACH !!";
                destinataire = destinataire + coachAdmin.getMailCoach();
            } else  {
                //Do other action
                destinataire = "ADMIN !!";
                destinataire = destinataire + coachAdmin.getMailAdmin();
            }
            if(message.isEmpty())
                    message =" pas de message";
  
          
            
            
            /* TODO output your page here. You may use following sample code.  */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrlEnvoyerMessageCoachAdmin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrlEnvoyerMessageCoachAdmin at " + request.getContextPath() + "</h1>");
            out.println("<h1>DESTINATAIRE : " + destinataire + "</h1>");
            out.println("<h1>MESSAGE : " + message + "</h1>");
            out.println("<h1>MESSAGE : " + mailClient + "</h1>");
            out.println("</body>");
            out.println("</html>"); 
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
