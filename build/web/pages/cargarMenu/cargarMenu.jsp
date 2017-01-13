
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cargar Menu</title>
        <%@include file="../comun/head.jsp" %>
        <%@include file="../comun/session.jsp" %>
    </head>
    <body ng-app="app" ng-controller="cargarMenu" ng-init="init()" class="body-comun" ng-cloak>
         
        <%@include file="../comun/banner.jsp"%>
        
        <h1 class="h-lindo">Cargar Menu!</h1>
        
        <div class="container">
            
            <%@include  file="menusIzq.jsp" %>
            
            <%@include file="subMenusDer.jsp" %>
            
            <%@include file="botonera-add-menu-and-menuItem-bottom.jsp" %>
            
            <!-- INFO EDICION:-->
            <div class="info-edicion col-xs-12">
                <label class="labels-info-edicion">Menu Seleccionado: </label>{{menuEditando}}
                <br>
                <label class="labels-info-edicion">Sub Menu Seleccionado: </label>{{subMenuEditando}}
                <br>
                <label class="labels-info-edicion">Modo Edicion Menu : </label>{{modoEdicionMenu}}
                <br>
                <label class="labels-info-edicion">Modo Edicion SUB Menu : </label>{{modoEdicionItemMenu}}
            </div>
    </div>
        
            
        
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
        $scope.selectMenu = function(menu)
        {
            $scope.menuEditando = menu;
            
            //console.log($event.target);
            console.log(menu.id);
            
            //DESPINTO TODOS:
            $(".wrap-item-encabezado-menu-selected").each(function(index,element)
            {
                $(element).removeClass("wrap-item-encabezado-menu-selected");
                $(element).addClass("wrap-item-encabezado-menu");
            });
            
            //PINTO EL QUE NECESITO:
            $("#wrap-item-encabezado-menu-" + menu.id).removeClass("wrap-item-encabezado-menu");
            $("#wrap-item-encabezado-menu-" + menu.id).addClass("wrap-item-encabezado-menu-selected");
        }
        $scope.selectSubMenu = function(subMenu)
        {
            $scope.subMenuEditando = subMenu;
            
            $(".wrap-sub-menu-editando").show();
            
            //DESPINTO TODOS:
            $(".item-submenus-selected").each(function(index,element)
            {
                $(element).removeClass("item-submenus-selected");
                $(element).addClass("item-submenus");
            });
            
            //PINTO EL QUE NECESITO:
            $("#item-submenus-" + subMenu.id).removeClass("item-submenus");
            $("#item-submenus-" + subMenu.id).addClass("item-submenus-selected");
            
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
        $scope.openEditSubMenu = function(subMenu)
        {
            $scope.modoEdicionItemMenu = true;
            $scope.subMenuEditando = subMenu;
            
            $("#modal-item-menu").modal();
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
            //$scope.modoEdicionItemMenu = true;
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
        $scope.editItemMenu  = function()
        {
            $.ajax(
            {
               url:"../../editItemMenu",
               data:
               {
                   "idItemMenu": $scope.subMenuEditando.id,
                   "nombre": $scope.subMenuEditando.nombre,
                   "url":  $scope.subMenuEditando.url,
                   "fkMenu": $scope.menuEditando.id
               },success: function (resultado, textStatus, jqXHR)
               {
                    console.log("resultado edit item menu: " + resultado);
                    
                    if(resultado)
                    {
                        window.location.reload();
                    }
               }
            });
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
    /*.wrap-item-sub-menu
    {
        text-align: center;
        background-color:#f39c12;
        color:white;
        padding:12px;
        margin-top:8px;
        cursor:pointer;
        font-weight: bold;
    }*/
    .item-sub-menu-selected
    {
        background-color: #16a085;
    }
    /*.wrap-sub-menu-editando{
        background-color:white;
        border-radius: 6px;
        padding: 12px;
        margin-top: 25px;
    }*/
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
    
   /* .nombre-sub-menu-editando
    {
        text-align: center;
        font-weight: bolder;
        font-size: 22px;
    }*/
    .btn-clean-sub-menu-editando{
        float: right;
        
    }
    .wrap-item-encabezado-menu
    {
       // border:solid 2px black;
        margin-top:8px;
        padding:0px;
        background-color:#f39c12;
        border-radius: 6px;
        overflow: hidden;
    }
    .wrap-item-encabezado-menu-selected
    {
       // border:solid 2px black;
        margin-top:8px;
        padding:0px;
        background-color: var(--rojo);
        border-radius: 6px;
        overflow: hidden;
    }
    .item-encabezado-menu
    {
        text-align: center;
        //background-color:#f39c12;
        color:white;
        padding:12px;
        cursor:pointer;
        font-weight: bold;
        display: inline-block;
        
    }
    /*.item-encabezado-sub-menu
    {
        text-align: center;
        //background-color:#f39c12;
        color:white;
        padding:12px;
        cursor:pointer;
        font-weight: bold;
        display: inline-block;
        
    }*/
    .wrap-btn-edit-encabezado-menu
    {
        display: inline-block;
        //background-color:white;
        padding:0px;
        padding-top:6px;
        padding-bottom:4px;
        text-align: center;
    }
    .info-edicion
    {
        border-radius: 6px;
        border:solid 1px var(--gris);
        background-color:var(--blanco);
        margin-top:25px;
    }
    .labels-info-edicion
    {
        font-weight: bold;
    }
    </style>
</html>
