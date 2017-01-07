package ws;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.login.IntentoLogeo;
import modelo.login.LogeoCorrecto;
import modelo.login.Usuario;
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
}
