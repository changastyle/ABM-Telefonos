<div class="menu-lateral col-xs-5 col-sm-3" hidden>
    
    <!-- LOGO HOME:-->
    <div class="col-xs-12 logo-banner-lateral">
        <button class='btn btn-default' ng-click='toggleBarraLateral()'>
            <span class='glyphicon glyphicon-menu-left'></span>
        </button>
    </div>
    
    <!-- ENLACES MENU LATERAL:-->
    <div class='listado-menu'>
        <div class='item-menu-lateral' ng-repeat="menu in arrMenusBanner" >
            <div class='nombre-menu-lateral' ng-click='mostrarHijosMenuLateral(menu)'>
                {{menu.nombre}}
            </div>
            
            <div class='wrap-hijos-menu-lateral' id='wrap-hijos-menu-lateral-{{menu.id}}'>
                <div class='hijos-menu-lateral' ng-repeat="itemMenu in menu.itemsList" ng-click="redireccionamiento(itemMenu.url)">
                    {{itemMenu.nombre}}
                </div>
            </div>
        </div>
    </div>
    
</div>
<style>
    .menu-lateral
    {
        position:fixed;
        top:0px;
        bottom:0px;
        left:0px;
        background-color: var(--blanco);
        z-index: 1000;
        overflow: hidden;
    }
    .logo-banner-lateral
    {
        min-height:120px;
        background-image: url('../res/img/logo-banner-izq.png');
        background-size: contain;
        background-repeat: no-repeat;
        color:white;
    }
    .listado-menu
   {
       margin-top: 130px;
   }
   .item-menu-lateral
   {
       
   }
   .nombre-menu-lateral
   {
       text-align: center;
       background-color:var(--naranja);
       color:white;
       font-weight: bold;
       padding:12px;
       margin-bottom: 4px;
       cursor:pointer;
       overflow: hidden;
   }
   .hijos-menu-lateral
   {
       text-align: center;
       background-color:var(--gris);
       color:white;
       font-weight: bold;
       padding:12px;
       margin-bottom: 4px;
       cursor: pointer;
       overflow: hidden;
   }
   
</style>