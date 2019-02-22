package controlers;

import static hibernateutils.HibernateUtilProjetDAI.getSessionFactory;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Client;

/**
 *
 * @author fhamzaoui
 */
public class CtrlformBoostrapDetailsProfil extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String loggin = request.getParameter("action");

        try {
            Session sessionHibernate = getSessionFactory().getCurrentSession();
            Transaction t = sessionHibernate.beginTransaction();
            Query q = sessionHibernate.createQuery("from Client c where c.login=? ");
            q.setString(0, loggin);
            Client theClient = (Client) q.uniqueResult();            
            theClient.getProfilClient();
            t.commit();
            HttpSession session = request.getSession(true);
            session.setAttribute("theClient", theClient);
            RequestDispatcher rd = request.getRequestDispatcher("formBoostrapDetailsProfil");
            request.setAttribute("msg_avrt", "Ok");
            rd.forward(request, response);
        } catch (IOException | ServletException | HibernateException ex) {
            System.out.println("erreur : "+ex.getMessage() );
            RequestDispatcher rd = request.getRequestDispatcher("adminAfficherClients");
            request.setAttribute("msg_avrt", ex.getMessage());
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
