
<!-- Modal -->
<div id="modal-add-menu" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" ng-click="closeModalMenu()">&times;</button>
                <h4 class="modal-title" ng-hide="modoEdicionMenu">ADD MENU</h4>
                <h4 class="modal-title" ng-show="modoEdicionMenu">EDIT MENU</h4>
            </div>
            <div class="modal-body">
                
                <!-- NOMBRE MENU:-->
                <div class="form-group">
                    <label>Nombre</label>
                    <input type="text" class="form-control" ng-model="menuEditando.nombre">
                </div>
                
                <!-- ORDEN MENU:-->
                <div class="form-group">
                    <label>Orden</label>
                    <input type="text" class="form-control" ng-model="menuEditando.orden">
                </div>
                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success col-xs-12" data-dismiss="modal" ng-hide="modoEdicionMenu" ng-click='addMenu()'>Add Menu</button>
                <button type="button" class="btn btn-primary col-xs-12" data-dismiss="modal" ng-show="modoEdicionMenu" ng-click='editMenu()'>Edit Menu</button>
            </div>
        </div>
    </div>
</div>