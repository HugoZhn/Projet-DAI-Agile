package controlers;

import hibernateutils.HibernateUtilProjetDAI;
import java.io.IOException;
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

/**
 *
 * @author fhamzaoui
 */
public class CtrlformBoostrapSupprimer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String loginClient = request.getParameter("loginAsupp");
        String idClient = request.getParameter("idAsupp");
        System.out.println("idClient "+loginClient);
        System.out.println("loginClient "+idClient);
        try {
            HttpSession session =request.getSession();
            Session sessionHibernate = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
            Transaction t = sessionHibernate.beginTransaction();            
            Client theClient = (Client) sessionHibernate.get(Client.class, Integer.parseInt(idClient));
            sessionHibernate.delete(theClient);
            t.commit();
            RequestDispatcher rd = request.getRequestDispatcher("CtrlListeClients");
            rd.forward(request, response);
        } catch (IOException | HibernateException ex) {
            RequestDispatcher rd = request.getRequestDispatcher("formBoostrapDetailsProfil");
            request.setAttribute("msg_avrt", ex.getMessage());
            request.setAttribute("msg_erreur", "La suppression de l'utilisateur ayant pour login "+loginClient+" a echouée. Réessayer Ulterieurement !");
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
