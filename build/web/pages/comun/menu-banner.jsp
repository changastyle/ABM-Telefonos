<div class="menu-banner col-sm-12 col-md-12 col-lg-12 hidden-xs"  >
    
    <!-- WRAP-MENU:-->
    <div class="col-xs-2 wrap-menu-encabezado-y-lista"  ng-repeat="menu in arrMenusBanner" ng-mouseleave="leaveMenu(menu.id)">
        
        <!-- ENCABEZADO MENU: -->
        <div class="encabezado-menu-banner col-xs-12" id="encabezado-menu-banner-{{menu.id}}" ng-mouseenter="overMenu($event,menu.id)">
            {{menu.nombre}}
        </div>
        
        <!-- WRAP LISTADO MENU ITEMS:--> 
        <div class="wrap-listado-menu" hidden id="wrap-listado-menu-{{menu.id}}">
        
            <!-- LISTADO MENU ITEMS:-->
            <div class="items-menu" ng-repeat="itemMenu in menu.itemsList" ng-click="redireccionamiento(itemMenu.url)">
                {{itemMenu.nombre}}
            </div>
        </div>
        
    </div>
    
    
</div>

<style>
    .menu-banner
    {
        height: 40px;
        background-color:white;
        padding-left: 0px;
        padding-right: 0px;
    }
    .wrap-menu-encabezado-y-lista
    {
        padding-left: 0px;
        padding-right: 0px;
    }
    .encabezado-menu-banner
    {
        display:inline-block;
        padding-left:12px;
        padding-right: 12px;
        padding-top:10px;
        padding-bottom:6px;
        cursor: pointer;
        text-align: center;
        overflow: hidden;
        background-color: white;
        height: 40px;
        font-weight: bold;
        font-size: 16px;
        //margin-right: 8px;
    }
    .encabezado-menu-banner:hover
    {
        background-color:#f39c12;
        color:white;
    }
    .encabezado-menu-banner-over
    {
        background-color:#f39c12;
        color:white;
    }
    .wrap-listado-menu
    {
        //background-color: rgba(0,0,0,0.45);
        background-color:#f39c12;
        color:white;
        text-align: center;
        margin-top:40px;
    }
    .items-menu
    {
        padding: 12px;
        cursor:pointer;
        //border:solid 2px black;
    }
    .items-menu:hover
    {
        background-color:white;
        color:#f39c12;
    }
</style>