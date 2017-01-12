<!-- IZQ CARGAR MENU:-->
<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="padding-left:0px;">

    <div class="cargar-menu-izq col-xs-12 partes-cargar-menu">

        <!-- LISTADO ENCABEZADOS MENU:-->
        <div class="wrap-item-encabezado-menu col-xs-12" id="wrap-item-encabezado-menu-{{menu.id}}" ng-repeat="menu in arrMenusBanner" ng-click="selectMenu(menu)">

            <!-- NOMBRE MENU:-->
            <div class="item-encabezado-menu col-xs-9 col-sm-9 col-md-9 col-lg-10">
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