<div class="banner-der banner-parts col-xs-4">
    
    <div class='wrap-botones-banner'>
        
        <!-- BTN LOGIN:-->
        <button class='btn btn-default' ng-show="usuarioLogeado.id == 0" ng-click="redireccionamiento('../login/login.jsp')">
            <span class='glyphicon glyphicon-user'></span> 
            <span class="hidden-xs hidden-sm">LOGIN</span>
        </button>

        <!-- BTN CERRAR SESSION-->
        <button class='btn btn-default' ng-show="usuarioLogeado.id != 0" ng-click="exit()">
            <span class='glyphicon glyphicon-remove'></span> 
            <span class="hidden-xs hidden-sm">Salir</span>
        </button>

        <!-- BTN CUENTA-->
        <button class='btn btn-default' ng-click="redireccionamiento('../cuenta/cuenta.jsp')" ng-show="usuarioLogeado.id != 0"> 
            <span class='glyphicon glyphicon-user'></span> 
            <span class="hidden-xs hidden-sm">{{usuarioLogeado.nombre}}</span>
        </button>
    </div>
</div>
 

<style> 
    .wrap-botones-banner
    {
        //border:solid 2px black;
        margin-top:25px;
        text-align: center;
    }
</style>