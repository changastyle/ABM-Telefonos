<%-- 
    Document   : home
    Created on : 06/01/2017, 17:45:02
    Author     : NICOLAS
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME</title>
        <%@include file="../comun/head.jsp" %>
        <%@include file="../comun/session.jsp" %>
    </head>
    <body ng-app="app" ng-controller="home" ng-init="init()" class="body-comun" ng-cloak>
         <%@include file="../comun/banner.jsp"%>
        <h1>Home!</h1>
        {{usuarioLogeado}}
    </body>
    <script>
    //app = angular.module('app', []);

    app.controller('home', function($scope, $rootScope) 
    {
        //LINEA PARA TENER UN USUARIO LOGEADO EN ANGULAR Y PODER MOSTRAR Y OCULTAR CIERTAS COSAS:
        $rootScope.usuarioLogeado = <%= usrJSON %>;
        
        
        $scope.arrIntentosLogeo = [];
        $scope.init = function()
        {
            $rootScope.findMenus();
        }
    });
    </script>
</html>
