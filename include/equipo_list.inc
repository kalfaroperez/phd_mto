<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap CRUD Data Table for Database with Modal Form</title>
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
				                <h2>Registro Equipos Principales</b></h2>
                    </div>
          					<div class="col-sm-6">
                      <!--a href="#deleteElementoModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Borrar Registro</span></a-->
                      <a href="#addElementoModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Nuevo registro</span></a>
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
                      <th>Nombre</th>
                      <th>Descripcion</th>
                      <th>Ficha Tecnica</th>
                      <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="tbody_elementos" accion="listar_equipos_princ" elemento_html="tabla_html">
                  <!--Aqui se inserta por ajax los elementos-->
                </tbody>
            </table>
		         <div class="clearfix" id="div_pag">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item" active><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item "><a href="#" class="page-link">3</a></li>
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
        <form id="formModal" enctype="multipart/form-data">
					<div class="modal-header">
						<h4 class="modal-title">Nuevo Registro</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
            <div class="form-group">
							<label>Nombre</label>
							<input id="txtNombreInsert" name="nombre" type="text" maxlength="100" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Descripcion</label>
              <input id="txtDescripcionInsert" name="descripcion" type="text" maxlength="100" class="form-control">
						</div>
            <div class="form-group files" id="files1">
							<label>Ficha T&eacute;nica Adjuntos:</label>
                <div id='div_0'>
                  <input type="button" class="button" name="" value="+">
                  <input type='file'  id="adjunto1" class="fileUpload form-control" name='adjunto[]'> (Max. <?php echo $text_max_attach; ?>)
                </div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input id="btnSave" accion="insertar_equipo_principal" type="submit" class="btn btn-info" value="Guardar">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="editElementoModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
        <form id="formModal" enctype="multipart/form-data">
					<div class="modal-header">
						<h4 class="modal-title">Editar Registro</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Nombre</label>
							<input id="txtNombreEdit" name="nombre" type="text" maxlength="100" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Descripcion</label>
              <input id="txtDescripcionEdit" name="descripcion" type="text" maxlength="100" class="form-control">
						</div>
            <div class="form-group files">
							<label>Ficha T&eacute;nica</label>
                Adjuntos:
                <div id='div_0'>
                  <input type='file' id="adjunto1" class="fileUpload form-control" name='adjunto[]' maxlength='120'> (Max. <?php echo $text_max_attach; ?>)
                  <input type="button" class="button" name="" value="+">
                </div>
                <input type="button" class="button form-control" name="" value="+">
						</div>
<div class="form-group files">
  <table>
      <tr>
        <td>
    <?php
    $colspan = "";
    //$dir_upload = $_SERVER['DOCUMENT_ROOT']."/phd_mto/uploads/".$seq_ticket_id."/";
    $dir_upload = "D:/uploads/".$_SESSION['PHD_SUBCARPETA_ADJUNTO_FICHA_TEC']."/".$seq_ticket_id."/";
    if (file_exists($dir_upload)) {
    $files = scandir($dir_upload,1);
    //echo "<pre>";print_r($files); echo "</pre>";die;
    for ($i=0; $i < count($files); $i++) {
    	if ($files[$i] != ".." && $files[$i] != ".") {
    			$nombre_adjunto  = $files[$i];

    				if (strlen ( $nombre_adjunto ) > 0) {
     					$colspan = "";
    ?>
    						 <div style="display:block">
    							 <input class='boton_bold adjunto'
    							 				nombre_adjunto='<?php echo $nombre_adjunto?>'
    											subcarpeta='<?php echo $_SESSION['PHD_SUBCARPETA_ADJUNTO_TICKET']; ?>'
    											id_ticket="<?php echo $seq_ticket_id ?>"
    											type='button' value='<?php echo $Download; ?>'
    											style='cursor:pointer'>

    											<!--<a href="operaciones_ajax.php?accion=download_adjuntos&id_ticket=<?php echo $seq_ticket_id ?>&nombre_archivo=<?php echo $nombre_adjunto?>">Descargar</a>-->
    								 <b><?php echo $nombre_adjunto; ?></b>
    					 	 </div>
    <?php
    				} else {
    				 $colspan = "colspan='2'";
    				}
    		}
    	}
    }
    ?>

					 <td <?php echo $colspan; ?> >
					 </td>
				 </tr>
     </table>
</div>


					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
						<input id="btnEditElemento" type="submit" id_elemento="" accion="edit_equipo_principal" class="btn btn-info" value="Guardar">
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
						<p  class="text-warning"> Nombre: <small id="lblNombreDelete"></small></p>
            <p  class="text-warning">Descripcion: <small id="lblDescripcionDelete"></small></p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-danger" id="btnDeleteElemento" id_elemento="" accion="delete_equipo_principal" value="Eliminar">
					</div>
				</form>
			</div>
		</div>
	</div>
  <script type="text/javascript" src="jquery.bootpag.min.js"></script>
  <script src="js/jquery-2.1.0.min.js"></script>
  <script src="js/jquery-ui-1.9.2.custom.js"></script>
  <script src="plugins/select2/dist/js/select2.min.js"></script>
  <script type="text/javascript" src="web_script.js"></script>




</body>
</html>
