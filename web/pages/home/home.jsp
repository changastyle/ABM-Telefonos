<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Telefonos Utiles</title>
        <%@include file="../comun/head.jsp" %>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <style>
            .banner
            {
                background-color:black;
                height: 50px;
            }
            h3
            {
                background-color: #2DB2A4;
                color:white;
                padding:25px;
                text-align: center;
                margin-bottom:50px;
            }
            .input-busqueda
            {
                
            }
            .item-telefono
            {
                cursor:pointer;
            }
            .btn-agregar-telefono , .btn-agregar-telefono:active , .btn-agregar-telefono:focus , .btn-agregar-telefono:hover
            {
                background-color: #2DB2A4;
                color:white;
                padding:12px;
                text-align: center;
                font-size: 18px;
                font-weight: bold;
            }
            .btn-editar-telefono , .btn-editar-telefono:active , .btn-editar-telefono:focus , .btn-editar-telefono:hover
            {
                color:white;
                padding:12px;
                text-align: center;
                font-size: 18px;
                font-weight: bold;
            }
            body
            {
                
            }
            .contenedor
            {
                background-color:white;
                padding-bottom: 12px;
                
            }
            .contenedor-padre
            {
                background-color:white;
                background-repeat: no-repeat;
                padding-top:50px;
                padding-bottom:50px;
            }
            .parallax {
                /* Set a specific height */
                min-height: 600px; 

                /* Create the parallax scrolling effect */
                background-attachment: fixed;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            tr ,th 
            {
                text-align: center;
                transition: 0.5s;
            }
            tbody tr:hover
            {
                transform: scale(1.07);
                transition: 0.5s;
                color:white;
                background-color:#2DB2A4;
            }
            .caption {
            position: absolute;
            left: 0;
            top: 50%;
            width: 33%;
            left:33%;
            text-align: center;
            color: #000;
            background-color:rgba(0,0,0,0.45);
            color:white;
            font-weight: bold;
            font-size: 36px;
            
          }
          .table td{
              font-size: 18px;
          }
          *
          {
             font-family: 'Raleway', sans-serif; 
          }

          .caption span.border {
            background-color: #111;
            color: #fff;
            padding: 18px;
            font-size: 25px;
            letter-spacing: 10px;
          }
        </style>
    </head>
    <body ng-app="app" ng-controller="home" ng-init="init()" class="body-comun " ng-cloak>
        
        <!--<div class="banner col-xs-12">banner</div>-->
        
        
        <!-- INPUT BUSQUEDA:-->
        <div class="parallax col-xs-12" style="background-image: url('../res/img/bg.jpg');">
            
            <div class="caption col-xs-4">
                <span class="glyphicon glyphicon-earphone"></span>
                TELEFONOS
            </div>
            
        </div>
        
        <div class="contenedor-padre col-xs-12">
            <div class="contenedor col-xs-8 col-xs-offset-2">
                <!-- TABLA DE TELEFONOS:-->
                <h3>Listado de Telefonos:</h3>
                <div class="input-busqueda row" style="margin-bottom:25px;">
                    <div class="form-group">
                        <div class="col-xs-10" >
                            <input type="text" class="form-control " placeholder="Busca un telefono rapidamente" ng-model="busqueda">
                        </div>
                        <div class="col-xs-2" style="text-align: center;">
                            <button type="submit" class="btn btn-default col-xs-12">
                                <span class="glyphicon glyphicon-search"></span>
                                Buscar
                            </button>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <th ng-click="ordenarPor('telefono.id')" style="cursor:pointer">
                                # ID
                            </th>
                            <th ng-click="ordenarPor('telefono.nombre')" style="cursor:pointer">
                                <span class="glyphicon glyphicon-user"></span>
                                Nombre
                            </th>
                            <th ng-click="ordenarPor('telefono.nombre')" style="cursor:pointer" >
                                <span class="glyphicon glyphicon-earphone"></span>
                                <span>Telefono</span>
                            </th>
                            <th>Quitar</th>
                        </thead>
                        <tbody>
                            <tr ng-repeat="telefono in arrTelefonos | filter: busqueda | orderBy : orden : deReversaMami" class="item-telefono">
                                <td ng-click="seleccionarTelefono(telefono)" data-toggle="tooltip" title="Editar">{{telefono.id}}</td>
                                <td ng-click="seleccionarTelefono(telefono)">{{telefono.nombre}}</td>
                                <td ng-click="seleccionarTelefono(telefono)">{{telefono.telefono}}</td>
                                <td>
                                    <button class="btn btn-default"  ng-click="rmTelefono(telefono)" style="z-index: 100">
                                        <span class="glyphicon glyphicon-trash"></span>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-xs-4 col-xs-offset-4" ng-show="cargandoTelefonos">
                    <img src="../res/img/loading.gif" class="center-block" >
                </div>

                <!-- BOTONERA:-->
                <div class="botonera">
                    <div class="col-xs-12" style="padding-left:0px;">
                        <button class="btn btn-agregar-telefono col-xs-4" ng-click="openModal()">
                            <span class="glyphicon glyphicon-plus"></span>
                            AGREGAR<br>TELEFONO
                        </button>
                    </div>

                </div>
            </div>
        </div>
        <div class="parallax col-xs-12" style="background-image: url('../res/img/bg2.jpg');">
            <div class="caption col-xs-4">
                <a href="http://192.168.5.4/noc/marcadores" style="color:white;text-decoration: none;">VOLVER A MARCADORES</a>
            </div>
        </div>
        
        <!-- MODAL:-->
        <%@include file="modal.jsp" %>
    </body>
    <script>
    app.controller('home', function($scope, $rootScope) 
    {
        $scope.modoEdit = false;
        $scope.nuevoTelefono = null;
        $scope.telefonoSeleccionado = null;
        $scope.arrTelefonos = [];
        $scope.orden = 'id';
        $scope.deReversaMami = false;
        
        $scope.init = function()
        {
            $scope.findTelefonos();
        }
        $scope.ordenarPor = function(campo)
        {
            console.log("ordenando por "+ campo);
            if($scope.orden == campo)
            {
                if($scope.deReversaMami)
                {
                    $scope.deReversaMami = false;
                }
                else
                {
                    $scope.deReversaMami = true;
                }
            }
            else
            {
               $scope.orden = campo; 
            }
        }
        $scope.findTelefonos = function()
        {
            $.ajax(
            {
                url:"../../findTelefonos",
                beforeSend: function (xhr) 
                {
                    $scope.cargandoTelefonos = true;
                },
                success: function (resultado, textStatus, jqXHR) 
                {
                    $scope.cargandoTelefonos = false;
                    $scope.arrTelefonos = resultado;
                    console.log("res find telefonos: " + resultado.length);
                    $scope.$apply();
                    
                    $('[data-toggle="tooltip"]').tooltip(); 
                }
            });
        }
        $scope.seleccionarTelefono = function(telefono)
        {
            $scope.nuevoTelefono = telefono;
            
            $scope.openModal(true);
        }
        $scope.addTelefono = function()
        {
            $.ajax(
            {
                url:"../../addTelefono",
                data:
                {
                    "nombre":$scope.nuevoTelefono.nombre,
                    "telefono":$scope.nuevoTelefono.telefono
                },
                beforeSend: function (xhr) 
                {
                    $scope.agregandoTelefono = true;
                },
                success: function (resultado, textStatus, jqXHR) 
                {
                    $scope.agregandoTelefono = false;
                    if(resultado)
                    {
                        $scope.cerrarModal();
                        $scope.findTelefonos();
                    }
                    else
                    {
                        alert("ERROR: " + JSON.stringify(resultado));
                    }
                }
            });
        }
        $scope.editTelefono = function()
        {
            $.ajax(
            {
                url:"../../editTelefono",
                data:
                {
                    "id":$scope.nuevoTelefono.id,
                    "nombre":$scope.nuevoTelefono.nombre,
                    "telefono":$scope.nuevoTelefono.telefono
                },
                beforeSend: function (xhr) 
                {
                    $scope.editandoTelefono = true;
                },
                success: function (resultado, textStatus, jqXHR) 
                {
                    $scope.editandoTelefono = false;
                    if(resultado)
                    {
                        $scope.cerrarModal();
                        $scope.findTelefonos();
                    }
                    else
                    {
                        alert("ERROR: " + JSON.stringify(resultado));
                    }
                }
            });
        }
        $scope.rmTelefono = function(telefono)
        {
            if(confirm("Seguro desea quitar " + telefono.nombre + "??"))
            {
                $.ajax(
                {
                    url:"../../rmTelefono",
                    data:
                    {
                        "id":telefono.id
                    },
                    beforeSend: function (xhr) 
                    {
                        $scope.quitandoTelefono = true;
                    },
                    success: function (resultado, textStatus, jqXHR) 
                    {
                        $scope.quitandoTelefono = false;
                        if(resultado)
                        {
                            $scope.findTelefonos();
                            $scope.findTelefonos();
                        }
                        else
                        {
                            alert("ERROR: " + JSON.stringify(resultado));
                        }
                    }
                });
            }
        }
        $scope.openModal = function(edit)
        {
            $("#myModal").modal();
            $scope.modoEdit = edit;
            if(!edit)
            {
                $scope.nuevoTelefono = null;
            }
        }
        $scope.cerrarModal = function()
        {
            $("#myModal").modal('hide');
            $scope.modoEdit = false;
        }
    });
    </script>
</html>
