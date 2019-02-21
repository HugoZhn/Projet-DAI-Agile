/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlers;

import hibernateutils.HibernateUtilProjetDAI;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.ExerciceDeSeance;

/**
 *
 * @author hzahn
 */
public class ServletEffectuerSeance extends HttpServlet {

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

        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        Integer noSeanceEffectuee = Integer.parseInt(request.getParameter("noSeanceEffectuee"));

        System.out.println(noSeanceEffectuee);

        Session sessionHibernate = HibernateUtilProjetDAI.getSessionFactory().getCurrentSession();
        Transaction t = sessionHibernate.beginTransaction();

        Query q = sessionHibernate.createQuery("from ExerciceDeSeance e where e.id.codeSc = ? order by e.ordre");
        q.setInteger(0, noSeanceEffectuee);

        List<ExerciceDeSeance> exosDeLaSeance = q.list();

        String toOut = "[";
        for (ExerciceDeSeance exo : exosDeLaSeance) {
            toOut += "{ \"idEx\" : \"" + exo.getId().getCodeEx() + "\", \"ordre\":\"" + exo.getOrdre() + "\", ";
            toOut += "\"tmpsEx\" : \"" + exo.getTempsExSc() + "\", \"repsExo\": \"" + exo.getRepsExSc() + "\", ";
            toOut += "\"nbSeries\" : \"" + exo.getNbSeries() + "\", \"adresseImage\" : \"" + exo.getExercice().getRessourceEx() + "\", ";
            toOut += "\"descriptionExo\" : \"" + exo.getExercice().getDescriptionEx() + "\", \"infoSupExo\" : \"" + exo.getExercice().getPrecisionsEx() + "\", ";
            toOut += "\"objExo\" : \"" + exo.getExercice().getObjectifsEx() + "\", \"nomExo\" : \"" + exo.getExercice().getNomEx() + "\"}, ";
        }
        
        toOut = toOut.substring(0, toOut.length() - 2);
        toOut += "]";

        out.print(toOut);

        t.commit();
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
