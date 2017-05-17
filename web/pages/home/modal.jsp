<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">
              <span ng-hide="modoEdit">AGREGANDO NUEVO</span>
              <span ng-show="modoEdit">EDITANDO</span>
          </h4>
        </div>
        <div class="modal-body col-xs-12">
            <div class="col-xs-12" ng-hide="agregandoTelefono || editandoTelefono">
                <div class="form-group" ng-show="modoEdit">
                    <label>ID</label>
                    <input type="text" class="form-control" ng-model="nuevoTelefono.id"  disabled>
                </div>
                <div class="form-group">
                    <label>Nombre:</label>
                    <input type="text" class="form-control" ng-model="nuevoTelefono.nombre" placeholder="Roberto">
                </div>
                <div class="form-group">
                    <label>Telefono</label>
                    <input type="text" class="form-control" ng-model="nuevoTelefono.telefono" placeholder="294 154 55555">
                </div>
            </div>
            <div class="col-xs-12" ng-show="agregandoTelefono || editandoTelefono">
                <img src="../res/img/loading.gif" >
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-agregar-telefono col-xs-12" ng-click="addTelefono()" ng-hide="modoEdit">
                <span class="glyphicon glyphicon-plus"></span>
                AGREGAR
            </button>
            <button class="btn  btn-editar-telefono btn-primary col-xs-12" ng-click="editTelefono()" ng-show="modoEdit">
                <span class="glyphicon glyphicon-pencil"></span>
                EDITAR
            </button>
        </div>
      </div>
    </div>
</div>