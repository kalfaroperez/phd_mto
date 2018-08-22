<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="phd_bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
				                <h2>Clasificación Equipos</b></h2>
                    </div>
          					<div class="col-sm-6">
          						<a href="#addElementoModal" id="btnNuevoRegistro" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Nuevo registro</span></a>
          						<!--a id="btnDeleteSup" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Borrar Registro</span></a-->
          					</div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
          						<th>
          							<span class="custom-checkbox">
          								<input type="checkbox" id="selectAll">
          								<label for="selectAll"></label>
          							</span>
          						</th>
                      <th>Planta</th>
                      <th>Equipo Principal</th>
                      <th>Equipo Secundario</th>
                      <th>Componente</th>
                    </tr>
                </thead>
                <tbody id="tbody_elementos" accion="listar_equipos_clasificados" elemento_html="tabla_html">
                  <!--Aqui se inserta por ajax los elementos-->
                </tbody>
            </table>
	         <div class="clearfix">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
    </div>
	<!-- Edit Modal HTML -->
	<div id="addElementoModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
        <form>
					<div class="modal-header">
						<h4 class="modal-title">Nuevo registro</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
            <div class="form-group">
							<label>Planta</label>
              <select id="sel_planta" accion_selec="seleccion_planta" class="form-control">
                  <option value=0> Seleccione...</option>
              </select>
						</div>
						<div class="form-group">
							<label>Equipo Principal</label>
              <select id="sel_equipo_princ" accion_selec="seleccion_equipo_principal" class="form-control" >
                  <option value=0> Seleccione...</option>
              </select>
						</div>
            <div class="form-group">
							<label>Equipo Secundario</label>
              <select id="sel_equipo_sec" accion_selec="seleccion_equipo_secundario" class="form-control">
                  <option value=0> Seleccione...</option>
              </select>
						</div>
            <div class="form-group">
							<label>Componente</label>
              <select id="sel_componente" accion_selec="cargar_componentes" class="form-control">
                  <option value=0> Seleccione...</option>
              </select>
						</div>
					</div>
					<div class="modal-footer">
            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input id="btnSaveClasificacion" accion="insert_clasificacion" type="submit" class="btn btn-info btn-submit" value="Guardar">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="editElementoModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
        <form>
          <div class="modal-header">
						<h4 class="modal-title">Nuevo registro</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
            <input type="hidden" id="id_registro" name="id_registro" value="">
            <div class="form-group">
							<label>Planta</label>
              <select id="sel_planta" accion_selec="seleccion_planta" class="form-control">
                  <option value=0> Seleccione...</option>
              </select>
						</div>
						<div class="form-group">
							<label>Equipo Principal</label>
              <select id="sel_equipo_princ" accion_selec="seleccion_equipo_principal" class="form-control" >
                  <option value=0> Seleccione...</option>
              </select>
						</div>
            <div class="form-group">
							<label>Equipo Secundario</label>
              <select id="sel_equipo_sec" accion_selec="seleccion_equipo_secundario" class="form-control">
                  <option value=0> Seleccione...</option>
              </select>
						</div>
            <div class="form-group">
							<label>Componente</label>
              <select id="sel_componente" accion_selec="cargar_componentes" class="form-control">
                  <option value=0> Seleccione...</option>
              </select>
						</div>
					</div>
					<div class="modal-footer">
            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input id="btnSaveClasificacion" accion="edit_clasificacion" type="submit" class="btn btn-info btn-submit" value="Guardar">
					</div>
        </form>
			</div>
		</div>
	</div>
  <!-- Delete Modal HTML -->
	<div id="deleteElementoModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title">Eliminar Registro</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Está seguro que quiere borrar el registro?</p>
						<p  class="text-warning">Nombre: <small id="lblNombreDelete"></small></p>
            <p  class="text-warning">Descripcion: <small id="lblDescripcionDelete"></small></p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-danger" id="btnDeleteElemento" id_elemento="" accion="delete_clasificacion" value="Eliminar">
					</div>
				</form>
			</div>
		</div>
	</div>


  <script type="text/javascript" src="web_script.js"></script>
</body>
</html>
