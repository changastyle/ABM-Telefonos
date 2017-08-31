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
    public String getTelefonoWPP()
    {
        String aux = telefono;
        String parseado = "";
            
        // 1 - SACO LOS 0 DE ADELANTE
        while(aux.trim().startsWith("0"))
        {
            aux = aux.substring(1, aux.length());
        }
        
        // 2 - UNA VES ENCONTRADO EL 15 LO SACO:
        int posicionDelQuince = aux.lastIndexOf("15");
        //System.out.println(aux + " | pos 15 : " + posicionDelQuince);
        if(posicionDelQuince != -1)
        {
            
            aux = aux.substring(0, (posicionDelQuince) ) + aux.substring( (posicionDelQuince + 2), aux.length() );
            //aux  aux.substring( (posicionDelQuince + 2)  , aux.length());
        }
       
        // 3 - RECORRO SACANDO LOS ESPACIOS AL PEDO:
        parseado = "549";
        for(int i = 0 ; i < aux.length() ; i++)
        {
            char caracter = aux.charAt(i);
            
            if(!Character.isWhitespace(caracter))
            {
                parseado += caracter;
            }
        }
        
        //parseado = "549" + aux;
        //System.out.println("parseado: " + parseado);
        return parseado;
    }
    //</editor-fold>

    @Override
    public String toString() {
        return "Telefono{" + "id=" + id + ", nombre=" + nombre + ", telefono=" + telefono + '}';
    }
    
}
