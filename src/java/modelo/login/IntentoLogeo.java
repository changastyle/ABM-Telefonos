package modelo.login;

import java.util.Date;
import javax.persistence.*;

@Entity @Table(name = "intentologeo")
public class IntentoLogeo
{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nombreUsuarioQueProbo;
    private String passQueProbo;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timestamp;
    private String direccionIP;
    
    public IntentoLogeo()
    {
    }

    public IntentoLogeo(String nombreUsuarioQueProbo, String passQueProbo, Date timestamp, String direccionIP)
    {
        this.nombreUsuarioQueProbo = nombreUsuarioQueProbo;
        this.passQueProbo = passQueProbo;
        this.timestamp = timestamp;
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

    public String getNombreUsuarioQueProbo()
    {
        return nombreUsuarioQueProbo;
    }

    public void setNombreUsuarioQueProbo(String nombreUsuarioQueProbo)
    {
        this.nombreUsuarioQueProbo = nombreUsuarioQueProbo;
    }

    public String getPassQueProbo()
    {
        return passQueProbo;
    }

    public void setPassQueProbo(String passQueProbo)
    {
        this.passQueProbo = passQueProbo;
    }

    public Date getTimestamp()
    {
        return timestamp;
    }

    public void setTimestamp(Date timestamp)
    {
        this.timestamp = timestamp;
    }

    public String getDireccionIP()
    {
        return direccionIP;
    }

    public void setDireccionIP(String direccionIP)
    {
        this.direccionIP = direccionIP;
    }

    @Override
    public String toString()
    {
        return "IntentoLogeo{" + "id=" + id + ", nombreUsuarioQueProbo=" + nombreUsuarioQueProbo + ", passQueProbo=" + passQueProbo + ", timestamp=" + timestamp + ", direccionIP=" + direccionIP + '}';
    }
    

}
