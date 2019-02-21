package pojo;
// Generated 21 f�vr. 2019 10:27:40 by Hibernate Tools 4.3.1

import java.util.Objects;


/**
 * SeanceAppartenir generated by hbm2java
 */
public class SeanceAppartenir  implements java.io.Serializable {


     private SeanceAppartenirId id;
     private Programme programme;
     private Seance seance;
     private boolean active;
     private boolean fini;

    public SeanceAppartenir() {
    }

    public SeanceAppartenir(SeanceAppartenirId id, Programme programme, Seance seance, boolean active, boolean fini) {
       this.id = id;
       this.programme = programme;
       this.seance = seance;
       this.active = active;
       this.fini = fini;
    }
   
    public SeanceAppartenirId getId() {
        return this.id;
    }
    
    public void setId(SeanceAppartenirId id) {
        this.id = id;
    }
    public Programme getProgramme() {
        return this.programme;
    }
    
    public void setProgramme(Programme programme) {
        this.programme = programme;
    }
    public Seance getSeance() {
        return this.seance;
    }
    
    public void setSeance(Seance seance) {
        this.seance = seance;
    }
    public boolean isActive() {
        return this.active;
    }
    
    public void setActive(boolean active) {
        this.active = active;
    }
    public boolean isFini() {
        return this.fini;
    }
    
    public void setFini(boolean fini) {
        this.fini = fini;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 31 * hash + Objects.hashCode(this.id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final SeanceAppartenir other = (SeanceAppartenir) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }


}


