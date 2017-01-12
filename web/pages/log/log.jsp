<%-- 
    Document   : log
    Created on : 06/01/2017, 20:37:41
    Author     : NICOLAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOG</title>
        <%@include file="../comun/head.jsp" %>
        <%@include file="../comun/session.jsp" %>
    </head>
    <body ng-app="app" ng-controller="log" ng-init="init()" class="body-comun" ng-cloak>
        
        <%@include file="../comun/banner.jsp"%>
        
        <h1>LOG</h1>
        
        
        <!-- INGRESOS FALLIDOS:-->
        <h1>Ingresos Fallidos:</h1>
        <table class="table">
            <thead>
                <th>Timestamp</th>
                <th>Usuario que probo</th>
                <th>Pass que probo</th>
                <th>Direccion IP</th>
            </thead>
            <tbody>
                <tr ng-repeat="itemIntentosLogeo in arrIntentosLogeo">
                    <td>{{itemIntentosLogeo.timestamp | date: "dd/MM/yyyy - HH:mm:ss"}}</td>
                    <td>{{itemIntentosLogeo.nombreUsuarioQueProbo}}</td>
                    <td>{{itemIntentosLogeo.passQueProbo}}</td>
                    <td>{{itemIntentosLogeo.direccionIP}}</td>
                </tr>
            </tbody>
        </table>
        
        <!-- INGRESOS CORRECTOS: -->
        <h1>Ingresos Correctos</h1>
        <table class="table">
            <thead>
                <th>Timestamp</th>
                <th>Usuario </th>
                <th>Permisos</th>
                <th>Direccion IP</th>
            </thead>
            <tbody>
                <tr ng-repeat="itemIngresosCorrecto in arrIngresosCorrectos">
                    <td>{{itemIngresosCorrecto.timestamp | date: "dd/MM/yyyy - HH:mm:ss"}}</td>
                    <td>{{itemIngresosCorrecto.usuarioQueSeLogeo.nombre}}</td>
                    <td>{{itemIngresosCorrecto.usuarioQueSeLogeo.permisos}}</td>
                    <td>{{itemIngresosCorrecto.direccionIP}}</td>
                </tr>
            </tbody>
        </table>
    </body>
    
    <script>
    //app = angular.module('app', []);

    app.controller('log', function($scope, $rootScope) 
    {
        //LINEA PARA TENER UN USUARIO LOGEADO EN ANGULAR Y PODER MOSTRAR Y OCULTAR CIERTAS COSAS:
        $scope.usuarioLogeado = <%= usrJSON %>;
        
        $scope.arrIntentosLogeo = [];
        $scope.init = function()
        {
            
            $scope.findIntentosLogeo();
            $scope.findIngresosCorrectos(); //APLICA FIND INGRESOS CORRECTOS:
            $rootScope.findMenus();
        }
        $scope.findIntentosLogeo = function()
        {
            console.log("findIntentosLogeo");

            $.ajax(
            {
                url:"../../findIntentosLogeo",
                success: function (resultado, textStatus, jqXHR) 
                {
                    console.log("resultado logearse: " + resultado );

                    $scope.arrIntentosLogeo = resultado;
                    //NO APLICO, APLICO DESPUES.
                }
            });
        }
        $scope.findIngresosCorrectos = function()
        {
            console.log("findIngresosCorrectos");

            $.ajax(
            {
                url:"../../findIngresosCorrectos",
                success: function (resultado, textStatus, jqXHR) 
                {
                    console.log("resultado logearse: " + resultado );

                    $scope.arrIngresosCorrectos = resultado;
                    //NO APLICO, APLICO DESPUES.
                    $scope.$apply();
                }
            });
        }
    });
    </script>
    
    <style>
        .table
        {
            text-align: center;
        }
        .table th
        {
            text-align: center;
        }
    </style>
</html>
