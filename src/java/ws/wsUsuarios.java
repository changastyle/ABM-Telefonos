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
public class wsUsuarios 
{
    @RequestMapping(value = "findUsuarios")
    public static List<Usuario> findUsuarios()
    {
        List<Usuario> listadoUsuarios = null;
        
        listadoUsuarios = daos.DAOEclipse.findAllByJPQL("SELECT u FROM Usuario u");
        
        return listadoUsuarios;
    }
    
    @RequestMapping(value = "logearse")
    public static boolean logearse(@RequestParam(value = "usr") String usr,@RequestParam(value = "pass") String pass,HttpServletRequest request, HttpServletResponse response)
    {
        boolean seLogeo = false;
        
        String direccionIPUsuario = request.getRemoteAddr();
        System.out.println("logeandose: " + usr + " | " + pass + " | " + request.getRemoteAddr() );
        
        //BUSCO UN USUARIO QUE COINCIDA NOMBRE Y PASSWORD
        String jpqlBuscaPorNombreDeUsuarioYPass = "SELECT u FROM Usuario u WHERE lower(u.nombre) = lower(\"" + usr + "\") AND u.pass = \"" + pass + "\"";
        
        List<Usuario> listaFromDB = daos.DAOEclipse.findAllByJPQL(jpqlBuscaPorNombreDeUsuarioYPass);
        
        //SI TENGO ALMENOS UN USUARIO QUE CONSIDA USR Y PASS, ENTONCES LO SESIONO Y REGISTRO EL LOGIN EN DB:
        if(listaFromDB.size() > 0)
        {
            seLogeo = true;
            
            Usuario usuario  = listaFromDB.get(0);
            
            request.getSession().setAttribute("usuario", usuario.toJSON());
            
            //REPORTO QUE ALGUIEN SE LOGEO CORRECTAMENTE:
            LogeoCorrecto logeoCorrecto = new LogeoCorrecto(new Date(), usuario,direccionIPUsuario);
            daos.DAOEclipse.save(logeoCorrecto);
        }
        else
        {
            //REPORTO QUE ALGUIEN SE INTENTO LOGEAR Y NO PUDO:
            IntentoLogeo intentoLogeo = new IntentoLogeo(usr, pass, new Date(),direccionIPUsuario);
            daos.DAOEclipse.save(intentoLogeo);
        }
        
        return seLogeo;
    }
    
}
