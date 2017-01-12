<!-- COLUMNA DERECHA: SUB MENUS-->
<div class="columna-derecha col-xs-12 col-sm-12 col-md-6 col-lg-6" style="padding-right:0px;">

    <!-- LISTADO SUB MENUS: -->
    <div class="listado-sub-menus col-xs-12 partes-cargar-menu">

        <!-- ITEM SUB MENU: -->
        <div class="item-submenus" ng-repeat="submenu in menuEditando.itemsList" id="item-submenus-{{submenu.id}}" ng-click="selectSubMenu(submenu)">

            <!-- NOMBRE SUB MENU:-->
            <div class="nombre-sub-menu col-xs-9 col-sm-9 col-md-9 col-lg-10">
                {{submenu.nombre}}
            </div>

            <!-- LAPIZ y TACHO SUBMENU:-->
            <div class="botonera-sub-menu col-xs-3 col-sm-3 col-md-3 col-lg-2">
                
                <button class="btn btn-default" ng-click="openEditSubMenu(submenu)">
                    <span class="glyphicon glyphicon-pencil"></span>
                </button>
                <button class="btn btn-danger" ng-click="rmSubMenu(submenu)">
                    <span class="glyphicon glyphicon-trash"></span>
                </button>
            </div>
        </div>
    </div>
</div>
<style>
    .columna-derecha
    {
        //border:solid 2px black;
    }
    .listado-sub-menus
    {
        //border:solid 2px black;
        height: 100%;
        //overflow-y: hidden;
        //overflow-x: hidden;
    }
    .item-submenus
    {
        
        height: 50px;
        border-radius: 6px;
        background-color:var(--main-color);
        color:var(--blanco);
        text-align: center;
        margin-top: 8px;
        overflow: hidden;
        box-sizing: border-box;
    }
    .item-submenus-selected
    {
        height: 50px;
        border-radius: 6px;
        background-color:var(--rojo);
        color:var(--blanco);
        text-align: center;
        margin-top: 8px;
        overflow: hidden;
        box-sizing: border-box;
    }
    .nombre-sub-menu
    {
        padding:14px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
    }
    .botonera-sub-menu
    {
        display: inline-block;
         display: inline-block;
        padding:0px;
        padding-top:8px;
        padding-bottom:4px;
        text-align: center;
        height: 100%;
    }
</style>