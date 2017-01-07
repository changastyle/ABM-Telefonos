package modelo.menu;

import java.util.List;
import javax.persistence.*;

@Entity @Table(name = "menus")
public class Menu
{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nombre;
    private int orden;
    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy = "menuAsociado")
    private List<ItemMenu> itemsList;

    public Menu()
    {
    }

    public Menu(String nombre, int orden, List<ItemMenu> itemsList)
    {
        this.nombre = nombre;
        this.orden = orden;
        this.itemsList = itemsList;
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

    public int getOrden()
    {
        return orden;
    }

    public void setOrden(int orden)
    {
        this.orden = orden;
    }

    public List<ItemMenu> getItemsList()
    {
        return itemsList;
    }

    public void setItemsList(List<ItemMenu> itemsList)
    {
        this.itemsList = itemsList;
    }

    @Override
    public String toString()
    {
        return "Menu{" + "id=" + id + ", nombre=" + nombre + ", orden=" + orden + '}';
    }
    
}
