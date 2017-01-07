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
    <body ng-app="app" ng-controller="home" ng-init="init()" ng-cloack class="body-comun">
         <%@include file="../comun/banner.jsp"%>
        <h1>Home!</h1>
        
    </body>
    <script>
    //app = angular.module('app', []);

    app.controller('home', function($scope, $rootScope) 
    {
        $scope.arrIntentosLogeo = [];
        $scope.init = function()
        {
            $rootScope.findMenus();
        }
    });
    </script>
</html>
