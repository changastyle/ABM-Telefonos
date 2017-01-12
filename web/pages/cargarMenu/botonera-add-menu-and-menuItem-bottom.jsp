<!-- BOTONERA DE ABAJO: -->
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