/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.util.Set;

/**
 *
 * @author hzahn
 */
public class ProgrammeClient extends Programme{
    
         private Client client;

    public ProgrammeClient() {
    }

    public ProgrammeClient(Client client, String libellePrgrm) {
        super(libellePrgrm);
        this.client = client;
    }

    public ProgrammeClient(ProfilClient profilClient, Client client, String libellePrgrm, Set semaines) {
        super(profilClient, libellePrgrm, semaines);
        this.client = client;
    }

    public Client getClient() {
        return this.client;
    }
    
    public void setClient(Client client) {
        this.client = client;
    }
         
}
