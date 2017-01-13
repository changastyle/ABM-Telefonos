<html>
    <head>
        <%@include file="../comun/head.jsp" %>
        <%@include file="../comun/session.jsp" %>
        <title>Mi Cuenta</title>
    </head>
    <body ng-app="app" ng-controller="cuenta" ng-init="init()" ng-cloack class="body-comun">
        
        <%@include file="../comun/banner.jsp"%>
        
        <h3>Cambiar Password</h3>
        <div class="container">
            <div class="form-group">
                <label>Introducir nueva contraseña</label>
                <input type="password" ng-model="nvaPass" class="form-control">
            </div>
            <div class="form-group">
                <label>Repetir nueva contraseña</label>
                <input type="password" ng-model="nvaPass2" class="form-control">
            </div>  
            <button class="btn btn-success col-xs-12" ng-click="cambiarPass()">
                <span class="glyphicon glyphicon-pencil"></span> 
                CAMBIAR PASSWORD
            </button>
            
            <div class="notificacion-cuenta col-xs-12" ng-show="contrasenaFueCambiada"><!---->
                Tu contraseña fue cambiada con exito
                <br>
                <br>
                <button class="btn btn-default" ng-click="redireccionamiento('../home/home.jsp')">
                    <span class="glyphicon glyphicon-home"></span> 
                    VOLVER AL HOME
                </button>
            </div>
            <div class="notificacion-cuenta-error col-xs-12" ng-show="contrasenaNOFueCambiada" ><!---->
                Tu contraseña NO pudo ser cambiada
            </div>
            
        </div>
    </body>
    <script>
    //app = angular.module('app', []);

    app.controller('cuenta', function($scope, $rootScope) 
    {
        //LINEA PARA TENER UN USUARIO LOGEADO EN ANGULAR Y PODER MOSTRAR Y OCULTAR CIERTAS COSAS:
        $rootScope.usuarioLogeado = <%= usrJSON %>;
        
        $scope.init = function()
        {
            $rootScope.findMenus();
        }
        $scope.cambiarPass = function()
        {
            //COMPRUEBO SI LAS PASS SON DISTINTAS
            if($scope.nvaPass != $scope.nvaPass2)
            {
                alert("ambas password deben coincidir")
            }
            else
            {
                $.ajax(
                {
                    url: "../../cambiarPass",
                    data: 
                    {
                        "usuario": JSON.stringify($scope.usuarioLogeado),
                        "pass": $scope.nvaPass
                    },
                    success: function (resultado, textStatus, jqXHR) 
                    {
                        console.log("resultado cambiar pass " + resultado);
                        
                        if(resultado)
                        {
                            $scope.contrasenaFueCambiada = true;
                        }
                        else
                        {
                            $scope.contrasenaNOFueCambiada = true;
                        }
                        $scope.$apply();
                    }
                });
            }
            
        }
    });
    </script>
    <style>
    .notificacion-cuenta
    {
        background-color:white;
        border-radius: 6px;
        text-align: center;
        margin-top: 25px;
        margin-bottom: 25px;
        padding:25px;
        color:#2ecc71;
    }
    .notificacion-cuenta-error
    {
        background-color:white;
        border-radius: 6px;
        text-align: center;
        margin-bottom: 25px;
        padding:25px;
        color:#c0392b;
    }
    </style>
</html>