<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<!-- FONTS:-->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet"><!--font-family: 'Source Sans Pro', sans-serif;-->

<script>
app = angular.module('app',[]).run(function($rootScope) 
{
    //BUSCA CONTENIDO PARA LA BARRA DE MENU DEL BANNER:
    $rootScope.arrMenusBanner = [];
    
    $rootScope.findMenus = function()
    {
        $.ajax(
        {
            url:"../../findMenus",
            beforeSend: function (xhr) 
            {
                console.log("rootScope.findMenus()");
            },
            success: function (resultado, textStatus, jqXHR) 
            {
                $rootScope.arrMenusBanner = resultado;  
                $rootScope.$apply();
            }
        })
    }
    //MOUSEE OVER MENU - BARRA BANNER:
    $rootScope.overMenu = function($event , idMenu)
    {
        //console.log("overMenu: " + idMenu);
        $("#encabezado-menu-banner-" + idMenu).addClass("encabezado-menu-banner-over");          //PONGO CLASE, PARA QUE SE MANTENGA NARANJA MIENTRAS VEO LOS HIJOS:
        
        $(".wrap-listado-menu").each(function(index,element)
        {
            $(element).hide();
        });
        
        $("#wrap-listado-menu-"+ idMenu).show();
        
    }
    $rootScope.leaveMenu = function(idMenu)
    {
        //console.log("leaveMenu " + idMenu);
        $("#encabezado-menu-banner-" + idMenu).removeClass("encabezado-menu-banner-over");       //SACO CLASE, PARA QUE SE MANTENGA NARANJA MIENTRAS VEO LOS HIJOS:
        
        $("#wrap-listado-menu-"+ idMenu).hide();
        
    }
    //UNICO METODO PARA CAMBIAR DE PAGINA VIA ANGULAR:
    $rootScope.redireccionamiento = function(url)
    {
        window.location.href = url;
    }
    //METODO PARA CERRAR SESSION:
    $rootScope.exit = function()
    {
        console.log("cerrando sesion " + JSON.stringify($rootScope.usuarioLogeado.nombre));
        
        $.ajax(
        {
            url:"../../exit",
            success: function (resultado, textStatus, jqXHR) 
            {
                console.log("resultado cerrar sesion: " + resultado);
                
                if(resultado)
                {
                    $rootScope.redireccionamiento("../login/login.jsp");
                }
            }
        });
    }
});
</script>
