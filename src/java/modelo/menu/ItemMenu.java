package modelo.menu;


import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.*;

@Entity @Table(name = "itemsmenu")
public class ItemMenu
{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nombre;
    private String url;
    @ManyToOne() @JoinColumn(name = "fkMenu") @JsonIgnore
    private Menu menuAsociado;

    public ItemMenu()
    {
    }

    public ItemMenu(String nombre, String url, Menu menuAsociado)
    {
        this.nombre = nombre;
        this.url = url;
        this.menuAsociado = menuAsociado;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getUrl()
    {
        return url;
    }

    public void setUrl(String url)
    {
        this.url = url;
    }

    public Menu getMenuAsociado()
    {
        return menuAsociado;
    }

    public void setMenuAsociado(Menu menuAsociado)
    {
        this.menuAsociado = menuAsociado;
    }
    
    
    
}
