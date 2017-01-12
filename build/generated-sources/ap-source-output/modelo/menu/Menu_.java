package modelo.menu;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.menu.ItemMenu;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-01-12T08:02:28")
@StaticMetamodel(Menu.class)
public class Menu_ { 

    public static volatile ListAttribute<Menu, ItemMenu> itemsList;
    public static volatile SingularAttribute<Menu, Integer> id;
    public static volatile SingularAttribute<Menu, Integer> orden;
    public static volatile SingularAttribute<Menu, String> nombre;

}