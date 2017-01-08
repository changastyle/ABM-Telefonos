package ws;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.login.IntentoLogeo;
import modelo.login.LogeoCorrecto;
import modelo.login.Usuario;
import modelo.menu.ItemMenu;
import modelo.menu.Menu;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class wsMenu 
{
    @RequestMapping(value = "findMenus")
    public static List<Menu> findMenus()
    {
        List<Menu> listado = null;
        
        listado = daos.DAOEclipse.findAllByJPQL("SELECT m FROM Menu m");
        
        return listado;
    }
    
    @RequestMapping(value = "addItemMenu")
    public static boolean addItemMenu(@RequestParam(value = "nombre") String nombre,@RequestParam(value = "url") String url,@RequestParam(value = "fkMenu") int fkMenu )
    {
        boolean add = false;
        
        //TRAIGO EL MENU DE DB:
        Menu menuAsociadoDB = (Menu) daos.DAOEclipse.get(Menu.class, fkMenu);
        
        //CREO UN ITEM Y LO ASOCIO AL MENU DE DB:
        ItemMenu itemMenu = new ItemMenu(nombre, url, menuAsociadoDB);
        
        //GUARDO:
        daos.DAOEclipse.update(itemMenu);
        add = true;
        
        return add;
    }
    
    @RequestMapping(value = "editItemMenu")
    public static boolean editItemMenu(@RequestParam(value = "idItemMenu") int idItemMenu, @RequestParam(value = "nombre") String nombre,@RequestParam(value = "url") String url,@RequestParam(value = "fkMenu") int fkMenu)
    {
        boolean edit = false;
        
        //TRAIGO ITEM MENU DE LA DB:
        ItemMenu itemMenuDB = (ItemMenu) daos.DAOEclipse.get(ItemMenu.class, idItemMenu);
        
        //CAMBIO LOS VALORES DEL ITEM MENU;
        itemMenuDB.setNombre(nombre);
        itemMenuDB.setUrl(url);
        
        //BUSCO EL MENU ASOCIADO: 
        Menu menuAsociadoDB = (Menu) daos.DAOEclipse.get(Menu.class, fkMenu);
        itemMenuDB.setMenuAsociado(menuAsociadoDB);
        
        //LO GUARDO:
        daos.DAOEclipse.update(itemMenuDB);
        edit = true;
        
        return edit;
    }
    
    @RequestMapping(value = "rmItemMenu")
    public static boolean rmItemMenu(@RequestParam(value = "idItemMenu") int idItemMenu)
    {
        boolean rm = false;
        
        //TRAIGO EL ItemMenu DE DB:
        ItemMenu itemMenuDB = (ItemMenu) daos.DAOEclipse.get(ItemMenu.class, idItemMenu);
        
        //LO BORRO:
        daos.DAOEclipse.remove(itemMenuDB);
        rm = true;
        
        return rm;
    }
    
    @RequestMapping(value = "addMenu")
    public static boolean addMenu(@RequestParam(value = "nombre") String nombre,@RequestParam(value = "orden") int orden )
    {
        boolean add = false;
        
        //CREO UN ITEM Y LO ASOCIO AL MENU DE DB:
        Menu menu = new Menu(nombre, orden, new ArrayList<ItemMenu>());
        
        //GUARDO:
        daos.DAOEclipse.update(menu);
        add = true;
        
        return add;
    }
    
    @RequestMapping(value = "editMenu")
    public static boolean editMenu(@RequestParam(value = "idMenu") int idMenu, @RequestParam(value = "nombre") String nombre,@RequestParam(value = "orden") int orden)
    {
        boolean edit = false;
        
        //TRAIGO ITEM MENU DE LA DB:
        Menu menuDB = (Menu) daos.DAOEclipse.get(Menu.class, idMenu);
        
        //CAMBIO LOS VALORES DEL MENU;
        menuDB.setNombre(nombre);
        menuDB.setOrden(orden);
        
        //LO GUARDO:
        daos.DAOEclipse.update(menuDB);
        edit = true;
        
        return edit;
    }
    
    @RequestMapping(value = "rmMenu")
    public static boolean rmMenu(@RequestParam(value = "idMenu") int idMenu)
    {
        boolean rm = false;
        
        //TRAIGO EL MENU DE DB:
        Menu menuDB = (Menu) daos.DAOEclipse.get(Menu.class, idMenu);
        
        //LO BORRO:
        daos.DAOEclipse.remove(menuDB);
        rm = true;
        
        return rm;
    }
    
    
}
