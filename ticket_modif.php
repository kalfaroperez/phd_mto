<?PHP
/*
 * Nombre: ticket_modif.php Autor: Julio Tuozzo / jtuozzo@p-hd.com.ar Funci�n: Actualizaci�n de un ticket Function: Ticket update Ver: 2.12 Kennys modifico esto
 */

// # Verifico que se encuentre validado el usuario, si no es asi lo
// # dirijo a la pantalla de login.
// Verify that one is validated the user, if it is not therefore
// redirect to the screen of login.
session_start ();

require ('config.inc.php');
require ($Include . 'lang.inc');
require ('funciones.inc.php');



if (! isset ( $_SESSION ['PHD_NIVEL'] ) or $_SESSION ['PHD_NIVEL'] < 10) {
	include ($Include . 'login.inc');
	exit ();
}

// # Me conecto con la base de datos
// Database connect

$Conect = mysql_connect ( $Host, $Usuario, $Contrasena ) or die ( mysql_error () );
$Uso = mysql_select_db ( $Base ) or die ( mysql_error () );

$text_max_attach = conv_bytes ( $_SESSION [PHD_MAX_ATTACH] );
//echo "POST<pre>"; print_r($_POST); echo "</pre>";
//echo "GET<pre>"; print_r($_GET); echo "</pre>";
// # Depuro los GETs
// GETs sanitization

if (get_magic_quotes_gpc ()) {
	foreach ( $_GET as $clave => $valor ) {
		$_GET [$clave] = stripslashes ( $_GET [$clave] );
	}
}

foreach ( $_GET as $clave => $valor ) {
	$_GET [$clave] = trim ( htmlentities ( $_GET [$clave], ENT_QUOTES, "ISO-8859-1" ) );
}

// # Si esta seteada la variable $_POST['modificar'] o $_GET['modificar']
// # busco los datos del ticket en la base.
// If is set the variables $_POST['modificar'] or $_GET['modificar']
// search for the data of the ticket in the database.

if (isSet ( $_POST ['modificar'] ) or isSet ( $_GET ['modificar'] )) {
				if (isSet ( $_POST ['modificar'] )) {
					$seq_ticket_id = $_POST ['modificar'];
				} else {
					$seq_ticket_id = $_GET ['modificar'];
				}

				$query = "SELECT {$MyPHD}ticket.*, {$MyPHD}operador.ape_y_nom as operador_ape_y_nom, NOW() as hora_leido,
			                   {$MyPHD}area.nombre as nombre_area, COALESCE(seq_solicitud_id,0) as seq_solicitud_id
			             FROM {$MyPHD}ticket
			             INNER JOIN {$MyPHD}operador ON {$MyPHD}ticket.operador_id={$MyPHD}operador.operador_id
			             LEFT JOIN {$MyPHD}area ON {$MyPHD}ticket.area_id={$MyPHD}area.area_id
			             LEFT JOIN {$MyPHD}solicitud sol ON sol.seq_ticket_id={$MyPHD}ticket.seq_ticket_id
			             WHERE {$MyPHD}ticket.seq_ticket_id=$seq_ticket_id AND $Filtro_ticket ";

				$result = mysql_query ( $query ) or die ( mysql_error () );

				$row = mysql_fetch_array ( $result );
				/*echo "<pre>"; print_r($_POST);	echo "</pre>";
				echo "<pre>"; print_r($row);	echo "</pre>";die;*/
				// # Guardo en una variable global el n�mero de ticket que estoy trabajando
				// # para que si se abre otra ventana con un ticket y se cambian los valores
				// # de los campos no me deje despu�s guardar esta instancia, ya se me
				// # ocurrir� algo mejor para que trabajen las n ventanas.

				$_SESSION ['ACT_PHD_SEQ_TICKET_ID'] = $seq_ticket_id;

				// # Como la base de datos no maneja los lockeos para hacer el update,
				// # guardo el momento de lectura del registro y si al hacer el update
				// # esta hora es menor a la de update_datetime del registro quiere
				// # decir que hubo un cambio y no guarda las modificaciones de esta
				// # sesi�n.
				// As the data base does not handle the registry locks for update,
				// keep the date and time from reading of the registry and when doing
				// update his hour is smaller to the one of update_datetime of the registry
				// means that there was a change and does not keep the modifications from this session.

				$_SESSION ['PHD_HORA_LEIDO'] = $row ['hora_leido'];

				// # Le doy forma al vector de los datos
				// Formating the data vector.

				foreach ( $row as $clave => $valor ) {
					$row [$clave] = htmlentities ( $row [$clave], ENT_QUOTES, "ISO-8859-1" );
				}

				/*
				 * //Si el Estado del Ticket es TERMINADO, se debe poder guardar el ticket con calificaion echo "Estado $estado";die;
				 * if($estado == 'TERMINADO'){ $update .= "calificacion=$calificacion"; }
				 */

				// # inicializo las variables que voy a controlar si se modifican
				// Initializing the variables that going to control if there are changes.
				$piso = $_SESSION ['PHD_PISO'] = $row ['piso'];
				$telefono = $_SESSION ['PHD_TELEFONO'] = $row ['telefono'];
				$e_mail = $_SESSION ['PHD_USER_E_MAIL'] = $row ['e_mail'];
				$proceso = $_SESSION ['PHD_PROCESO'] = $row ['proceso'];
				$tipo_trabajo = $_SESSION ['PHD_TIPO_TRABAJO'] = $row ['tipo_trabajo'];
				//$tipo = $_SESSION ['PHD_TIPO'] = $row ['tipo'];
				//$sub_tipo = $_SESSION ['PHD_SUB_TIPO'] = $row ['sub_tipo'];
				$id_planta = $_SESSION ['PHD_ID_PLANTA'] = $row['id_planta'];
				$nombre_planta = $_SESSION ['PHD_NOMBRE_PLANTA'] = $data['nombre_planta'];

				$id_equipo_princ = $_SESSION ['PHD_ID_EQUIPO_PRINC'] = $row['id_equipo_princ'];
				$id_equipo_sec = $_SESSION ['PHD_ID_EQUIPO_SEC'] = $row['id_equipo_sec'];
				$id_componente = $_SESSION ['PHD_ID_COMPONENTE'] = $row['id_componente'];

				$estado = $_SESSION ['PHD_ESTADO'] = $row ['estado'];
				$prioridad = $_SESSION ['PHD_PRIORIDAD'] = $row ['prioridad'];
				$asignado_a = $_SESSION ['PHD_ASIGNADO_A'] = $row ['asignado_a'];
				$fecha_ultimo_estado = $_SESSION ['PHD_FECHA_ULTIMO_ESTADO'] = date ( "$Date_format H:i:s", strtotime ( $row ['fecha_ultimo_estado'] ) );

				$_SESSION ['PHD_SEQ_SOLICITUD_ID'] = $row ['seq_solicitud_id'];
				$calificacion = $_SESSION ['PHD_CALIFICACION'] = $row['calificacion'];
				$nivel =$_SESSION ['PHD_NIVEL'];

				$fecha_entrega = $_SESSION ['PHD_FECHA_ENTREGA'] = ($row ['fecha_entrega'] == "") ? "" : date ( "$Date_format", strtotime ($row ['fecha_entrega']));//date ( "Y/m/d", strtotime ( $row ['fecha_entrega'] ) );


//echo "<pre>";print_r($_SESSION);echo "</pre>";die;

				//Si es Administrador habilita los campos
				//Si no es Administrador se deben deshabilitar los campos.


				if ($row [privado] == "S") {
					$privado = $_SESSION ['PHD_PRIVADO'] = $row [privado];
					$private_check = "checked";
				} else {
					$privado = $_SESSION ['PHD_PRIVADO'] = "N";
					$private_check = "";
				}

				// # inicializo el resto de las variables
				// Initializing the rest of the variables.
				$seq_ticket_id = $row ['seq_ticket_id'];
				$fecha = date ( "$Date_format", strtotime ( $row ['fecha'] ) );
				$operador = $row ['operador_id'];
				$nombre_area = $row ['nombre_area'];
				$operador_ape_y_nom = $row ['operador_ape_y_nom'];
				$operador_sector_id = $row ['operador_sector_id'];
				$contacto = $row ['contacto'];
				$usuario = $row ['usuario_id'];
				$ape_y_nom = $row ['ape_y_nom'];
				$area_id = $row ['area_id'];
				$_SESSION ['MOD_PHD_INCIDENTE'] = str_replace ( chr ( 10 ), "<br>", str_replace ( chr ( 13 ), "", $row ['incidente'] ) );
				$nombre_adjunto = $row ['nombre_adjunto'];
				$ruta_adjunto = $row ['ruta_adjunto'];
				$operador_ultimo_estado = $row ['operador_ultimo_estado'];




				$disabled_field = '';
				$calificacion_disabled = '';
				/*
				if($nivel == 20){
						$disabled_field = '';

				}else {
						$disabled_field = 'disabled';
				}

				if(strlen($calificacion) > 0 && $calificacion != 'SIN_CALIFICAR'){
					$readonly_field = "readonly";
					$disabled_field = "disabled";
				}*/
				if($estado == 'Terminado'){
					$readonly_field = "readonly";
					$disabled_field = "disabled";

					if ($nivel == 20) { //Administrador
							$calificacion_disabled = 'disabled';
					}	else	{
						// Operador

						$calificacion_disabled = '';
						$disabled_field = "disabled";
					}
				}
			// # Veo si abre el adjunto
			// Check if open the attach
}elseif (isset ( $_POST ['adjunto'] )) {

				//global $Host,$Usuario,$Contrasena, $Base;

				/*$query = "SELECT * FROM {$MyPHD}ticket WHERE seq_ticket_id=$_POST[seq_ticket_id]";
				$result = mysql_query ( $query );
				$row = mysql_fetch_array ( $result );
				$tipo_adjunto = $row ['tipo_adjunto'];
				$adjunto = $row ['adjunto'];
				$nombre_adjunto = $row ['nombre_adjunto'];
				$ruta_adjunto = $row ['ruta_adjunto'];
				*/
				/*

				$nombre_archivo = $_GET["nombre_archivo"];
		    $seq_ticket_id_ = $_GET["id_ticket"];

		    descargar_archivo($seq_ticket_id_, $nombre_archivo);
				*/
				// Check if file already exists
				/*$target_dir = "D:/uploads/".$seq_ticket_id;
				if (file_exists($target_dir)) {
						//echo "Sorry, file already exists.";
						$files = scandir($target_dir,1);
						//echo "<pre>";print_r($files); echo "</pre>";die;
						for ($i=0; $i < count($files); $i++) {
							if ($files[$i] != ".." && $files[$i] != ".") {
									$nombre_adjunto  = $files[$i];

									if (strlen ( $nombre_adjunto ) > 0) {
											echo "$nombre_adjunto<br/>";
									}
							}
						}

				}

				header ( "Content-type: $tipo_adjunto" );
				header ( "Content-Disposition: attachment; filename='$nombre_adjunto'" );
				readfile($ruta_adjunto);
				echo $adjunto;
				exit ();*/

} else{
	//echo "</pre>"; die;
			// # inicializo las variables con lo que viene del formulario
			// Initializing the variables with the form data.
			// # Verifico si esta seteado magic_quotes_gpt para sacar la barra invertida (\)
			// Check if magic_quotes_gpt is setting On for delete the slash (\)

				if (get_magic_quotes_gpc ()) {
					foreach ( $_POST as $clave => $valor ) {
						$_POST [$clave] = stripslashes ( $_POST [$clave] );
					}
				}
				foreach ( $_POST as $clave => $valor ) {
					$_POST [$clave] = trim ( htmlentities ( $_POST [$clave], ENT_QUOTES, "ISO-8859-1" ) );
				}

				$seq_ticket_id = $_POST ['seq_ticket_id'];
				$fecha = $_POST ['fecha'];
				$fecha_sigo = $_POST ['fecha_sigo'];
				$operador = $_POST ['operador'];
				$operador_ape_y_nom = $_POST ['operador_ape_y_nom'];
				$operador_sector_id = $_POST ['operador_sector_id'];
				$contacto = $_POST ['contacto'];
				$ape_y_nom = $_POST ['ape_y_nom'];
				$area_id = $_POST ['area_id'];
				$piso = $_POST ['piso'];
				$telefono = $_POST ['telefono'];
				$e_mail = $_POST ['e_mail'];
				$incidente = $_POST ['incidente'];
				$comentario = $_POST ['comentario'];
				$visible = $_POST ['visible'];
				$tipo_trabajo = $_POST ['tipo_trabajo'];

				$id_planta = $_POST ['sel_planta'][0];
				$id_equipo_princ = $_POST ['sel_equipo_princ'][0];
				$id_equipo_sec = $_POST ['sel_equipo_sec'][0];
				$id_componente = $_POST ['sel_componente'][0];
				/*
				$prioridad = $_POST ['prioridad'];
				$asignado_a = $_POST ['asignado_a'];
				$proceso = $_POST ['proceso'];
				$tipo = $_POST ['tipo'];
				$nombre_adjunto = $_POST ['nombre_adjunto'];
				$sub_tipo = $_POST ['sub_tipo'];
				$estado = $_POST ['estado'];
				$calificacion_actual = $_POST ['calificacion'];
				$fecha_ultimo_estado = $_POST ['fecha_ultimo_estado'];
				*/

				$h_disabled_field = $_POST['h_disabled_field'];
				$prioridad 			 = ($h_disabled_field != 'disabled') ? $_POST ['prioridad'] : $_POST['h_prioridad'];
				$asignado_a 		 = ($h_disabled_field != 'disabled') ? $_POST ['asignado_a'] : $_POST['h_asignado_a'];
				$proceso 			 = ($h_disabled_field != 'disabled') ? $_POST ['proceso'] : $_POST['h_proceso'];
				$tipo 				 = ($h_disabled_field != 'disabled') ? $_POST ['tipo'] : $_POST['h_tipo'];
				$nombre_adjunto 	 = ($h_disabled_field != 'disabled') ? $_POST ['nombre_adjunto']: $_POST['h_nombre_adjunto'];
				$sub_tipo 			 = ($h_disabled_field != 'disabled') ? $_POST ['sub_tipo'] : $_POST['h_sub_tipo'];
				$estado 			 = ($h_disabled_field != 'disabled') ? $_POST ['estado'] : $_POST['h_estado'];
				$calificacion_actual = ($h_disabled_field != 'disabled') ? $_POST ['calificacion'] : $_POST['h_calificacion'];
				$fecha_ultimo_estado = ($h_disabled_field != 'disabled') ? $_POST ['fecha_ultimo_estado'] :	$_POST['h_fecha_ultimo_estado'];
				$fecha_entrega = $_POST ['fecha_entrega'];

				$operador_ultimo_estado = $_POST ['operador_ultimo_estado'];
				$usuario = $_POST ['usuario'];

				if ($_POST [privado] == "S") {
					$privado = $_POST [privado];
					$private_check = "checked='checked'";
				} else {
					$privado = "N";
					$private_check = "";
				}

				if ($_POST [visible] == "S" and strlen ( $comentario ) > 0) {
					$visible = $_POST [visible];
					$visible_check = "checked='checked'";
				} else {
					$visible = "N";
					$visible_check = "";
				}


				/*
				$s_archivo = $_FILES ["sigo_adjunto"] ["tmp_name"];
				$s_tamanio_adjunto = $_FILES ["sigo_adjunto"] ["size"];
				$s_tipo_adjunto = $_FILES ["sigo_adjunto"] ["type"];
				$s_nombre_adjunto = $_FILES ["sigo_adjunto"] ["name"];
				*/
}

// # Verfico que se haya ingresado por "guardar", si no es as� muestro
// # el formulario para ingresar la info del ticket.
// Verify that has been post 'guardar', if it is not thus show
// the form to enter info of the ticket

if (! isSet ( $_POST ['guardar'] )) {
	include ($Include . 'ticket_modif.inc');
	exit ();
}

// # Sector de validaciones de los campos ingresados
// validation of the inputs fields

if (strlen ( $e_mail ) > 0 and ! preg_match ( '#^.+@.+\\..+$#', $e_mail )){
	// # Verifica el formato del e-mail
	// verify the e-mail format
	$mensaje .= "<br /> $No_valid_e_mail";
}

if ($s_tamanio_adjunto > $_SESSION [PHD_MAX_ATTACH]) // verifico que el tama�o del archivo adjunto no sea mayor a $_SESSION[PHD_MAX_ATTACH].
{
	$Big_attach = str_replace ( "%1%", $text_max_attach, $Big_attach );
	$mensaje .= "<br> $Big_attach";
} elseif (strlen ( $s_nombre_adjunto ) > 1 and $s_tamanio_adjunto < 1) // valido que exista el archivo
{
	$No_attach = str_replace ( "%1%", " $s_nombre_adjunto ", $No_attach );
	$mensaje = $mensaje . "<br> $No_attach";
}

if (strlen ( $asignado_a ) == 0 and $_SESSION ['PHD_ASSIGN_TICKET'] == "S") {
	$mensaje .= "<br /> $No_assign";
}

if (! fecha_valida ( $fecha_ultimo_estado )) // # Verfico que el formato de la fecha de ultimo estado sea v�lido
                                             // Verify the format of the last state date
{
	$mensaje .= "<br /> $No_valid_format_lsd";
}

elseif (strtotime ( fecha_mysql ( $fecha ) ) > strtotime ( fecha_mysql ( $fecha_ultimo_estado ) )) {
	$mensaje = $mensaje . "<br> $Lsd_lower_date";
}

/*if (! fecha_valida ( $fecha_entrega )) // # Verfico que el formato de la fecha de ultimo estado sea v�lido
                                             // Verify the format of the last state date
{
	$mensaje .= "<br /> $No_valid_format_lsd";
}

elseif (strtotime ( fecha_mysql ( $fecha ) ) > strtotime ( fecha_mysql ( $fecha_entrega ) )) {
	$mensaje = $mensaje . "<br> $Lsd_lower_date";
}
*/

if (strlen ( $proceso ) < 1) {
	$mensaje .= "<br /> $No_process ";
}

if (strlen ( $id_planta ) < 1) {
	$mensaje .= "<br /> No ha seleccionado una planta ";
}

if (strlen ( $id_equipo_princ ) < 1) {
	$mensaje .= "<br /> No ha seleccionado un Equipo Principal ";
}


if ($privado == "S" and strlen ( $asignado_a ) > 0){
	// # Si es privado verifico que no se haya asignado a un operador de otro sector
	// If is private verify that doesn't assigned to other sector operator.

		$query = "SELECT *
	              FROM {$MyPHD}operador
	              WHERE operador_id='$asignado_a'";

		$result = mysql_query ( $query ) or die ( mysql_error () );
		$row = mysql_fetch_array ( $result );
		$aux_operador_sector_id = $row ['sector_id'];

		if ($aux_operador_sector_id != $_SESSION [PHD_SECTOR_ID]) {
			$mensaje .= "<br /> $Cant_assign_private";
		}
}

// # Valido que todav�a sigan en $_SESSION los atributos del actual registro

if ($_SESSION ['ACT_PHD_SEQ_TICKET_ID'] != $seq_ticket_id) {
	$Other_win_open = str_replace ( "%1%", $_SESSION ['ACT_PHD_SEQ_TICKET_ID'], $Other_win_open );
	$mensaje = "<br /> $Other_win_open";
}


//Validacion del archivo
$files = $_FILES;
if (isset($files['adjunto'])) {
		$file_ary = reArrayFiles($files['adjunto']);
		$dir_upload = "D:/uploads/".$seq_ticket_id."/"; //$_SERVER['DOCUMENT_ROOT']."/phd_mto/uploads/".$seq_ticket_id."/";

		foreach ($file_ary as $file) {
			$target_dir = $dir_upload;
			$target_file = $target_dir . basename($file["name"]);

			$uploadOk = 1;
			$FileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
			// Check file size
			if ($file["size"] > 5000000) {
					$mensaje .= "El archivo supera el tamaño establecido (5Mb).";
					$uploadOk = 0;
			}

			$tipos = array(
				'jpg' => 'jpg',
				'png' =>  'png',
				'jpeg' => 'jpeg',
				'gif' =>  'gif',
				'jpeg' => 'jpeg',
				'pdf' =>  'pdf',
				'doc' =>  'doc',
				'docx' => 'docx',
				'xlx' =>  'xlx',
				'xlsx' => 'xlsx',
				'csv' =>  'csv',
				'ppt' =>  'ppt',
				'pptx' => 'pptx',
				'txt'=> 'txt');
			// Allow certain file formats
			$ext_perm ="";
			if(in_array($FileType, $tipos, true)) {
			}else{

					foreach ($tipos as $key => $value) {
						 $ext_perm .=$value.", ";
					}
					$mensaje .= "Archivo invalido. Solo es permitido las siguientes extensiones: $ext_perm<br/>";
					$uploadOk = 0;
			}

			// Check if $uploadOk is set to 0 by an error
			if ($uploadOk == 0) {
					$mensaje .= "Su archivo no ha sido cargado. Error al subir archivo. ";
			// if everything is ok, try to upload file
			}
		}
	}

//

if (isSet ( $mensaje )){
		// # Hay errores, los muestro y no proceso el ticket
		// There are errors, show it and don't proccess the ticket.

		$mensaje = "$UPR_error_found" . $mensaje;
		include ($Include . 'ticket_modif.inc');
		exit ();

}else{

					// # No hubo errores, verifico que no se haya actualizado el ticket mientras estuvo
					// # en pantalla.
					// were no errors, verify that the ticket has not been updated while it was in screen

					$query = "SELECT {$MyPHD}ticket.update_datetime, {$MyPHD}ticket.update_oper, {$MyPHD}operador.ape_y_nom
					            FROM {$MyPHD}ticket, {$MyPHD}operador
					            WHERE seq_ticket_id=$seq_ticket_id AND
					            {$MyPHD}ticket.update_oper={$MyPHD}operador.operador_id";

					$result = mysql_query ( $query ) or die ( mysql_error () );

					$row = mysql_fetch_array ( $result );
					$update_datetime = $row ['update_datetime'];

					/*if ($_SESSION ['PHD_HORA_LEIDO'] <= $update_datetime){
						// # El registro se actualiza desde que lo
						// # leo, no se puede guardar la actualizaci�n
					  // The record was updated after there was read,
					  // its not possible update it.

						$mensaje = "$Was_updated_1 {$row['update_oper']} - {$row['ape_y_nom']}, $Was_updated_2";
						echo "<pre>";print_r($_POST);print_r($_FILES); echo "Hora Update $update_datetime";print_r($_SESSION);echo "</pre>";die;
						include ($Include . 'ticket_modif.inc');
						exit ();
					}*/

					// # verifico si hubo cambios y hago el update del ticket y guardo los datos para el seguimiento.
					// verify that were changes and do the update to the follow up of the ticket.

					// # Veo si hay adjunto y lo proceso
					// Check if has attach and proccess it.

					if (strlen ( $s_archivo ) > 1) {
						$fp = fopen ( $s_archivo, "rb" );
						$s_adjunto = fread ( $fp, $s_tamanio_adjunto );
						$s_adjunto = addslashes ( $s_adjunto );
						fclose ( $fp );
					}

					$comentario = mysql_real_escape_string ( html_entity_decode ( $comentario, ENT_QUOTES, "ISO-8859-1" ) );
					$fecha_sigo = fecha_mysql ( $fecha_sigo );

					$update = "UPDATE {$MyPHD}ticket SET ";

					$result = mysql_query ( "START TRANSACTION" ) or die ( mysql_error () );

					if ($piso != $_SESSION ['PHD_PISO']) {
							$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
					                (NULL,
					                 $seq_ticket_id,
					                 '$fecha_sigo',
					                 '$_SESSION[PHD_OPERADOR]',
					                 null,
					                 '$Floor',
					                 '$_SESSION[PHD_PISO]',
					                 '$piso',
					                 '$comentario',
					                 '$visible',
					                 '$s_adjunto',
					                 '$s_tipo_adjunto',
					                 '$s_nombre_adjunto',
					                 '$_SESSION[PHD_OPERADOR]',
					                 null,
					                 NOW())";

							$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
							$insert = mysql_query ( $query ) or die ( mysql_error () );
							$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
							$update .= "piso='$piso', "; // agrego la l�nea para el update de ticket
					}

					if ($telefono != $_SESSION ['PHD_TELEFONO']) {
							$telefono = mysql_real_escape_string ( html_entity_decode ( $telefono, ENT_QUOTES, "ISO-8859-1" ) );
							$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
					                (NULL,
					                 $seq_ticket_id,
					                 '$fecha_sigo',
					                 '$_SESSION[PHD_OPERADOR]',
					                 null,
					                 '$Phone',
					                 '$_SESSION[PHD_TELEFONO]',
					                 '$telefono',
					                 '$comentario',
					                 '$visible',
					                 '$s_adjunto',
					                 '$s_tipo_adjunto',
					                 '$s_nombre_adjunto',
					                 '$_SESSION[PHD_OPERADOR]',
					                 null,
					                 NOW())";

							$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
							$insert = mysql_query ( $query ) or die ( mysql_error () );
							$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
							$update .= "telefono='$telefono', "; // agrego la l�nea para el update de ticket
					}

					if ($e_mail != $_SESSION ['PHD_USER_E_MAIL']) {
							$e_mail = mysql_real_escape_string ( html_entity_decode ( $e_mail, ENT_QUOTES, "ISO-8859-1" ) );
							$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
				                (NULL,
				                 $seq_ticket_id,
				                 '$fecha_sigo',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 '$Elec_mail',
				                 '$_SESSION[PHD_USER_E_MAIL]',
				                 '$e_mail',
				                 '$comentario',
				                 '$visible',
				                 '$s_adjunto',
				                 '$s_tipo_adjunto',
				                 '$s_nombre_adjunto',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 NOW())";

						$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
						$insert = mysql_query ( $query ) or die ( mysql_error () );
						$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
						$update .= "e_mail='$e_mail', "; // agrego la l�nea para el update de ticket
					}

					if ($prioridad != $_SESSION ['PHD_PRIORIDAD']) {
						$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
				                (NULL,
				                 $seq_ticket_id,
				                 '$fecha_sigo',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 '$Priority',
				                 '$_SESSION[PHD_PRIORIDAD]',
				                 '$prioridad',
				                 '$comentario',
				                 '$visible',
				                 '$s_adjunto',
				                 '$s_tipo_adjunto',
				                 '$s_nombre_adjunto',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 NOW())";

						$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
						$insert = mysql_query ( $query ) or die ( mysql_error () );
						$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
						$update .= "prioridad='$prioridad', "; // agrego la l�nea para el update de ticket
					}

					if ($asignado_a != $_SESSION ['PHD_ASIGNADO_A']) {
							$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
				                (NULL,
				                 $seq_ticket_id,
				                 '$fecha_sigo',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 '$Assigned_to',
				                 '$_SESSION[PHD_ASIGNADO_A]',
				                 '$asignado_a',
				                 '$comentario',
				                 '$visible',
				                 '$s_adjunto',
				                 '$s_tipo_adjunto',
				                 '$s_nombre_adjunto',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 NOW())";

						$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
						$insert = mysql_query ( $query ) or die ( mysql_error () );
						$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
						$update .= "asignado_a='$asignado_a', "; // agrego la l�nea para el update de ticket

						send_ticket ( $asignado_a, $seq_ticket_id, $Filtro_ticket );

						// # Busco el sector asignado
						// Search the assigned sector

						$query = "SELECT sector_id
				                 FROM {$MyPHD}operador
				                 WHERE operador_id='$asignado_a'";
						$result = mysql_query ( $query ) or die ( mysql_error () );
						$row = mysql_fetch_array ( $result );
						$asignado_a_sector = $row ['sector_id'];
						$update .= "asignado_a_sector='$asignado_a_sector', "; // agrego la l�nea para el update de ticket
					}

					if ($privado != $_SESSION ['PHD_PRIVADO']) {
						if ($privado == "S") {
							$new_privado = $Yes;
							$old_privado = $No;
						} else {
							$new_privado = $No;
							$old_privado = $Yes;
						}

						$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
				                (NULL,
				                 $seq_ticket_id,
				                 '$fecha_sigo',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 '$Private',
				                 '$old_privado',
				                 '$new_privado',
				                 '$comentario',
				                 '$visible',
				                 '$s_adjunto',
				                 '$s_tipo_adjunto',
				                 '$s_nombre_adjunto',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 NOW())";

						$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
						$insert = mysql_query ( $query ) or die ( mysql_error () );
						$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
						$update .= "privado='$privado', "; // agrego la l�nea para el update de ticket
				}

				if ($proceso != $_SESSION ['PHD_PROCESO']) {
					if (strlen ( $_SESSION ['PHD_PROCESO'] ) > 0) {
						$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
			                (NULL,
			                 $seq_ticket_id,
			                 '$fecha_sigo',
			                 '$_SESSION[PHD_OPERADOR]',
			                 null,
			                 '$Process',
			                 '$_SESSION[PHD_PROCESO]',
			                 '$proceso',
			                 '$comentario',
			                 '$visible',
			                 '$s_adjunto',
			                 '$s_tipo_adjunto',
			                 '$s_nombre_adjunto',
			                 '$_SESSION[PHD_OPERADOR]',
			                 null,
			                 NOW())";

						$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
						$insert = mysql_query ( $query ) or die ( mysql_error () );
						$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
					}
					$update .= "proceso='$proceso', "; // agrego la l�nea para el update de ticket
				}
				if ($tipo_trabajo != $_SESSION [' ']) {
					if (strlen ( $_SESSION ['PHD_TIPO_TRABAJO'] ) > 0) {
						$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
			                (NULL,
			                 $seq_ticket_id,
			                 '$fecha_sigo',
			                 '$_SESSION[PHD_OPERADOR]',
			                 null,
			                 '$Process',
			                 '$_SESSION[PHD_TIPO_TRABAJO]',
			                 '$tipo_trabajo',
			                 '$comentario',
			                 '$visible',
			                 '$s_adjunto',
			                 '$s_tipo_adjunto',
			                 '$s_nombre_adjunto',
			                 '$_SESSION[PHD_OPERADOR]',
			                 null,
			                 NOW())";

						$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
						$insert = mysql_query ( $query ) or die ( mysql_error () );
						$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
					}
					$update .= "tipo_trabajo='$tipo_trabajo', "; // agrego la l�nea para el update de ticket
				}


				if ($id_planta != $_SESSION ['PHD_ID_PLANTA']) {
					if (strlen ( $_SESSION ['PHD_ID_PLANTA'] ) > 0) {
						$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
			                (NULL,
			                 $seq_ticket_id,
			                 '$fecha_sigo',
			                 '$_SESSION[PHD_OPERADOR]',
			                 null,
			                 'Planta',
			                 '$_SESSION[PHD_ID_PLANTA]',
			                 '$id_planta',
			                 '$comentario',
			                 '$visible',
			                 '$s_adjunto',
			                 '$s_tipo_adjunto',
			                 '$s_nombre_adjunto',
			                 '$_SESSION[PHD_OPERADOR]',
			                 null,
			                 NOW())";

						$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
						$insert = mysql_query ( $query ) or die ( mysql_error () );
						$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
					}
					$update .= "id_planta='$id_planta', "; // agrego la l�nea para el update de ticket
				}

				if ($id_equipo_princ != $_SESSION ['PHD_ID_EQUIPO_PRINC']) {
					if (strlen ( $_SESSION ['PHD_ID_EQUIPO_PRINC'] ) > 0) {
							$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
				                (NULL,
				                 $seq_ticket_id,
				                 '$fecha_sigo',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 'Equipo Principal',
				                 '$_SESSION[PHD_ID_EQUIPO_PRINC]',
				                 '$id_equipo_princ',
				                 '$comentario',
				                 '$visible',
				                 '$s_adjunto',
				                 '$s_tipo_adjunto',
				                 '$s_nombre_adjunto',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 NOW())";

							$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
							$insert = mysql_query ( $query ) or die ( mysql_error () );
							$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
						}
						$update .= "id_equipo_princ='$id_equipo_princ', "; // agrego la l�nea para el update de ticket
				}

				if ($id_equipo_sec != $_SESSION ['PHD_ID_EQUIPO_SEC']) {
					if (strlen ( $_SESSION ['PHD_ID_EQUIPO_SEC'] ) > 0) {
							$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
				                (NULL,
				                 $seq_ticket_id,
				                 '$fecha_sigo',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 'Equipo Secundario',
				                 '$_SESSION[PHD_ID_EQUIPO_SEC]',
				                 '$id_equipo_sec',
				                 '$comentario',
				                 '$visible',
				                 '$s_adjunto',
				                 '$s_tipo_adjunto',
				                 '$s_nombre_adjunto',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 NOW())";

							$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
							$insert = mysql_query ( $query ) or die ( mysql_error () );
							$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
						}
						$update .= "id_equipo_sec='$id_equipo_sec', "; // agrego la l�nea para el update de ticket
				}

				if ($id_componente != $_SESSION ['PHD_ID_COMPONENTE']) {
					if (strlen ( $_SESSION ['PHD_ID_COMPONENTE'] ) > 0) {
							$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
				                (NULL,
				                 $seq_ticket_id,
				                 '$fecha_sigo',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 'Componente',
				                 '$_SESSION[PHD_ID_COMPONENTE]',
				                 '$id_componente',
				                 '$comentario',
				                 '$visible',
				                 '$s_adjunto',
				                 '$s_tipo_adjunto',
				                 '$s_nombre_adjunto',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 NOW())";

							$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
							$insert = mysql_query ( $query ) or die ( mysql_error () );
							$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
						}
						$update .= "id_componente='$id_componente', "; // agrego la l�nea para el update de ticket
				}

				if ($estado != $_SESSION ['PHD_ESTADO']) {
							$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
					                (NULL,
					                 $seq_ticket_id,
					                 '$fecha_sigo',
					                 '$_SESSION[PHD_OPERADOR]',
					                 null,
					                 '$State',
					                 '$_SESSION[PHD_ESTADO]',
					                 '$estado',
					                 '$comentario',
					                 '$visible',
					                 '$s_adjunto',
					                 '$s_tipo_adjunto',
					                 '$s_nombre_adjunto',
					                 '$_SESSION[PHD_OPERADOR]',
					                 null,
					                 NOW())";

							$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
							$insert = mysql_query ( $query ) or die ( mysql_error () );
							$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.
							$update .= "estado='$estado', "; // agrego la l�nea para el update de ticket

							// Paso la fechas a formato MySQL/GNU
							$fecha_ultimo_estado = fecha_mysql ( $fecha_ultimo_estado );
							$update .= "fecha_ultimo_estado='$fecha_ultimo_estado', "; // agrego la l�nea para el update de ticket

							$operador_ultimo_estado = $_SESSION [PHD_OPERADOR];

							$update .= "operador_ultimo_estado='$operador_ultimo_estado', "; // agrego la l�nea para el update de ticket
					}	elseif ($fecha_ultimo_estado != $_SESSION ['PHD_FECHA_ULTIMO_ESTADO']) {
							$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
					                    (NULL,
					                     $seq_ticket_id,
					                     '$fecha_sigo',
					                     '$_SESSION[PHD_OPERADOR]',
					                     null,
					                     '$Last_state_date',
					                     '$_SESSION[PHD_FECHA_ULTIMO_ESTADO]',
					                     '$fecha_ultimo_estado',
					                     '$comentario',
					                     '$visible',
					                     '$s_adjunto',
					                     '$s_tipo_adjunto',
					                     '$s_nombre_adjunto',
					                     '$_SESSION[PHD_OPERADOR]',
					                     null,
					                     NOW())";

							$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
							$insert = mysql_query ( $query ) or die ( mysql_error () );
							$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.

							// Paso la fechas a formato MySQL/GNU
							$fecha_ultimo_estado = fecha_mysql ( $fecha_ultimo_estado );
							$update .= "fecha_ultimo_estado='$fecha_ultimo_estado', "; // agrego la l�nea para el update de ticket

					}

					if ($fecha_entrega != $_SESSION ['PHD_FECHA_ENTREGA']) {
							$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
					                    (NULL,
					                     $seq_ticket_id,
					                     '$fecha_sigo',
					                     '$_SESSION[PHD_OPERADOR]',
					                     null,
					                     'Fecha de Entrega',
					                     '$_SESSION[PHD_FECHA_ENTREGA]',
					                     '$fecha_entrega',
					                     '$comentario',
					                     '$visible',
					                     '$s_adjunto',
					                     '$s_tipo_adjunto',
					                     '$s_nombre_adjunto',
					                     '$_SESSION[PHD_OPERADOR]',
					                     null,
					                     NOW())";

							$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
							$insert = mysql_query ( $query ) or die ( mysql_error () );
							$s_adjunto = $s_tipo_adjunto = $s_nombre_adjunto = $comentario = ''; // Vac�o el comentario y el adjunto para que no lo grabe varias veces.

							// Paso la fechas a formato MySQL/GNU
							$fecha_entrega = fecha_mysql ( $fecha_entrega );
							$update .= "fecha_entrega='$fecha_entrega', "; // agrego la l�nea para el update de ticket
					}

					// Verifico si comentario o el adjunto tienen contenido, si es as�, los guardo

					if (strlen ( $comentario ) > 0 or strlen ( $s_nombre_adjunto ) > 0) {
							$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
				                (NULL,
				                 $seq_ticket_id,
				                 '$fecha_sigo',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 '$Comment',
				                 null,
				                 null,
				                 '$comentario',
				                 '$visible',
				                 '$s_adjunto',
				                 '$s_tipo_adjunto',
				                 '$s_nombre_adjunto',
				                 '$_SESSION[PHD_OPERADOR]',
				                 null,
				                 NOW())";

							$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
							$insert = mysql_query ( $query ) or die ( mysql_error () );
					}

					$calificacion_ant = $_SESSION['PHD_CALIFICACION'];

					if($calificacion_actual != $_SESSION['PHD_CALIFICACION'] && $calificacion_actual != 'SIN_CALIFICAR' && $_POST['estado'] == 'TERMINADO'){

							$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
					                    (NULL,
					                     $seq_ticket_id,
					                     '$fecha_sigo',
					                     '$_SESSION[PHD_OPERADOR]',
					                     null,
					                     '$Calificacion_txt',
					                     '$calificacion_ant',
					                     '$calificacion_actual',
					                     '$comentario',
					                     '$visible',
					                     '$s_adjunto',
					                     '$s_tipo_adjunto',
					                     '$s_nombre_adjunto',
					                     '$_SESSION[PHD_OPERADOR]',
					                     null,
					                     NOW())";

													$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
													$insert = mysql_query ( $query ) or die ( mysql_error () );

													// Verifico que se haya cambiado alg�n campo de "ticket" para hacer el update
													// me doy cuenta porque aparece una coma en la variable $update
													$update .= "calificacion= '$calificacion_actual', ";
						}

						$donde_hay_coma = strrpos ( $update, "," );
						if ($donde_hay_coma > 0) {
							$update .= " update_oper='$_SESSION[PHD_OPERADOR]', update_datetime=NOW() WHERE seq_ticket_id=$seq_ticket_id";

							$actualizo = mysql_query ( $update ) or die ( mysql_error () );
						}
						$result = mysql_query ( "COMMIT" ) or die ( mysql_error () );
						if ($visible == 'S') {
							send_comment ( $seq_ticket_id );
						}

						if ($result != 0) {
							$mensaje_adj = guardarArchivoAdjunto_onServer($_FILES, $seq_ticket_id);

						}


						//echo "<script language='JavaScript'>window.close();</script>";

							header ( "Location: ticket_modif.php?modificar=$seq_ticket_id&exito=s" );

}

function descargar_archivo($seq_ticket_id_, $nombre_archivo)
{
  $target_dir = "D:/uploads/".$seq_ticket_id_;
  $file_ = "D:/uploads/".$seq_ticket_id_."/".$nombre_archivo;
  $mime_type = mime_content_type($file_);
  if (file_exists($file_)) {
    $files = scandir($file_,1);

    echo "entre";;
    header ( "Content-type: $mime_type" );
    header ( "Content-Disposition: attachment; filename='$file_'" );
    readfile($file_);
    echo $file_;
    exit ();
  }
}

function reArrayFiles(&$file_post) {

	$file_ary = array();
	$file_count = count($file_post['name']);
	$file_keys = array_keys($file_post);

	for ($i=0; $i<$file_count; $i++) {
			foreach ($file_keys as $key) {
					$file_ary[$i][$key] = $file_post[$key][$i];
			}
	}

	return $file_ary;
}

function guardarArchivoAdjunto_onServer($files, $seq_ticket_id){

if (isset($files['adjunto'])) {

	    $file_ary = reArrayFiles($files['adjunto']);
      $dir_upload = "D:/uploads/".$seq_ticket_id."/"; //$_SERVER['DOCUMENT_ROOT']."/phd_mto/uploads/".$seq_ticket_id."/";
			if (file_exists($dir_upload)) {

			}else {
				mkdir($dir_upload, 0777);
			}

	    foreach ($file_ary as $file) {
				$target_dir = $dir_upload;
				$target_file = $target_dir . basename($file["name"]);
				$nombre_archivo = $seq_ticket_id."_".basename($file["name"]);

				$uploadOk = 1;
				$FileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

				// Check if image file is a actual image or fake image
				/*if(isset($_POST["submit"])) {
					check = getimagesize($file["adjunto"]["tmp_name"]);
					if($check !== false) {
							echo "File is an image - " . $check["mime"] . ".";
							$uploadOk = 1;
					} else {
							echo "File is not an image.";
							$uploadOk = 0;
					}


				}*/

				// Check if file already exists
				if (file_exists($target_file)) {
						//echo "Sorry, file already exists.";
						unlink($target_file);
						//$uploadOk = 0;
				}

				// Check file size
				if ($file["size"] > 5000000) {
						$mensaje .= "El archivo supera el tamaño establecido (5Mb).";
						$uploadOk = 0;
				}

				$tipos = array(
					'jpg' => 'jpg',
					'png' =>  'png',
					'jpeg' => 'jpeg',
					'gif' =>  'gif',
					'jpeg' => 'jpeg',
					'pdf' =>  'pdf',
					'doc' =>  'doc',
					'docx' => 'docx',
					'xlx' =>  'xlx',
					'xlsx' => 'xlsx',
					'csv' =>  'csv',
					'ppt' =>  'ppt',
					'pptx' => 'pptx',
					'txt'=> 'txt');
				// Allow certain file formats
				$ext_perm ="";
				if(in_array($FileType, $tipos, true)) {
				}else{

						foreach ($tipos as $key => $value) {
							 $ext_perm .=$value.", ";
						}
						$mensaje .= "Archivo invalido. Solo es permitido las siguientes extensiones: $ext_perm<br/>";
						$uploadOk = 0;
				}

				// Check if $uploadOk is set to 0 by an error
				if ($uploadOk == 0) {
						$mensaje .= "Su archivo no ha sido cargado. Error al subir archivo. ";
				// if everything is ok, try to upload file
				} else {
						$info_archivo = array('nombre' => $nombre_archivo,
																'tipo_archivo' => $FileType,
																'ruta_archivo' => $target_file);


						if (move_uploaded_file($file["tmp_name"], $target_file)) {
								$mensaje .= "El archivo nombre ". basename( $nombre_archivo). " ha sido cargado exitosamente.";
						} else {
								$mensaje .= "Su archivo no ha sido cargado. Error al subir archivo.";
						}

       }
	   }
  }
	return $mensaje;
}
?>
