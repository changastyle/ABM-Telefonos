package ws;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.login.IntentoLogeo;
import modelo.login.LogeoCorrecto;
import modelo.login.Usuario;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class wsLog 
{
    @RequestMapping(value = "findIngresosCorrectos")
    public static List<LogeoCorrecto> findIngresosCorrectos()
    {
        List<LogeoCorrecto> listado = null;
        
        listado = daos.DAOEclipse.findAllByJPQL("SELECT lg FROM LogeoCorrecto lg");
        
        return listado;
    }
    @RequestMapping(value = "findIntentosLogeo")
    public static List<IntentoLogeo> findIntentosLogeo()
    {
        List<IntentoLogeo> listado = null;
        
        listado = daos.DAOEclipse.findAllByJPQL("SELECT il FROM IntentoLogeo il");
        
        return listado;
    }
    
    
}
