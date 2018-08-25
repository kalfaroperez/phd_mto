<?PHP
/*
 * Nombre: ticket_modif.inc Autor: Julio Tuozzo Funci�n: Formulario de modificaci�n de ticket de mesa de ayuda Function: Update ticket form. Ver: 2.00
 */
//$ancho_guardar = 22 + (strlen ( $Save ) * 8);
//$ancho_salir = 22 + (strlen ( $Close ) * 8);
include ('f_subtipo_JS.inc');
include ('f_fecha_JS.inc');
include ($_SERVER['DOCUMENT_ROOT'].'/phd_mto/operaciones_sql.php');
require ('head.inc');

// # Inicio el formulario de carga de tickets
// Start the load tiket form.
?>


<link href="css/base/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<link href="plugins/select2/dist/css/select2.min.css" rel="stylesheet" />
<body>
<?php
require ('menu.inc');

// # Traigo las funciones JavaScript
// Get JavaSript functions.



// # Inicio el formulario de carga de tickets
// Inicializing the load ticket form.



//echo "<pre>"; print_r($GLOBALS); echo "</pre>";
// Selector Calificaciones
$options = "";
$select_calificacion = "";

$query = "SELECT operador_id, ape_y_nom
			FROM {$MyPHD}operador
			WHERE nivel > 0 AND
			(sector_id = '01' AND  nivel = '10')
			ORDER BY operador_id";

$result = mysql_query ( $query ) or die ( mysql_error () );
$resultados = array();
while($row = mysql_fetch_array ($result)){
	$resultados [] = $row["operador_id"];
}

if(array_search($_SESSION['PHD_OPERADOR'], $resultados)){
	//Esto solo aplica y aparece para cuando los usuario son de mantenimiento
	$select_calificacion = "<input type='hidden' name='calificacion' value='SIN_CALIFICAR' />";

}else{
	//Obtengo el array de calificaciones
	$calificaciones = get_array_calificaciones();
	foreach ( $calificaciones as $key => $value ) {
		$seleccionado = ($calificacion == $key) ? "selected" : "";
		$options .= <<<HTML
		    	<option $seleccionado value="$key"> $value </option>
HTML;
	}

	$select_calificacion = <<<HTML
		  	$Calificacion_txt <select id="calificacion" name="calificacion" $calificacion_disabled>  $options  </select>
HTML;

}
//echo "<pre>"; print_r($_POST); echo "</pre>";
if (isSet($_GET['exito'])) {
	if ($_GET['exito'] == 's') {
		$mensaje_exito = 'Su ticket fue actualizado con exito!!!';
	}else {
		$mensaje_exito = '';
	}
}


?>

<br/><br/><br/>
<div id='contenido'>
	<form enctype='multipart/form-data' name='ticket' method='post' action='ticket_modif.php' onsubmit='document.ticket.fecha_sigo.value=f_fecha();'>
		<div id='div_ticket_user_t'>
			<!--Hiddens De los selectores -->
			<input type='hidden' name='h_prioridad' value='<?php echo $prioridad; ?>' />
			<input type='hidden' name='h_asignado_a' value='<?php echo $asignado_a; ?>' />
			<input type='hidden' name='h_proceso' value='<?php echo $proceso; ?>' />
			<input type='hidden' name='h_tipo' value='<?php echo $tipo; ?>' />
			<input type='hidden' name='h_sub_tipo' value='<?php echo $sub_tipo; ?>' />
			<input type='hidden' name='h_estado' value='<?php echo $estado; ?>' />
			<input type='hidden' name='h_fecha_ultimo_estado' value='<?php echo $fecha_ultimo_estado; ?>' />
			<input type='hidden' name='h_fecha_entrega' value='<?php echo $fecha_entrega; ?>' />
			<input type='hidden' name='h_calificacion' value='<?php echo $calificacion; ?>' />
			<input type='hidden' name='seq_ticket_id' value='<?php echo $seq_ticket_id; ?>' />

			<input type='hidden' name='h_disabled_field' value='<?php echo $disabled_field; ?>' />


		    <table border='0' width='95%' cellpadding='1' cellspacing='1' align='center'>
		     <tr>
		      <td colspan=3> <h3><?php echo $Ticket; ?>: # <?php echo $seq_ticket_id; ?></h3></td>
		     </tr>
		     <tr>
		      <td align='left'> <?php echo $Date; ?> : <b><?php echo $fecha; ?></b>
		        <INPUT type='hidden' name='fecha' value='<?php echo $fecha; ?>'>
		        <INPUT type='hidden' name='fecha_sigo' value='<?php echo $fecha_sigo; ?>'>
		        <INPUT type='hidden' name='seq_ticket_id' value='<?php echo $seq_ticket_id; ?>'>
		      </td>
		      <td align='center'><?php echo $Operator; ?>: <b><?php echo $operador; ?> - <?php echo $operador_ape_y_nom; ?> / <?php echo $operador_sector_id; ?></b> </td>
		      <INPUT type='hidden' name='operador' value='<?php echo $operador; ?> '>
		      <INPUT type='hidden' name='operador_ape_y_nom' value='<?php echo $operador_ape_y_nom; ?>'>
		      <INPUT type='hidden' name='operador_sector_id' value='<?php echo $operador_sector_id; ?>'>
					<input type='hidden' id='nivel' value='<?php echo $nivel; ?> ' />
		      <td align='right'><?php echo $Contact; ?>: <b><?php echo $contacto; ?></b><INPUT type='hidden' name='contacto' value='<?php echo $contacto; ?>'></td>
		    </tr>
		    </table>
		    <center class=error><?php echo $mensaje; ?> </center>
				<center class=exito><?php echo $mensaje_exito; ?> </center>

		    <table class=borde_fino width='95%' cellpadding='1' cellspacing='0' align='center' >
		     <tr>
		      <td colspan='3'><b> <?php echo $User_information ; ?> </b></td>
		     </tr>
		     <tr>
		      <td>Usuario: <b><?php echo $usuario; ?></b> <INPUT type='hidden' name='usuario' value='<?php echo $usuario; ?>'> </td>
		      <td> <?php echo $Last_and_first_name; ?>: <b><?php echo $ape_y_nom; ?></b><INPUT type='hidden' name='ape_y_nom' value='<?php echo $ape_y_nom; ?>'> </td>
		      <td><?php echo $Area; ?>: <b> <?php echo $area_id; ?></b> <INPUT type='hidden' name='area_id' value='<?php echo $area_id; ?>'> </td>
		     </tr>

		     <tr>
		       <td colspan='3'>
		        <table  width='100%' cellpadding='2' cellspacing='1' align='center' >
		         <tr>
		          <td> <?php echo $Floor; ?>: <INPUT type='text' name='piso' value='<?php echo $piso; ?>' size='4' maxlength='4' <?php echo $readonly_field; ?>> </td>
		          <td><?php echo $Phone; ?>: <INPUT type='text' name='telefono' value='<?php echo $telefono; ?>' size='30' maxlength='30' <?php echo $readonly_field; ?>> </td>
		          <td><?php echo $Elec_mail; ?>: <INPUT type='text' name='e_mail' value='<?php echo $e_mail; ?>' size='45' maxlength='60' <?php echo $readonly_field; ?>> </td>
		         <td><b><?php echo $nombre_area; ?></b></td>
		        </tr>
		       </table>
		       </td>
		      </tr>
		     </table>

		    <table border='0' width='95%' cellpadding='3' cellspacing='2' align='center' >
		     <tr> <td colspan='3'> <b> Datos del ticket </b> </td> </tr>
		     <tr> <td valign='top'> <?php echo $Incident; ?>: </td>
		      <td class=caja_texto>
		        <?php echo $_SESSION[MOD_PHD_INCIDENTE]; ?>
		      </td>
		     </tr>
		   		<tr>
						<td valign='top'> <?php echo $Comment; ?>:
<?php
if ($_SESSION ['PHD_SEQ_SOLICITUD_ID'] > 0) {
?>
								<br>
				        <br><?php echo $User_visible; ?> <input type='checkbox' <?php echo $visible_check; ?>  name='visible'  value='S'/>
<?php
}
?>

						</td>
			      <td>
			        <TEXTAREA name='comentario' rows='5' cols='130' ><?php echo $comentario; ?></TEXTAREA>
			      </td>
			     </tr>
				 </table>
				 </div>
				 <div id='div_admin_t' style='display:block'>
				 <table border='0' width='95%' cellpadding='3' cellspacing='1' align='center' >
			     <tr>

			 						<td><?php echo $Attach_file; ?>: </td>
			            <td>

										<div class="row files" id="files1">
				              <div id='div_0'>
				                <input type='file' id="adjunto1" class="fileUpload" name='adjunto[]' maxlength='120'> (Max. <?php echo $text_max_attach; ?>)
				                &nbsp;<input type="button" class="button" name="" value="+">
				              </div>
				            </div>
			        		</td>
			    </tr>
					<tr>
						<td> <?php echo $Attached_file; ?> : </td>
						<td>
<?php
$colspan = "";
//$dir_upload = $_SERVER['DOCUMENT_ROOT']."/phd_mto/uploads/".$seq_ticket_id."/";
$dir_upload = "D:/uploads/".$seq_ticket_id."/";
if (file_exists($dir_upload)) {
	// code...

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
											id_ticket="<?php echo $seq_ticket_id ?>"
											type='button' value='<?php echo $Download; ?>'
											style='cursor:pointer'>
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


		    <table  width='95%' cellpadding='5' cellspacing='1' align='center' >
		      <tr>
		        <td><?php echo $Priority; ?>:
							<select name='prioridad' <?php echo $disabled_field; ?>>

<?php
						for($I = 3; $I > 0; $I --) {
							if ($I == $prioridad) {
								$selected = 'selected';
							} else {
								$selected = '';
							}
?>
									<option <?php echo $selected; ?> value='<?php echo $I; ?>'> <?php echo $I; ?>

<?php
								switch ($I) {
									case 3 :
										echo "- $High";
										break;
									case 2 :
										echo "- $Medium";
										break;
									case 1 :
										echo "- $Low";
										break;
								}
?>
								</option>
<?php
}
?>

							</select>
		       </td>
		       <td>
		        <?php echo $Assigned_to; ?>:
						<select name='asignado_a' <?php echo $disabled_field; ?>>
		            <option> </option>
<?php
$query = "SELECT operador_id, ape_y_nom, sector_id
                FROM {$MyPHD}operador
                WHERE (nivel>0 AND
                (sector_id='$_SESSION[PHD_SECTOR_ID]' OR privado='N')) OR
                operador_id='$asignado_a'
                ORDER BY sector_id, operador_id";
$result = mysql_query ( $query ) or die ( $No_database );

while ( $row = mysql_fetch_array ( $result ) ) {
	if ($row ['operador_id'] == $asignado_a) {
		$selected = 'selected';
	} else {
		$selected = '';
	}
?>
		<option <?php echo $selected; ?> value='<?php echo $row['operador_id']; ?>'> <?php echo $row['operador_id']; ?> - <?php echo $row['ape_y_nom']; ?> / <?php echo $row['sector_id']; ?></option>
<?php
}


// # Armo la lista de opciones de proceso
// # IMPORTANTE: Como la base de datos tiene atributos que hoy pueden no
// # estar activos y si estar en la tabla de tickets voy a validar que el
// # valor actual figure en la lista, de no ser as� lo agrego, esto es lo que
// # detecta la variable $existe.

// Make the list of process options
// IMPORTANT: As the data base has attributes that today can not be active
// and if to be in the table of tickets going to validate that present value
// appears in the list, otherwise add, this is what detects the variable $existe.
?>
										</select>
						     </td>
						     <td>
<?php
// # Solo pueden ver y cambiar el atributo privado un operador del sector que ingres� el ticket
// Only can view and change the private attribute an operator that belong to the sector has inserted the ticket.

if ($operador_sector_id == $_SESSION ['PHD_SECTOR_ID']) {
?>
	<?php echo $Private; ?> &nbsp; <input type='checkbox' <?php echo $private_check; ?> name='privado' value='S' <?php echo $disabled_field; ?> />

<?php

} else {

?>
	<input type='hidden' name='privado' value='<?php echo $privado; ?>'  />
            <?php echo $Private; ?>:
<?php
	if ($privado == "S") {
?>
		<?php echo '<b>'. $Yes.'</b>'; ?>
<?php
	} else {
?>
		<?php echo '<b>' .$No.'</b>'; ?>
<?php
	}
}
?>
				</td>
      </tr>

      <tr>
       <td>
        <?php echo $Process; ?>:
				<select name='proceso' <?php echo $disabled_field; ?> >
<?php
$query = "SELECT valor
                FROM {$MyPHD}atributo
                WHERE atributo='$Process' AND activo='S'
                ORDER BY valor";
$result = mysql_query ( $query ) or die ( $No_database );

$existe = false;
while ( $row = mysql_fetch_array ( $result ) ) {
	if ($row ['valor'] == $proceso) {
		$selected = 'selected';
		$existe = true;
	} else {
		$selected = '';
	}
?>
	<option <?php echo $selected; ?>> <?php echo $row['valor']; ?> </option>
<?php
}
if (! $existe) {
?>
	<option selected> <?php echo $proceso; ?> </option>
<?php
}
?>
								</select>
			       </td>
						 <?php
						 $arr_tipo_trabajo = array(
							'Mecanico' => 'Mecanico',
						 	'Electromecanico' => 'Electromecanico',
						 	'Plomeria' => 'Plomeria',
					 		'Obra Civil' => 'Obra Civil',
				 			'Metalmecanico' => 'Metalmecanico',
							'Soldadura' => 'Soldadura',); ?>
						 <td> Tipo de Trabajo:
			         <select id="tipo_trabajo" name="tipo_trabajo" <?php echo $disabled_field; ?>>
			            <option value='0'>Seleccione...</option>
									<?php
									$selected = '';
									while (list($key, $val)=each($arr_tipo_trabajo)) {
										if ($tipo_trabajo == $val) {
											$selected = 'selected';
											$existe = true;
										} else {
											$selected = '';
										}
									?>
									<option value='<?php echo $key; ?>' <?php echo $selected; ?>><?php echo $val; ?></option>
									<?php
									}
									?>



			         </select>
			     </td>
			 		</tr>



						<tr>
						      <!--td>Planta</td-->
						      <td>
										<?php
												$data = getPlantaByID($id_planta);
												if (!empty($data)) {
													list($k, $planta) = each($data);
													$nombre_planta = $planta['nombre_planta'];
												}


										?>
										<div class="ui-widget">
											<label for="cbxPlanta">Area: </label>
											<!--<input id='cbxPlanta' class="ui-autocomplete-input" value="<?php echo $nombre_planta; ?>" <?php echo $disabled_field; ?> />-->
											<select id='cbxPlanta' style="width: 50%" <?php echo $disabled_field; ?>>
												<option value="<?php echo $id_planta; ?>"><?php echo $nombre_planta; ?></option>
											</select>
										</div>
						        <!--
										Area:
						          <select id="sel_planta_ti" name="sel_planta" accion_selec="seleccion_planta" onchange="cargar_select_equipo_princ_ticket();">
						              <option value=0> Seleccione...</option>
			<?php
			                  /*
												$plantas = getPlantas();
			                  if (!empty($plantas)) {
			                      while (list($k, $row) = each($plantas)) {
			                        $key = $row["id_planta"];
			                        $valor = $row["nombre"];

															if ($id_planta != 0 & !empty($id_planta)) {
																$selected = ($id_planta == $key) ? "selected" : "";
															}

			?>
			                        <option value="<?php echo $key; ?>" <?php echo $selected; ?> > <?php echo $valor; ?> </option>
			<?php

			                      }
			                  }
			*/
			?>
						          </select>
										-->
						      </td>
						      <!--td>Equipo Principal</td-->
						      <td>
										<?php
													$data = getEquipoPrincipalByID($id_equipo_princ);
													if (!empty($data)) {
														list($k, $row) = each($data);
														$nombre_equipo_princ = $row['nombre_equipo_princ'];
													}
										?>
										<div class="ui-widget">
											<label for="cbxEquipoPrincipal">Equipo Principal: </label>
											<!--<input id='cbxEquipoPrincipal' class="ui-autocomplete-input" value="<?php echo $nombre_equipo_princ; ?>" <?php echo $disabled_field; ?> />-->
											<select id='cbxEquipoPrincipal' style="width: 50%" <?php echo $disabled_field; ?>>
												<option value="<?php echo $id_equipo_princ; ?>"><?php echo $nombre_equipo_princ; ?></option>
											</select>
										</div>
										<!--
						          Equipo Principal:
						          <select id="sel_equipo_princ_ti" name="sel_equipo_princ" accion_selec="seleccion_equipo_principal" onchange="cargar_select_equipo_sec_ticket();">
						              <option value=0> Seleccione...</option>
			<?php
			/*
													$equipos_Princ = getEquiposPrincipales($id_planta);
													if (!empty($equipos_Princ)) {

														while (list($k, $row) = each($equipos_Princ)) {
																$key = $row["id_equipo_princ"];
																$valor = $row["nombre"];
																if ($id_equipo_princ != 0 & !empty($id_equipo_princ)) {
																	$selected = ($id_equipo_princ == $key) ? "selected" : "";
																}
			?>
																<option value="<?php echo $key; ?>" <?php echo $selected; ?> > <?php echo $valor; ?> </option>
			<?php
														}

													}
													*/
			?>
											</select>-->
						      </td>
									<td>&nbsp;</td>
						  </tr>
						  <tr>
						    <!--td>Equipo Secundario</td-->
						    <td>
									<?php
												$data = getEquipoSecundarioByID($id_equipo_sec);
												if (!empty($data)) {
													list($k, $row) = each($data);
													$nombre_equipo_sec = $row['nombre_equipo_sec'];
												}
									?>
									<div class="ui-widget">
										<label for="cbxEquipoSecundario">Equipo Secundario: </label>
										<!--<input id='cbxEquipoSecundario' class="ui-autocomplete-input" value="<?php echo $nombre_equipo_sec; ?>" <?php echo $disabled_field; ?> />-->
										<select id='cbxEquipoSecundario' style="width: 50%" <?php echo $disabled_field; ?>>
											<option value="<?php echo $id_equipo_sec; ?>"><?php echo $nombre_equipo_sec; ?></option>
										</select>
									</div>
									<!--
						      Equipo Secundario:
						        <select id="sel_equipo_sec_ti" name="sel_equipo_sec"  accion_selec="seleccion_equipo_secundario" onchange="cargar_select_componente_ticket();">
						            <option value=0> Seleccione...</option>
			<?php
									/*
												$equipos_sec = getEquipoSecundario($id_equipo_princ, $id_planta);
												if (!empty($equipos_sec)) {
														while (list($k, $row) = each($equipos_sec)) {
															$key = $row["id_equipo_sec"];
															$valor = $row["nombre"];

															if ($id_equipo_sec != 0 & !empty($id_equipo_sec)) {
																$selected = ($id_equipo_sec == $key) ? "selected" : "";
															}
			?>
												<option value="<?php echo $key; ?>" <?php echo $selected; ?> > <?php echo $valor; ?> </option>
			<?php
														}
												}
									*/
			?>
						        </select>
									-->
						    </td>
						    <!--td>Componentes</td-->
						    <td>
									<?php

											$data = getComponenteByID($id_componente);
											if (!empty($data)) {
												list($k, $row) = each($data);
												$nombre_componente = $row['nombre_componente'];
											}
									?>
									<div class="ui-widget">
										<label for="cbxComponente">Componentes: </label>
										<!--<input id='cbxComponente' class="ui-autocomplete-input" value="<?php echo $nombre_componente; ?>" <?php echo $disabled_field; ?> />-->
										<select id='cbxComponente' style="width: 50%" <?php echo $disabled_field; ?>>
											<option value="<?php echo $id_componente; ?>"><?php echo $nombre_componente; ?></option>
										</select>
									</div>

										<!--
										Componentes:
						        <select id="sel_componente_ti" name="sel_componente" accion_selec="cargar_componentes">
						            <option value=0> Seleccione...</option>
			<?php
												/*$componentes = getComponentes($id_planta, $id_equipo_princ, $id_equipo_sec);

												if (!empty($componentes)) {
														while (list($k, $row) = each($componentes)) {
															$key = $row["id_componente"];
															$valor = $row["nombre"];
															if ($id_componente != 0 & !empty($id_componente)) {
																$selected = ($id_componente == $key) ? "selected" : "";
															}
			?>
												<option value="<?php echo $key; ?>" <?php echo $selected; ?> > <?php echo $valor; ?> </option>
			<?php
														}
												}
												*/
			?>
			 			       </select>-->
						    </td>
							<td>&nbsp;</td>
						</tr>


						<input type='hidden' id="sel_planta" name='sel_planta' value='<?php echo $id_planta; ?>' />
			      <input type='hidden' id="sel_equipo_princ"  name='sel_equipo_princ' value='<?php echo $id_equipo_princ; ?>' />
			      <input type='hidden' id="sel_equipo_sec" name='sel_equipo_sec' value='<?php echo $id_equipo_sec; ?>' />
			      <input type='hidden' id="sel_componente" name='sel_componente' value='<?php echo $id_componente; ?>' />

			      <script src="js/jquery-1.8.3.js"></script>
						<script src="plugins/select2/dist/js/select2.min.js"></script>
			      <script src="js/jquery-ui-1.9.2.custom.js"></script>
			      <script type="text/javascript" src="web_script.js"></script>



<?php
// # Armo la lista de opciones de estado del ticket
// make the state option list.
?>
		<tr>
       <td>
        <?php echo $State; ?>: <select name='estado' onChange='document.ticket.fecha_ultimo_estado.value=f_fecha();' <?php echo $disabled_field; ?>>
<?php
				global $Host,$Usuario,$Contrasena, $Base;
				$Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
				$Uso=mysql_select_db($Base) or die (mysql_error());
$query = "SELECT valor
                FROM {$MyPHD}atributo
                WHERE atributo='$State' AND activo='S'
                ORDER BY valor";
$result = mysql_query ( $query ) or die ( $No_database );

$existe = false;
while ( $row = mysql_fetch_array ( $result ) ) {
	if ($row ['valor'] == $estado) {
		$selected = 'selected';
		$existe = true;
	} else {
		$selected = '';
	}
	echo "<OPTION $selected value='{$row['valor']}'> {$row['valor']} </OPTION> \n";
}
if (! $existe) {
	echo "<OPTION selected> $estado </OPTION> \n";
}
?>
								</select>
			        </td>
			        <td>

			       <?php echo $Last_state_date; ?>: <INPUT type='text' name='fecha_ultimo_estado' value='<?php echo $fecha_ultimo_estado; ?>' size='19' maxlength='19' <?php echo $disabled_field; ?> >

			        </td>
			        <td>
			        <?php echo $estado; echo $By; ?>: <b><?php echo $operador_ultimo_estado; ?></b>

			        <input type='hidden' name='operador_ultimo_estado' value='<?php echo $operador_ultimo_estado; ?>'>
			        </td>
							<td>

			       Fecha de Entrega de Trabajo: <input type='text' class='datepicker' name='fecha_entrega' value='<?php echo $fecha_entrega; ?>' size='19' maxlength='19'  readonly='readonly' <?php echo $disabled_field; ?>>

			        </td>
			       </tr>
					 </table>
					 </div>
					 <div id='div_boton_accion_t'>

				     <table class='borde_fino' border='0' cellspacing='0' cellpadding='0' width='95%' align='center'>
				       <!--Calificacion Ticket-->
				       <tr>
							 		<td> <?php echo $select_calificacion; ?> </td>
				          <td></td>
				          <td></td>
				       </tr>
			      </table>
			      <p>
			      <table border='0' cellspacing='1' cellpadding='2' width='100%'>
			             <tr>
			              <td align='right'>
			               <input class='boton_guardar' style='width: 86px;' type='submit' value='<?php echo $Save; ?>' name='guardar' onclick='this.value=\"Wait...\"' />
			              </td>
			              <td align='right'>
			               <input class='boton_salir' style='width: 86px;' type='button' name='button' value='<?php echo $Close; ?>' onClick='window.close()' />
			              </td>
			             </tr>
	           </table>
					</div>

			</form>
</div>
<?php
// # Cargo el vector con los datos del seguimiento del ticket
// Load the vector with the follow up data.

$query = "SELECT seq_sigo_ticket_id, fecha, operador_id, usuario_id, campo_cambiado, valor_anterior, valor_actual, comentario, nombre_adjunto
       		FROM {$MyPHD}sigo_ticket
			WHERE seq_ticket_id=$seq_ticket_id";

$result = mysql_query ( $query ) or die ( $No_database );

$I = 0;
while ($row = mysql_fetch_array ( $result )) {
	$sigo_ticket [$I] ['seq_sigo_ticket_id'] = $row ['seq_sigo_ticket_id'];
	$sigo_ticket [$I] ['fecha'] = date ( "Y/m/ d H:i:s", strtotime ( $row ['fecha'] ) );
	$sigo_ticket [$I] ['operador'] = $row ['operador_id'];
	$sigo_ticket [$I] ['usuario'] = $row ['usuario_id'];
	$sigo_ticket [$I] ['campo_cambiado'] = $row ['campo_cambiado'];
	$sigo_ticket [$I] ['valor_anterior'] = get_descripcion_calificaion($row ['valor_anterior']);
	$sigo_ticket [$I] ['valor_actual'] = get_descripcion_calificaion($row ['valor_actual']);
	$sigo_ticket [$I] ['comentario'] = str_replace ( chr ( 10 ), "<br>", str_replace ( chr ( 13 ), "", htmlentities ( $row ['comentario'], ENT_QUOTES, "ISO-8859-1" ) ) );
	$sigo_ticket [$I] ['nombre_adjunto'] = $row ['nombre_adjunto'];
	$I ++;
}

// # Si corresponde, muestro el seguimiento del ticket
// If it correspond, show the follow up of the ticket.

if (count ( $sigo_ticket ) > 0) {
?>
		<hr />
            <b><?php echo $Tkt_follow_up; ?>  </b>
            <table border='0' cellspacing='1' cellpadding='2' width='100%'>
            <tr>
	           <th><?php echo $Date; ?></th>
	           <th><?php echo $Operator; ?></th>
	           <th><?php echo $User; ?></th>
	           <th><?php echo $Modified_field; ?></th>
	           <th><?php echo $Previous_value; ?></th>
             <th><?php echo $New_value; ?></th>
             <th><?php echo $Comment; ?></th>
             <th><?php echo $Attached_file; ?></th>
            </tr>
<?php
	$renglon_ant = "";
	$J = 0;
	for($I = 0; $I < count ( $sigo_ticket ); $I ++) {
		$color = ($I %2 == 0) ? "class=b_linea_2" : "class=b_linea_1";
?>
			<tr <?php echo $color; ?>>
                <td><?php echo $sigo_ticket[$I]['fecha']; ?></td>
                <td><?php echo $sigo_ticket[$I]['operador']; ?></td>
                <td><?php echo $sigo_ticket[$I]['usuario'];; ?></td>
								<td><?php echo $sigo_ticket[$I]['campo_cambiado']; ?></td>
                <td><?php echo $sigo_ticket[$I]['valor_anterior']; ?></td>
                <td><?php echo $sigo_ticket[$I]['valor_actual']; ?></td>
                <td><?php echo $sigo_ticket[$I]['comentario']; ?></td>
                <td>
<?php
		if (strlen ( $sigo_ticket [$I] ['nombre_adjunto'] ) > 1) {
?>
			<input class='boton' type='button' name='s_adjunto' value='{<?php echo $sigo_ticket[$I]['nombre_adjunto']; ?>}' onClick='window.location=\"abro_adjunto.php?file={<?php echo $sigo_ticket[$I]['seq_sigo_ticket_id']; ?>}\"' />

		<?php }  ?>
				</td>
      </tr>
	<?php
				}
		}
?>
</table>
<script type='type/javascript'>
		document.getElementById('privado').disabled = true;
</script>
</body>
</html>
