package modelo.login;

import com.google.gson.Gson;
import javax.persistence.*;

@Entity @Table(name="usuarios")
public class Usuario
{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nombre;
    private String pass;
    private int permisos;

    public Usuario() {
    }

    public Usuario(String nombre, String pass, int permisos) {
        this.nombre = nombre;
        this.pass = pass;
        this.permisos = permisos;
    }
    
    //GYS:
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getPermisos() {
        return permisos;
    }

    public void setPermisos(int permisos) {
        this.permisos = permisos;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", nombre=" + nombre + ", pass=" + pass + ", permisos=" + permisos + '}';
    }
    public String toJSON()
    {
        String json = "";
        
        json += new Gson().toJson(this);
        
        return json;
    }
}
