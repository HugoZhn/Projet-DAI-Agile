/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import pojo.Exercice;
import pojo.TypeExercice;

/**
 *
 * @author 21607860
 */
public class CtrlModifExercice extends HttpServlet {

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

        int codeEx = Integer.parseInt(request.getParameter("codeEx"));       
        String nomEx = request.getParameter("nomEx");
        Integer typeEx = Integer.parseInt(request.getParameter("typeEx"));
        String objectifsEx = request.getParameter("objectifsEx");
        String descriptionEx = request.getParameter("descriptionEx");
        String precisionsEx = request.getParameter("precisionEx");
        String ressourceEx = request.getParameter("ressourceEx");
        String tempsBaseEx = request.getParameter("tempsBaseEx");
        String repsBaseEx = request.getParameter("repsBaseEx");

        Double tempsBaseExD = null;
        int repsBaseExInt = 0;

        if (!tempsBaseEx.equals("")) {
            tempsBaseExD = Double.parseDouble(tempsBaseEx);
        }
        if (!repsBaseEx.equals("")) {
            repsBaseExInt = Integer.parseInt(repsBaseEx);
        }

        try {

            Session sessionHibernate = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
            Transaction t = sessionHibernate.beginTransaction();

            TypeExercice typeExercice = (TypeExercice) sessionHibernate.load(TypeExercice.class, typeEx);
            Exercice ex = (Exercice)sessionHibernate.get(Exercice.class, codeEx);
            
            ex.setNomEx(nomEx);
            ex.setTypeExercice(typeExercice);
            ex.setObjectifsEx(objectifsEx);
            ex.setPrecisionsEx(precisionsEx);
            ex.setDescriptionEx(descriptionEx);
            ex.setRessourceEx(ressourceEx);
            ex.setTempsBaseEx(tempsBaseExD);
            ex.setRepsBaseEx(repsBaseExInt);

            sessionHibernate.update(ex);
            t.commit();
            
            HttpSession session = request.getSession(true);
            session.setAttribute("exercice", ex);

            RequestDispatcher rd = request.getRequestDispatcher("CtrlListExercice");
            request.setAttribute("msg_avrt", "Ok");
            rd.forward(request, response);

        } catch (IOException | ServletException | HibernateException ex) {

            RequestDispatcher rd = request.getRequestDispatcher("editionExercice");
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
