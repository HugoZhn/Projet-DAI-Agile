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
import pojo.TypeExercice;

/**
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
        Integer typeEx = Integer.parseInt(request.getParameter("typeEx"));
        String objectifsEx = request.getParameter("objectifsEx");
        String descriptionEx = request.getParameter("descriptionEx");
        String precisionsEx = request.getParameter("precisionEx");
        String ressourceEx = request.getParameter("ressourceEx");
        String tempsBaseEx = request.getParameter("tempsBaseEx");
        String repsBaseEx = request.getParameter("repsBaseEx");

        Integer tempsBaseExD = 0;
        int repsBaseExInt = 0;

        if (!tempsBaseEx.equals("")) {
            tempsBaseExD = Integer.parseInt(tempsBaseEx);
        }
        if (!repsBaseEx.equals("")) {
            repsBaseExInt = Integer.parseInt(repsBaseEx);
        }

        try {

            Session session = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
            Transaction t = session.beginTransaction();

            TypeExercice typeExercice = (TypeExercice) session.load(TypeExercice.class, typeEx);
            Exercice newExercice = new Exercice(typeExercice, nomEx, descriptionEx, precisionsEx, ressourceEx, tempsBaseExD, repsBaseExInt, objectifsEx, null, null);
            
            session.save(newExercice);

            t.commit();

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
