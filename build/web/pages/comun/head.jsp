<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

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
        
        $(".wrap-listado-menu").each(function(index,element)
        {
            $(element).hide();
        });
        
        $("#wrap-listado-menu-"+ idMenu).show();
        
    }
    $rootScope.leaveMenu = function(idMenu)
    {
        //console.log("leaveMenu " + idMenu);
        
        $("#wrap-listado-menu-"+ idMenu).hide();
        
    }
});
</script>
