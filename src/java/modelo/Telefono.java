package modelo;

import javax.persistence.*;

@Entity @Table(name = "telefonos")
public class Telefono 
{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nombre;
    private String telefono;

    public Telefono() {
    }

    public Telefono(String nombre, String telefono) 
    {
        this.nombre = nombre;
        this.telefono = telefono;
    }
    
    //<editor-fold desc="GYS:">

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

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    //</editor-fold>

    @Override
    public String toString() {
        return "Telefono{" + "id=" + id + ", nombre=" + nombre + ", telefono=" + telefono + '}';
    }
    
}
