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
import java.util.List;
import javax.servlet.RequestDispatcher;
import org.hibernate.HibernateException;
import org.hibernate.Query;

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
        String passwordClient_Conf = request.getParameter("passwordClient_Conf");
        
        System.out.println(login);
        System.out.println(firstName);
        System.out.println(lastName);
        System.out.println(birthDay);
        System.out.println(email);
        System.out.println(numberPhone);
        System.out.println(sexe);
        System.out.println(sportProfil);
        System.out.println(typeAbo);
        System.out.println(passwordClient);

        try {
                   if (!passwordClient.equals(passwordClient_Conf)) {
                    RequestDispatcher rd = request.getRequestDispatcher("formBoostrap");
                    request.setAttribute("msg_erreur", "Le mot de passe de confirmation ne correspond pas au mot de passe saisi. Veuillez re-saisir vos informations.");
                    System.out.println("Probleme mots de passes");
                    rd.forward(request, response);
                } else {
                    Session s = (Session) getSessionFactory().getCurrentSession();
                    Transaction t = s.beginTransaction();
                    Query q = s.createQuery("from Client c where c.login=? ");
                    q.setString(0, login);
                    String sortie = "";
                    if (q.uniqueResult() != null) {
                        sortie = "formBoostrap";
                    } else {
                        ProfilClient pc = (ProfilClient)s.get(ProfilClient.class,Integer.parseInt(sportProfil));
                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                        Client c = new Client(pc, null,email, numberPhone, typeAbo, firstName, lastName, df.parse(birthDay), login, passwordClient, sexe, new Date());
                        s.save(c);
                        sortie = "accueilCoach";
                    }
                    t.commit();
                    //on revient à la page saisir car l'enregistrement dans la BD n'a pas fonctionné
                    RequestDispatcher rd = request.getRequestDispatcher(sortie);
                    if (sortie == "formBoostrap") {
                        request.setAttribute("msg_erreur", "Il y a déjà un utilisateur ayant ce login ! Veuillez changer ce dernier !");
                        System.out.println("Probleme LOGIN EXISTANTS ");
                    } else if (sortie == "CtrlListeClients") {
                        //on revient à la page saisir car l'enregistrement dans la BD a fonctionné
                        request.setAttribute("msg_enregistrement_ok", "Votre enregistrement a bien été pris en compte !");
                    }
                    rd.forward(request, response);                
            }
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
