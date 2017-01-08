package modelo.login;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.login.Usuario;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-01-07T16:45:41")
@StaticMetamodel(LogeoCorrecto.class)
public class LogeoCorrecto_ { 

    public static volatile SingularAttribute<LogeoCorrecto, Integer> id;
    public static volatile SingularAttribute<LogeoCorrecto, Usuario> usuarioQueSeLogeo;
    public static volatile SingularAttribute<LogeoCorrecto, String> direccionIP;
    public static volatile SingularAttribute<LogeoCorrecto, Date> timestamp;

}