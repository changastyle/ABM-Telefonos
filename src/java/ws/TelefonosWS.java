package ws;

import java.util.ArrayList;
import java.util.List;
import modelo.Telefono;
import org.springframework.web.bind.annotation.*;

@RestController 
public class TelefonosWS 
{
    @RequestMapping(value = "findTelefonos")
    public static List<Telefono> findTelefonos()
    {
        List<Telefono> listadoTelefonos = new ArrayList<Telefono>();
        
        String jpql = "SELECT t FROM Telefono t";
        
        listadoTelefonos = dao.DAOEclipse.findAllByJPQL(jpql);
        
        return listadoTelefonos;
    }
    @RequestMapping(value = "addTelefono")
    public static boolean addTelefono( @RequestParam(value = "nombre") String nombre , @RequestParam(value = "telefono") String telefono)
    {
        boolean agrego = false;
        
        if(nombre != null && telefono != null)
        {
            nombre = Encoding.fix(nombre);
            Telefono nuevoTelefono = new Telefono(nombre, telefono);
            agrego = dao.DAOEclipse.update(nuevoTelefono);
        }
        
        return agrego;
    }
    @RequestMapping(value = "editTelefono")
    public static boolean editTelefono( @RequestParam(value = "id",defaultValue = "-1") int id, @RequestParam(value = "nombre") String nombre , @RequestParam(value = "telefono") String telefono)
    {
        boolean modifico = false;
        
        if(id != -1)
        {
            Telefono telefonoDB = (Telefono) dao.DAOEclipse.get(Telefono.class, id);
            
            if(telefonoDB != null)
            {
                if(nombre != null && telefono != null)
                {
                    nombre = Encoding.fix(nombre);
                    telefonoDB.setNombre(nombre);
                    telefonoDB.setTelefono(telefono);
                    modifico = dao.DAOEclipse.update(telefonoDB);
                }
            }
        }
       
        
        return modifico;
    }
    @RequestMapping(value = "rmTelefono")
    public static boolean rmTelefono(@RequestParam(value = "id",defaultValue = "-1") int id)
    {
        boolean quito = false;
        
        if(id != -1)
        {
            Telefono telefonoDB = (Telefono) dao.DAOEclipse.get(Telefono.class, id);
            
            if(telefonoDB != null)
            {
                quito = dao.DAOEclipse.remove(telefonoDB);
            }
        }
        
        
        return quito;
    }
    
}
