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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Client;
import pojo.CoachAdmin;
import pojo.Utilisateur;


/**
 *
 * @author 21408162
 */
public class CtrlLogin extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        //recuperer le login et le mot de passe 
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        
        // tester la connexion a la base de données 
        //tester si le login et le mot de passe existe et match 
        Session sessionHibernate = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
        Transaction t = sessionHibernate.beginTransaction();
           
        // requete pour 
        Query queryCheckLogin = sessionHibernate.createQuery("from Utilisateur u where u.login = ? and u.password = ?");
        
        queryCheckLogin.setString(0, login);
        queryCheckLogin.setString(1, password);
        
        

        if (queryCheckLogin.uniqueResult() != null) {
         
            Utilisateur authUser = (Utilisateur) queryCheckLogin.uniqueResult();
            HttpSession session = request.getSession();
           
            if(authUser instanceof Client){
                    session.setAttribute("clientSession", authUser);
            }
            else if (authUser instanceof CoachAdmin){
                    session.setAttribute("coachadminSession", authUser);
            }
            
            
            t.commit();
            
            RequestDispatcher rs = request.getRequestDispatcher("Index");
            rs.forward(request, response);
        }else {
            // si le test ne marche pas on rest sur la meme page et on affiche un message d'erreur
            
            t.commit();
            
            request.setAttribute("errorMsg", "Login ou mot de passe incorrect");
            RequestDispatcher rs = request.getRequestDispatcher("LoginClient");
            rs.include(request, response);
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
