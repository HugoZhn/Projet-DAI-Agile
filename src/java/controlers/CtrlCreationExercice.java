/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import hibernateutils.HibernateUtilProjetDAI;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Exercice;

/**
 *
 * @author 21607860
 */
public class CtrlCreationExercice extends HttpServlet {

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

        String nomEx = request.getParameter("nomEx");
        String typeEx = request.getParameter("typeEx");
        String objectifsEx = request.getParameter("objectifsEx");
        String descriptionEx = request.getParameter("descriptionEx");
        String ressourceEx = request.getParameter("ressourceEx");
        Integer variable = Integer.parseInt(request.getParameter("choiceParam"));
        double tempsBaseEx = 0;
        String repsBaseEx = null;

        if (variable.equals(1)) {
            tempsBaseEx = Double.parseDouble(request.getParameter("tempsBaseEx"));
        } else if (variable.equals(2)) {
            repsBaseEx = request.getParameter("repsBaseEx");
        }

        try {

            Session session = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
            Transaction t = session.beginTransaction();

            Exercice newExercice = new Exercice(nomEx, descriptionEx, ressourceEx, tempsBaseEx, repsBaseEx, typeEx, objectifsEx, null, null);
            session.save(newExercice);
            
            System.out.println(newExercice.toString());

            t.commit();

            RequestDispatcher rd = request.getRequestDispatcher("listExercice");
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
