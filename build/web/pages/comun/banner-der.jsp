<div class="banner-der banner-parts col-xs-2">
    
    <div class='wrap-botones-banner'>
        
        <!-- BTN LOGIN:-->
        <button class='btn btn-default' ng-show="usuarioLogeado.id == 0" ng-click="redireccionamiento('../login/login.jsp')">
            <span class='glyphicon glyphicon-user'></span> 
            <span class="hidden-xs hidden-sm">LOGIN</span>
        </button>

        <!-- BTN CERRAR SESSION
        <button class='btn btn-default' ng-show="usuarioLogeado.id != 0" ng-click="exit()">
            <span class='glyphicon glyphicon-remove'></span> 
            <span class="hidden-xs hidden-sm">Salir</span>
        </button>-->

        <!-- BTN CUENTA
        <button class='btn btn-default' ng-click="redireccionamiento('../cuenta/cuenta.jsp')" ng-show="usuarioLogeado.id != 0"> 
            <span class='glyphicon glyphicon-user'></span> 
            <span class="hidden-xs hidden-sm">{{usuarioLogeado.nombre}}</span>
        </button>-->
        
        
        <!-- DROPDOWN USUARIO REEMPLAZA 2 BOTONES ANTERIORES: -->
        <div class="dropdown">
            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                <span class='glyphicon glyphicon-user'></span>
                <span class="hidden-xs hidden-sm">{{usuarioLogeado.nombre}}</span>
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu pull-right" aria-labelledby="dropdownMenu1">
                <li>
                    <!-- PERFIL-->
                    <a href="#" ng-click="redireccionamiento('../cuenta/cuenta.jsp')">Mi Perfil</a>
                </li>
                <li>
                    <!-- CARRITO -->
                    <a href="#" ng-click="redireccionamiento('../cuenta/cuenta.jsp')">Mi Carrito</a>
                </li>
                <li>
                    <!-- CONFIGURACION:-->
                    <a href="#" ng-click="redireccionamiento('../cuenta/cuenta.jsp')">Configuracion</a>
                </li>
                <li role="separator" class="divider"></li>
                <li>
                    <!-- CERRAR SESSION-->
                    <a href="#" ng-click="exit()">Cerrar Sesion</a>
                </li>
            </ul>
        </div>
    </div>
</div>
 

<style> 
    .wrap-botones-banner
    {
        //border:solid 2px black;
        margin-top:25px;
        text-align: right;
    }
    
</style>