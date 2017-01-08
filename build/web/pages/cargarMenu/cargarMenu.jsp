
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cargar Menu</title>
        <%@include file="../comun/head.jsp" %>
        <%@include file="../comun/session.jsp" %>
    </head>
     <body ng-app="app" ng-controller="cargarMenu" ng-init="init()" ng-cloack class="body-comun">
         
        <%@include file="../comun/banner.jsp"%>
        
        <h1 class="h-lindo">Cargar Menu!</h1>
        
        <div class="container">
            
            <!-- IZQ CARGAR MENU:-->
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="padding-left:0px;">
                <div class="cargar-menu-izq col-xs-12 partes-cargar-menu">

                    <!-- LISTADO ENCABEZADOS MENU:-->
                    <div class="wrap-item-encabezado-menu col-xs-12" ng-repeat="menu in arrMenusBanner">
                        
                        <!-- NOMBRE MENU:-->
                        <div class="item-encabezado-menu col-xs-9 col-sm-9 col-md-9 col-lg-10"  ng-click="selectMenu(menu,$event)">
                            {{menu.nombre}}
                        </div>
                        
                        <!-- LAPIZ y TACHO MENU:-->
                        <div class="wrap-btn-edit-encabezado-menu col-xs-3 col-sm-3 col-md-3 col-lg-2">
                            <button class="btn btn-default" ng-click="openEditMenu(menu)">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </button>
                            <button class="btn btn-danger" ng-click="rmMenu(menu)">
                                <span class="glyphicon glyphicon-trash"></span>
                            </button>
                        </div>
                        
                    </div>

                </div>
            </div>
            
            <!-- DER CARGAR MENU:-->
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="padding-right:0px;">
                <div class="cargar-menu-der col-xs-12 partes-cargar-menu">

                    <!-- LISTADO SUB MENUS:-->
                    <div class="item-sub-menu" ng-repeat="submenu in menuEditando.itemsList" ng-click="selectSubMenu(submenu,$event)">
                        {{submenu.nombre}}
                    </div>
                </div>
            </div>
            
            <div class="col-xs-12 wrap-botonera-add">
                <!-- BOTONERA ADD:-->
                <div class="botonera-add">

                    <!-- BTN ADD MENU:-->
                    <div class="col-xs-6" style="padding-left: 0px;">
                        <button class="btn btn-success col-xs-12" ng-click='openAddMenu()'>
                            <span class="glyphicon glyphicon-plus"></span> 
                            ADD MENU
                        </button>
                    </div>

                    <!-- BTN ADD ITEM MENU-->
                    <div class="col-xs-6" style="padding-right: 0px;" >
                        <button class="btn btn-success col-xs-12" ng-disabled="menuEditando.id == null" ng-click='openItemMenu()'>
                        <span class="glyphicon glyphicon-plus"></span> 
                        ADD ITEM MENU
                    </button>
                    </div>
                </div>
            </div>
    </div>
        
        {{menuEditando}}
        <%@include file="modal-menu.jsp" %>
        <%@include file="modal-item-menu.jsp" %>
    </body>
    <script>
    //app = angular.module('app', []);

    app.controller('cargarMenu', function($scope, $rootScope) 
    {
        //LINEA PARA TENER UN USUARIO LOGEADO EN ANGULAR Y PODER MOSTRAR Y OCULTAR CIERTAS COSAS:
        $rootScope.usuarioLogeado = <%= usrJSON %>;
        
        $scope.menuEditando = {};
        $scope.subMenuEditando = {};
        
        $scope.modoEdicionMenu = false;
        $scope.modoEdicionItemMenu = false;
        
        $scope.init = function()
        {
            $rootScope.findMenus();
        }
        $scope.selectMenu = function(menu,$event)
        {
            $scope.menuEditando = menu;
            
            console.log($event.target);
            
            //DESPINTO TODOS:
            $(".item-encabezado-menu").each(function(index,element)
            {
                //$(element).removeClass("item-encabezado-menu-selected");
                $($event.target).css("background-color","#f39c12");
            });
            
            //PINTO EL QUE NECESITO:
            //$($event.target).addClass("item-encabezado-menu-selected");
            $($event.target).css("background-color","#16a085");
        }
        $scope.selectSubMenu = function(subMenu,$event)
        {
            $scope.subMenuEditando = subMenu;
            
            $(".wrap-sub-menu-editando").show();
            
            //DESPINTO TODOS:
            $(".item-sub-menu").each(function(index,element)
            {
                $(element).removeClass("item-sub-menu-selected");
            });
            
            //PINTO EL QUE NECESITO:
            $($event.target).addClass("item-sub-menu-selected");
        }
        $scope.cleanSubMenuEditando = function()
        {
            $scope.subMenuEditando = {};
            //$scope.$apply();
            
            $(".wrap-sub-menu-editando").hide();
            
            //DESPINTO TODOS:
            $(".item-sub-menu").each(function(index,element)
            {
                $(element).removeClass("item-sub-menu-selected");
            });
        }
        $scope.openEditMenu = function(menu)
        {
            $scope.modoEdicionMenu = true;
            $scope.menuEditando = menu;
            
            $("#modal-add-menu").modal();
        }
        $scope.closeModalMenu = function()
        {
            $scope.modoEdicionMenu = false;
            $("#modal-add-menu").modal('hide');
        }
        $scope.editMenu = function()
        {
            $.ajax(
            {
               url:"../../editMenu",
               data:
               {
                   "idMenu": $scope.menuEditando.id,
                   "nombre": $scope.menuEditando.nombre,
                   "orden":  $scope.menuEditando.orden
               },success: function (resultado, textStatus, jqXHR)
               {
                    console.log("resultado edit menu: " + resultado);
                    
                    if(resultado)
                    {
                        window.location.reload();
                    }
               }
            });
        }
        $scope.openAddMenu = function()
        {
            $scope.modoEdicionMenu = false;
            $scope.menuEditando = {};
            
            $("#modal-add-menu").modal();
        }
        $scope.addMenu = function()
        {
            $.ajax(
            {
               url:"../../addMenu",
               data:
               {
                   "nombre": $scope.menuEditando.nombre,
                   "orden":  $scope.menuEditando.orden
               },success: function (resultado, textStatus, jqXHR)
               {
                    console.log("resultado add menu: " + resultado);
                    
                    if(resultado)
                    {
                        window.location.reload();
                    }
               }
            });
        }
        $scope.rmMenu = function(menu)
        {
            $scope.menuEditando = menu;
            
            if(confirm("delete " +  menu.nombre + " y sus " + menu.itemsList.length + " hijos ??"))
            {
                $.ajax(
                {
                   url:"../../rmMenu",
                   data:
                   {
                       "idMenu": $scope.menuEditando.id
                   },success: function (resultado, textStatus, jqXHR)
                   {
                        console.log("resultado rm menu: " + resultado);
                        
                        if(resultado)
                        {
                            window.location.reload();
                        }
                   }
                });
            }
        }
        
        
        //ITEM MENU ABM:
        $scope.openItemMenu = function(itemMenu)
        {
            $scope.modoEdicionItemMenu = true;
            $scope.subMenuEditando = itemMenu;
            
            $("#modal-item-menu").modal();
        }
        $scope.closeModalItemMenu = function()
        {
            $scope.modoEdicionItemMenu = false;
            $("#modal-item-menu").modal('hide');
        }
        $scope.addItemMenu = function()
        {
            $.ajax(
            {
               url:"../../addItemMenu",
               data:
               {
                   "nombre": $scope.subMenuEditando.nombre,
                   "url":  $scope.subMenuEditando.url,
                   "fkMenu": $scope.menuEditando.id
               },success: function (resultado, textStatus, jqXHR)
               {
                    console.log("resultado add item menu: " + resultado);
                    
                    if(resultado)
                    {
                        window.location.reload();
                    }
               }
            });
        }
        $scope.rmItemMenu = function(menuItem)
        {
            $scope.menuEditando = menu;
            
            if(confirm("delete " +  menuItem.nombre + "??"))
            {
                $.ajax(
                {
                   url:"../../rmItemMenu",
                   data:
                   {
                       "idMenu": $scope.menuEditando.id
                   },success: function (resultado, textStatus, jqXHR)
                   {
                        console.log("resultado rm menu: " + resultado);
                        
                        if(resultado)
                        {
                            window.location.reload();
                        }
                   }
                });
            }
        }
    });
    </script>
    <style>
    .partes-cargar-menu
    {
        height: 300px;
        background-color:white;
        border-radius: 6px;
    }
    
    .item-encabezado-menu-selected
    {
        background-color: #16a085;
    }
    .item-sub-menu
    {
        text-align: center;
        background-color:#f39c12;
        color:white;
        padding:12px;
        margin-top:8px;
        cursor:pointer;
        font-weight: bold;
    }
    .item-sub-menu-selected
    {
        background-color: #16a085;
    }
    .wrap-sub-menu-editando{
        background-color:white;
        border-radius: 6px;
        padding: 12px;
        margin-top: 25px;
    }
    .wrap-botonera-add{
        background-color:white;
        border-radius: 6px;
        padding: 12px;
        margin-top: 25px;
    }
    
    .h-lindo
    {
        text-align: center;
        padding:12px;
        font-family: font-family: 'Source Sans Pro', sans-serif;
    }
    
    .nombre-sub-menu-editando
    {
        text-align: center;
        font-weight: bolder;
        font-size: 22px;
    }
    .btn-clean-sub-menu-editando{
        float: right;
        
    }
    .wrap-item-encabezado-menu
    {
       // border:solid 2px black;
        margin-top:8px;
        padding:0px;
        border:solid 1px #3c3c3c;
        border-radius: 6px;
        overflow: hidden;
    }
    .item-encabezado-menu
    {
        text-align: center;
        background-color:#f39c12;
        color:white;
        padding:12px;
        cursor:pointer;
        font-weight: bold;
        display: inline-block;
        
    }
    .wrap-btn-edit-encabezado-menu
    {
        display: inline-block;
        background-color:white;
        padding:0px;
        padding-top:4px;
        text-align: center;
    }
    
    </style>
</html>
