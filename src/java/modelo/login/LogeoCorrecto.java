/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.login;

import java.util.Date;
import javax.persistence.*;

@Entity @Table(name = "logeoscorrectos")
public class LogeoCorrecto
{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timestamp; 
    @OneToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL) @JoinColumn(name = "fkUsuario")
    private Usuario usuarioQueSeLogeo;
    private String direccionIP;

    public LogeoCorrecto()
    {
    }

    public LogeoCorrecto(Date timestamp, Usuario usuarioQueSeLogeo, String direccionIP)
    {
        this.timestamp = timestamp;
        this.usuarioQueSeLogeo = usuarioQueSeLogeo;
        this.direccionIP = direccionIP;
    }
    

    public String getDireccionIP()
    {
        return direccionIP;
    }

    public void setDireccionIP(String direccionIP)
    {
        this.direccionIP = direccionIP;
    }

    
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public Date getTimestamp()
    {
        return timestamp;
    }

    public void setTimestamp(Date timestamp)
    {
        this.timestamp = timestamp;
    }

    public Usuario getUsuarioQueSeLogeo()
    {
        return usuarioQueSeLogeo;
    }

    public void setUsuarioQueSeLogeo(Usuario usuarioQueSeLogeo)
    {
        this.usuarioQueSeLogeo = usuarioQueSeLogeo;
    }

    
    @Override
    public String toString()
    {
        return "LogeoCorrecto{" + "id=" + id + ", timestamp=" + timestamp + ", usuarioQueSeLogeo=" + usuarioQueSeLogeo + ", direccionIP=" + direccionIP + '}';
    }
    
    
    
    
}
