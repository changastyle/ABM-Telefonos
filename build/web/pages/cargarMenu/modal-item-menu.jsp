<!-- Modal -->
<div id="modal-item-menu" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" ng-click="closeModalItemMenu()">&times;</button>
                <h4 class="modal-title" ng-hide="modoEdicionItemMenu">ADD ITEM MENU</h4>
                <h4 class="modal-title" ng-show="modoEdicionItemMenu">EDIT ITEM MENU</h4>
            </div>
            <div class="modal-body">
                
                <div class="form-group" style="margin-top:12px;">
                    <label>Nombre:</label>
                    <input type="text" ng-model="subMenuEditando.nombre" class="form-control">
                </div>
                <div class="form-group">
                    <label>URL:</label>
                    <input type="text" ng-model="subMenuEditando.url" class="form-control">
                </div>
                <!--{{subMenuEditando}}-->
                
            </div>
        
            <div class="modal-footer">
                <button type="button" class="btn btn-success col-xs-12" data-dismiss="modal" ng-hide="modoEdicionItemMenu" ng-click='addItemMenu()'>Add Item Menu</button>
                <button type="button" class="btn btn-primary col-xs-12" data-dismiss="modal" ng-show="modoEdicionItemMenu" ng-click='editItemMenu()'>Edit Item Menu</button>
            </div>
        </div>
    </div>
</div>