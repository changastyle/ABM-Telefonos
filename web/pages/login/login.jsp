<html>
    <head>
        <%@include file="../comun/head.jsp" %>
    </head>
    <body class="body-login" ng-app="app" ng-controller="login" ng-init="init()" ng-cloack>
        
        <div class="wrap-h-login col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0">
            <h3 class="h-login">LOGIN</h3>
        </div>
        
         
        <div class="wrap-login col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0">
           
            <div class="form-group">
                <label>Usuario:</label>
                <input type="text" class="form-control" ng-model="usr">
            </div>
            <div class="form-group">
                <label>Contraseña:</label>
                <input type="password" class="form-control" ng-model="pass">
            </div>
            
            <button class="btn btn-success col-xs-12" ng-click="logearse()">
                <span class="glyphicon glyphicon-user"></span> LOGIN
            </button>
            
        </div>

        <div class="col-xs-12" ng-show="passIncorrecto">
            <div class="wrap-error-login col-xs-4 col-xs-offset-4">
                Usuario ó Password no son correctos..
            </div>
        </div>
        
    </body>
    <script>
    app = angular.module('app', []);

    app.controller('login', function($scope, $http) 
    {
        $scope.logearse = function()
        {
            console.log("logearse");

            $.ajax(
            {
                url:"../../logearse",
                data:
                {
                    "usr": $scope.usr,
                    "pass": $scope.pass
                },
                success: function (resultado, textStatus, jqXHR) 
                {
                    console.log("resultado logearse: " + resultado );

                    if(resultado)
                    {
                        window.location.href = "../home/home.jsp";
                    }
                    else
                    {
                        $scope.passIncorrecto = true;
                    }
                }
            });
        }
    });
    </script>
    <style>
        .body-login
        {
            background-color:#3498db;
        }
        .wrap-h-login
        {
            //border:solid 2px black;
        }
        .wrap-login
        {
            margin-top: 12%;
            background-color:white;
            border-radius: 6px;
            padding:25px;
        }
        .h-login
        {
            text-align: center;
            color:white;
        }
        .wrap-error-login
        {
            background-color:white;
            padding:25px;
            border-radius: 6px;
            margin-top: 25px;
            text-align: center;
            color: #e74c3c;
            font-weight: bolder;
            font-size: 18px;
        }
    </style>
</html>
