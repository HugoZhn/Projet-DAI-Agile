package bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author 21400055
 */
public class Bd {

    // Données de connexion.
    private static final String URL = "jdbc:mysql://etu-web2.ut-capitole.fr:3306/db_21400055";
    private static final String LOGIN = "21400055";
    private static final String PASSWORD = "23027K";

    private static Connection cx;

    // Méthodes 
    private static void connexion() throws Exception {

        // Chargement du pilote
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnfe) {
            throw new Exception("Pilote MySql introuvable - " + cnfe.getMessage());
        }

        // Ouverture d'une connexion
        try {
            Bd.cx = DriverManager.getConnection(URL, LOGIN, PASSWORD);
        } catch (SQLException se) {
            throw new Exception("Impossible de se connecter à la BD - " + se.getMessage());
        }
    }

    public static int enregistrerSeanceAppartenir(int CodeSc, int CodePrgrm, int NoSemaine, int Ordre) throws Exception {
        
        int n;

        String sql = "INSERT INTO SeanceAppartenir(CodeSc, CodePrgrm, NoSemaine, Ordre, Active, Fini) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement st;

        try {
            if (Bd.cx == null) {
                Bd.connexion();
            }

            // Ouvrir espace de requête
            st = Bd.cx.prepareStatement(sql);

            // Insertion du message
            st.setString(1, CodeSc + "");
            st.setString(2, CodePrgrm + "");
            st.setString(3, NoSemaine + "");
            st.setString(4, Ordre + "");
            st.setString(5, "0");
            st.setString(6, "0");

            n = st.executeUpdate();

            st.close();

        } catch (SQLException se) {
            throw new Exception("Problème lors de l'insertion - " + se.getMessage());
        } catch (NullPointerException se) {
            throw new Exception("Erreur : connexion non ouverte - " + se.getMessage());
        }

        return n;
    }
        public static int enregistrerExerciceSeance(int CodeEx, int CodeSc, int Temps, int Rep, int NbSeries, int Ordre) throws Exception {
            
        int n;

        String sql = "INSERT INTO ExerciceDeSeance(CodeEx, CodeSc, TempsExSc, RepsExSc, NbSeries, Ordre) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement st;

        try {
            if (Bd.cx == null) {
                Bd.connexion();
            }

            // Ouvrir espace de requête
            st = Bd.cx.prepareStatement(sql);

            // Insertion du message
            st.setString(1, CodeEx + "");
            st.setString(2, CodeSc + "");
            st.setString(3, Temps + "");
            st.setString(4, Rep + "");
            st.setString(5, NbSeries + "");
            st.setString(6, Ordre + "");

            n = st.executeUpdate();

            st.close();

        } catch (SQLException se) {
            throw new Exception("Problème lors de l'insertion - " + se.getMessage());
        } catch (NullPointerException se) {
            throw new Exception("Erreur : connexion non ouverte - " + se.getMessage());
        }

        return n;
        
    }
        public static int supprimerExerciceDeSeance(int idSeance) throws Exception {

        /*Test de connexion */
        if (Bd.cx == null) {
            Bd.connexion();
        }
        /* Requête SQL */
        String sql = "DELETE FROM ExerciceDeSeance WHERE CodeSc = ?"; // le "?" indique que c'est un paramètre qu'on va passer dans cette requête
        /* On déclare nb */
        int nb = 0;
        /* Espace de requête */
        PreparedStatement st;

        try {
            /* Ouvrir l'espace de requête */
            st = Bd.cx.prepareStatement(sql);
            /*Insertion du message */
            st.setString(1, idSeance +"");

            nb = st.executeUpdate(); // on récupère le nombre d'uplet insérer

            /* On ferme l'espace de requête */
            st.close();

        } catch (SQLException sqle) {

            throw new Exception("Problème lors de la suppression - " + sqle.getMessage());

        }

        return nb;
    }
            /* Programme principal */
    public static void main(String[] s) {
        try {
            Bd.connexion();
            
            int CodeEx = 12;
            int CodeSc = 2;
            int Temps = 1; 
            int Rep = 1;
            int NbSeries = 1;
            int Ordre = 1;
            Bd.enregistrerExerciceSeance( CodeEx,  CodeSc,  Temps,  Rep,  NbSeries, Ordre);

        } catch (Exception ex) {
            System.out.println(ex.getMessage());

        }
    }
}
