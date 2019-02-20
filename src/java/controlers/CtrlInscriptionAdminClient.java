package controlers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Client;
import pojo.ProfilClient;
import static hibernateutils.HibernateUtilProjetDAI.getSessionFactory;
import java.text.ParseException;
import org.hibernate.HibernateException;

/**
 *
 * @author fhamzaoui
 */
public class CtrlInscriptionAdminClient extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods. Enregistrement et Instanciation du Client avec les attributs
     * récupérés
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
        String sportProfil = request.getParameter("sportProfil");
        String typeAbo = request.getParameter("typeAbo");
        String uploadFiles = request.getParameter("uploadFiles");
        String passwordClient = request.getParameter("passwordClient");
        try {
            Session s = (Session) getSessionFactory().getCurrentSession();
            Transaction t = s.beginTransaction();
            ProfilClient pc = new ProfilClient(sportProfil);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Client c = new Client(pc, firstName, lastName, df.parse(birthDay), email, numberPhone, typeAbo, login, passwordClient, sexe, new Date(), null, null);
            s.save(c);
            t.commit();
            response.sendRedirect("Index");
        } catch (IOException | ParseException | HibernateException e) {
            System.out.println("Problème ma gueule !" + e.getMessage());

        }
    }

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
