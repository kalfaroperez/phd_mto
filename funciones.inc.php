<?PHP
/*
 * Nombre: funciones.inc.php Autor: Julio Tuozzo Funci�n: Funciones de uso com�n en PHP. Function: Functions of use common in PHP. Ver: 2.12
 */
// # fecha_mysql (fecha en formato dd/mm/yyyy hh:mm:ss)
// # pasa la fecha en formato espa�ol al formato de MySQL/GNU
// # yyyy-mm-dd hh:mm:ss

// fecha_mysql (date in format dd/mm/yyyy hh:mm:ss)
// passes the date in spanish format to the format of MySQL/GNU
// yyyy-mm-dd hh:mm:ss
function fecha_mysql($fecha) {
	if (fecha_valida ( $fecha )) {
		switch ($_SESSION ['PHD_DATE_FORMAT']) {
			case "DMA" :
				$fecha = substr ( $fecha, 6, 4 ) . '-' . substr ( $fecha, 3, 2 ) . '-' . substr ( $fecha, 0, 2 ) . substr ( $fecha, 10 );
				break;

			case "MDA" :
				$fecha = substr ( $fecha, 6, 4 ) . '-' . substr ( $fecha, 0, 2 ) . '-' . substr ( $fecha, 3, 2 ) . substr ( $fecha, 10 );
				break;

			case "AMD" :
				$fecha = substr ( $fecha, 0, 4 ) . '-' . substr ( $fecha, 5, 2 ) . '-' . substr ( $fecha, 8, 2 ) . substr ( $fecha, 10 );
				break;

			default :
				$fecha = substr ( $fecha, 6, 4 ) . '-' . substr ( $fecha, 3, 2 ) . '-' . substr ( $fecha, 0, 2 ) . substr ( $fecha, 10 );
		}
	} else {
		$fecha = "";
	}
	return $fecha;
}

// # fecha_valida (fecha en formato dd/mm/yyyy hh:mm:ss)
// # valida si la fecha y la hora (si existe) tienen un formato
// # v�lido.
// fecha_valida (date in format dd/mm/yyyy hh:mm:ss)
// been worth if the date and the hour (if it exists) have a valid format.
function fecha_valida($fecha_hora) {
	list ( $fecha, $hora ) = explode ( " ", $fecha_hora ); // # separo la fecha de la hora.
	                                               // separate the date of the hour.

	if (strlen ( trim ( $fecha ) ) > 10) 	// # La fecha y la hora no estaban separadas por espacio
	{
		return false; // The date and the hour were not separated of space
	}

	// # controlo si la fecha tiene un formato v�lido y separo d�a, mes y anio en variables identificables
	// date valid format control and separate day, month and anio in identifiable variables

	switch ($_SESSION ['PHD_DATE_FORMAT']) {
		case "DMA" :
			if (! preg_match ( '#([0-9]{2})/([0-9]{2})/([0-9]{4})#', $fecha, $array_fecha )) {
				return false;
			}
			list ( $fecha, $dia, $mes, $anio ) = $array_fecha;
			break;

		case "MDA" :
			if (! preg_match ( '#([0-9]{2})/([0-9]{2})/([0-9]{4})#', $fecha, $array_fecha )) {
				return false;
			}
			list ( $fecha, $mes, $dia, $anio ) = $array_fecha;
			break;

		case "AMD" :
			if (! preg_match ( '#([0-9]{4})/([0-9]{2})/([0-9]{2})#', $fecha, $array_fecha )) {
				return false;
			}
			list ( $fecha, $anio, $mes, $dia ) = $array_fecha;
			break;

		default :
			if (! preg_match ( '#([0-9]{2})/([0-9]{2})/([0-9]{4})#', $fecha, $array_fecha )) {
				return false;
			}
			list ( $fecha, $dia, $mes, $anio ) = $array_fecha;
	}

	if ($mes < 1 or $mes > 12) 	// # valido el mes
	{
		return false; // check the month
	}

	// # Valido los d�as de Febrero
	// Been worth the days of February
	if (anio_bisiesto ( $anio )) {
		$febrero = 29;
	} else {
		$febrero = 28;
	}

	if (($mes == 2) and (($dia < 1) or ($dia > $febrero))) {
		return false;
	}

	// # Valido los meses de 30 d�as
	// Been worth the 30 days months

	if ((($mes == 4) or ($mes == 6) or ($mes == 9) or ($mes == 11)) and (($dia < 1) or ($dia > 30))) {
		return false;
	}

	// # Valido los meses de 31 d�as
	// Been worth the 31 days months

	if ((($mes == 1) or ($mes == 3) or ($mes == 5) or ($mes == 7) or ($mes == 8) or ($mes == 10) or ($mes == 12)) and (($dia < 1) or ($dia > 31))) {
		return false;
	}

	// # Me fijo si hay hora y la valido
	// Been worth the hour
	if (strlen ( trim ( $hora ) ) > 0) {
		if (! preg_match ( '#([0-9]{2}):([0-9]{2}):([0-9]{2})#', $hora, $array_hora )) 		// veo si la hora tiene un formato v�lido
		{
			return false;
		}
	}
	list ( $hora, $hor, $min, $seg ) = $array_hora; // separo horas, minutos y segundos en variables identificables

	if ($hor < 0 or $hor > 23) 	// valido la hora
	{
		return false;
	}

	if ($min < 0 or $min > 59) 	// valido los minutos
	{
		return false;
	}

	if ($seg < 0 or $seg > 59) 	// valido los segundos
	{
		return false;
	}

	return true;
}

// ### anio_bisiesto(a�o)
// ### valida si un a�o es bisiesto o no
function anio_bisiesto($anio) {
	if ($anio % 4 != 0) {
		return false;
	} else {
		if ($anio % 100 == 0) {
			if ($anio % 400 == 0) {
				return true;
			} else {
				return false;
			}
		} else {
			return true;
		}
	}
}

// # conv_bytes($bytes)
// # Convierte cantidad de bytes en Kb. o Mb.
// Convert amount of bytes in Kb. or Mb.
function conv_bytes($bytes) {
	if ($bytes > 1000000) {
		$aux_bytes = intval ( $bytes / 1000000 );
		$text_bytes = "$aux_bytes Mb.";
	} elseif ($bytes > 1000) {
		$aux_bytes = intval ( $bytes / 1000 );
		$text_bytes = "$aux_bytes Kb.";
	} else {
		$text_bytes = "$bytes bytes";
	}
	return $text_bytes;
}

// # Variable con la condici�n para que los registros de la tabla 'ticket'
// # se vean si no son privados o el operador es del sector
// Variable with the condition for the records of the table 'ticket' are
// visible when the ticket does not private or the operator belong
// to the sector of it.

$Filtro_ticket = " ({$MyPHD}ticket.privado='N' or {$MyPHD}ticket.operador_sector_id='$_SESSION[PHD_SECTOR_ID]') ";

// # send_ticket ($operador, $seq_ticket_id, $filtro)
// # Envia un correo con el ticket $seq_ticket_id a $operador.
// Send an e-mail with the $seq_ticket_id ticket to $operador
function send_ticket($operador, $seq_ticket_id, $filtro)

{ // # Busco el registro del que le asignaron el ticket para ver si hay que
  // # avisarle por correo y levantar la direcci�n de e_mail
  // Search the assigned ticket to see if it's must to send the e-mail
	require ('config.inc.php');
	require ($Include . 'lang.inc');

	$query = "SELECT * from {$MyPHD}operador
             WHERE operador_id='$operador'
             AND avisar_asignado='S'";

	$result = mysql_query ( $query ) or die ( mysql_error () );
	$q_filas = mysql_num_rows ( $result );

	if ($q_filas != 1) {
		return false;
	}
	$row = mysql_fetch_array ( $result );
	$para = $row [e_mail];
	$ape_y_nom = $row ['ape_y_nom'];

	$Alert_assign_head = str_replace ( "%1%", $seq_ticket_id, $Alert_assign_head );
	$Alert_assign_head = str_replace ( "%2%", $operador, $Alert_assign_head );
	$Alert_assign_head = str_replace ( "%3%", $row [ape_y_nom], $Alert_assign_head );

	$asunto = $Alert_assign_head;

	// # Busco el ticket
	// Search the ticket

	$query = "SELECT * from {$MyPHD}ticket
             WHERE seq_ticket_id=$seq_ticket_id
             AND $filtro";

	$result = mysql_query ( $query ) or die ( mysql_error () );
	$q_filas = mysql_num_rows ( $result );

	if ($q_filas != 1) {
		return false;
	}

	$row = mysql_fetch_array ( $result );
	$fecha = date ( 'd/m/Y H:i:s', strtotime ( $row ['fecha'] ) );

	// # Cuerpo del mensaje en HTML
	// HTML body message

	if (get_magic_quotes_gpc ()) {
		foreach ( $row as $clave => $valor ) {
			$row [$clave] = stripslashes ( $row [$clave] );
		}
	}

	foreach ( $row as $clave => $valor ) {
		$row [$clave] = trim ( str_replace ( chr ( 10 ), "<br>", str_replace ( chr ( 13 ), "", htmlentities ( $row [$clave], ENT_QUOTES, "ISO-8859-1" ) ) ) );
	}

	$e_mensaje_html .= "<b>$Ticket:</b> #$row[seq_ticket_id] &nbsp; &nbsp;  <b>$Date:</b> $fecha  &nbsp; &nbsp;  <b>$Area:</b> $row[area_id] &nbsp; &nbsp;  <b>$Floor:</b> $row[piso] <br />";
	$e_mensaje_html .= "<b>$User:</b> ($row[usuario_id]) - $row[ape_y_nom] &nbsp; &nbsp;  <b>$Phone:</b> $row[telefono] <br /> <br />";
	$e_mensaje_html .= "<b>$Incident:</b> $row[incidente] <br /><br />";

	// # Busco si hay cometarios en el ticket
	// Search if there are comments in the ticket

	$query_0 = "SELECT fecha, operador_id, usuario_id, comentario
              FROM {$MyPHD}sigo_ticket
              WHERE seq_ticket_id=$seq_ticket_id
              ORDER BY seq_sigo_ticket_id";

	$result_0 = mysql_query ( $query_0 ) or die ( mysql_error () );
	while ( $row_0 = mysql_fetch_array ( $result_0 ) ) {
		if (strlen ( $row_0 [comentario] ) > 0) {
			$b_fecha = date ( 'd/m/Y H:i', strtotime ( $row_0 ['fecha'] ) );
			if (get_magic_quotes_gpc ()) {
				foreach ( $row_0 as $clave => $valor ) {
					$row_0 [$clave] = stripslashes ( $row_0 [$clave] );
				}
			}

			foreach ( $row_0 as $clave => $valor ) {
				$row_0 [$clave] = trim ( str_replace ( chr ( 10 ), "<br>", str_replace ( chr ( 13 ), "", htmlentities ( $row_0 [$clave], ENT_QUOTES, "ISO-8859-1" ) ) ) );
			}

			$e_mensaje_html .= wordwrap ( "<b>$b_fecha  - ($row_0[operador_id])</b> - $row_0[comentario] <br /><br />" );
		}
	}

	// Env�o el correo

	return send_e_mail ( $_SESSION ['PHD_APE_Y_NOM'], $_SESSION ['PHD_E_MAIL'], $ape_y_nom, $para, $asunto, $e_mensaje_html );
}

// # send_alert_ur($seq_solicitud_id, $seq_ticket_id=0)

// # Env�a un correo con los datos de la solicitud que se ha insertado a los
// # operadores que tienen 'S' en aviso_solicitud
// Send an e-mail with the user request information to the operators that
// have the aviso_solitud field set on 'S'
function send_alert_ur($seq_solicitud_id, $seq_ticket_id = 0)

{
	require ('config.inc.php');
	require ($Include . 'lang.inc');

	$query = "SELECT * from {$MyPHD}operador
             WHERE nivel>0
             AND avisar_solicitud='S'";

	$result = mysql_query ( $query ) or die ( mysql_error () );
	$q_filas = mysql_num_rows ( $result );

	if ($q_filas < 1) {
		return false;
	}

	$query = "SELECT * from {$MyPHD}solicitud
             WHERE seq_solicitud_id=$seq_solicitud_id";

	$result_0 = mysql_query ( $query ) or die ( mysql_error () );
	$q_filas = mysql_num_rows ( $result_0 );

	if ($q_filas != 1) {
		return false;
	}

	if ($seq_ticket_id > 0) {
		$Alert_ticket_comment_subjet = str_replace ( "%1%", $_SESSION [PHD_OPERADOR], $Alert_ticket_comment_subjet );
		$Alert_ticket_comment_subjet = str_replace ( "%2%", $_SESSION [PHD_APE_Y_NOM], $Alert_ticket_comment_subjet );
		$subjet = str_replace ( "%3%", $seq_ticket_id, $Alert_ticket_comment_subjet );
	} else {
		$subjet = str_replace ( "%1%", $seq_solicitud_id, $Alert_user_request_subjet );
	}

	$row_0 = mysql_fetch_array ( $result_0 );

	$fecha = date ( 'd/m/Y H:i:s', strtotime ( $row_0 ['fecha'] ) );

	foreach ( $row_0 as $clave => $valor ) {
		$row_0 [$clave] = trim ( htmlentities ( $valor, ENT_QUOTES, "ISO-8859-1" ) );
	}

	$e_mensaje_html .= "$Support_request: <strong>#$row_0[seq_solicitud_id]</strong>   $Date: <strong>$fecha</strong>  <br />
    $Area: <strong>$row_0[area]</strong>   $Floor: <strong>$row_0[piso]</strong> <br />";
	$e_mensaje_html .= "$User: <strong>($row_0[usuario_id]) $row_0[ape_y_nom]</strong>    $Phone: <strong>$row_0[telefono]</strong><br /><br />";
	$e_mensaje_html .= "$Detail: $row_0[incidente] <br /><br />";

	// # Busco si hay cometarios en el ticket
	// Search if there are comments in the ticket

	$query_0 = "SELECT fecha, operador_id, usuario_id, comentario
              FROM {$MyPHD}sigo_ticket
              WHERE seq_ticket_id=$seq_ticket_id
              AND visible='S'
              ORDER BY seq_sigo_ticket_id";

	$result_0 = mysql_query ( $query_0 ) or die ( mysql_error () );
	while ( $row_0 = mysql_fetch_array ( $result_0 ) ) {
		if (strlen ( $row_0 [comentario] ) > 0) {
			$b_fecha = date ( 'd/m/Y H:i', strtotime ( $row_0 ['fecha'] ) );
			if (get_magic_quotes_gpc ()) {
				foreach ( $row_0 as $clave => $valor ) {
					$row_0 [$clave] = stripslashes ( $row_0 [$clave] );
				}
			}

			foreach ( $row_0 as $clave => $valor ) {
				$row_0 [$clave] = trim ( str_replace ( chr ( 10 ), "<br>", str_replace ( chr ( 13 ), "", htmlentities ( $row_0 [$clave], ENT_QUOTES, "ISO-8859-1" ) ) ) );
			}

			$e_mensaje_html .= wordwrap ( "<b>$b_fecha  - ({$row_0['operador_id']}{$row_0['usuario_id']})</b> - $row_0[comentario] <br /><br />" );
		}
	}

	// Send mail
	// Env�o el correo

	while ( $row = mysql_fetch_array ( $result ) ) {
		$mandar_mail = send_e_mail ( "PHD Help Desk", $_SESSION ['PHD_FROM_USER_REQUEST'], $row ['ape_y_nom'], $row ['e_mail'], $subjet, $e_mensaje_html );
	}
	return $mandar_mail;
}

// # send_comment($seq_ticket_id)

// # Env�a un correo al usuario con el comentario que haya agregado el operador
// Send an e-mail to the user with the operator comment added
function send_comment($seq_ticket_id)

{
	require ('config.inc.php');
	require ($Include . 'lang.inc');

	$query = "SELECT st.*, op.ape_y_nom, op.e_mail as op_email
             FROM {$MyPHD}sigo_ticket st
             JOIN {$MyPHD}operador op ON op.operador_id=st.operador_id
             WHERE st.visible='S'
             AND LENGTH(st.comentario)>1
             AND st.seq_ticket_id=$seq_ticket_id";

	$result = mysql_query ( $query ) or die ( mysql_error () );
	$q_filas = mysql_num_rows ( $result );

	if ($q_filas < 1) {
		return false;
	}

	while ( $row = mysql_fetch_array ( $result ) ) {
		$Comment_added_by = str_replace ( "%1%", "({$row['operador_id']}) {$row['ape_y_nom']}", $Comment_added_by );

		$Comment_added_by = str_replace ( "%2%", date ( 'd/m/Y', strtotime ( $row ['fecha'] ) ), $Comment_added_by );
		$Comment_added_by = str_replace ( "%3%", date ( 'H:i', strtotime ( $row ['fecha'] ) ), $Comment_added_by );

		$comentario_html = trim ( str_replace ( chr ( 10 ), "<br>", str_replace ( chr ( 13 ), "", htmlentities ( $row ['comentario'], ENT_QUOTES, "ISO-8859-1" ) ) ) );
		$comentario_html = "<br /><strong>$Comment_added_by</strong><br /> $comentario_html<br />";

		$e_mail_from = $row ['op_email'];
		$from_ape_y_nom = $row ['ape_y_nom'];
	}

	$query = "SELECT tk.*, sol.seq_solicitud_id
	 		 FROM {$MyPHD}solicitud sol
	 		 JOIN {$MyPHD}ticket tk ON tk.seq_ticket_id=sol.seq_ticket_id
             WHERE tk.seq_ticket_id=$seq_ticket_id";

	$result = mysql_query ( $query ) or die ( mysql_error () );
	$q_filas = mysql_num_rows ( $result );

	$row = mysql_fetch_array ( $result );

	if ($q_filas != 1 or ! preg_match ( '#^.+@.+\\..+$#', $row ['e_mail'] )) {
		return false;
	}

	$Alert_comment_subject = str_replace ( "%1%", $row ['seq_solicitud_id'], $Alert_comment_subjet );

	return send_e_mail ( $from_ape_y_nom, $e_mail_from, $row ['ape_y_nom'], $row ['e_mail'], $Alert_comment_subject, $comentario_html );
}
function send_e_mail($from_ape_y_nom, $from_e_mail, $to_ape_y_nom, $to_e_mail, $subject, $body)

{
	require ('config.inc.php');
	if (! class_exists ( "PHPMailer" )) {
		require ('class.phpmailer.php');
	}
	$body = "<div style='text-align:center'><img style='text-align:center' src='cid:PHD' alt='phd help desk' border=0 /></div><br /><br />" . $body;

	// Send mail

	$mail = new PHPMailer ();
	$mail->SMTPDebug = 0;
	$mail->IsSMTP ();
	$mail->Port = $Mail_port;
	$mail->Host = $Mail_host;
	$mail->SMTPAuth = true;
	$mail->Username = $Mail_usuario;
	$mail->Password = $Mail_clave;

	$mail->From = $from_e_mail;
	$mail->FromName = $from_ape_y_nom;

	$mail->IsHTML ( true );

	$mail->Subject = $subject;
	$mail->Body = $body;

	$mail->AddEmbeddedImage ( "./images/phd_150_20.gif", "PHD", "phd_150_20.gif", "base64", "image/gif" );

	$mail->AddAddress ( $to_e_mail, $to_ape_y_nom );

	if (@$mail->Send ()) {
		return "";
	} else { // # Guardo el error de env�o de correo
	  // Save the e-mail send error

		$body = mysql_real_escape_string ( html_entity_decode ( $body, ENT_QUOTES, "ISO-8859-1" ) );
		$error = mysql_real_escape_string ( html_entity_decode ( $mail->ErrorInfo, ENT_QUOTES, "ISO-8859-1" ) );
		$query = "INSERT INTO e_mail_error VALUES
                  (NOW(),
                   '$from_ape_y_nom',
                   '$from_e_mail',
                   '$to_ape_y_nom',
                   '$to_e_mail',
                   '$subject',
                   '$body',
                   '$error')";

		$insert = mysql_query ( $query ) or die ( mysql_error () );
		return $mail->ErrorInfo;
	}
}

// # Funci�n que genera las contrase�as
// Function that generates the passwords
function generapwd($largo = 8)

{ // # inicializo variables
	$caracteres = "123456789123456789abcdefghijklmnopqrstuvwxyz";
	$contrasenia = "";

	// # Inicializo para rand
	srand ( ( double ) microtime () * 1000000 );

	// # Genero la contrase�a
	while ( $largo ) {
		$contrasenia .= substr ( $caracteres, rand ( 0, strlen ( $caracteres ) ), 1 );
		$largo --;
	}

	return ($contrasenia);
}

// # By Kennys Alfaro - 28 -12 - 2014
// # Retorna el array con las calificaciones
function get_array_calificaciones(){
	$calificaciones = array (
			'SIN_CALIFICAR' => 'Sin Calificar',
			'RECHAZADO' => 'Rechazado',
			'ACEPTABLE' => 'Aceptable',
			'ACEPTABLE_CON_OBS' => 'Aceptable con Obs',
			//'BUENO_BPM' => '4. Bueno BPM',
			//'EXCELENTE_BPM' => '5. Excelente BPM'
	);

	return $calificaciones;
}

// # By Kennys Alfaro - 28 -12 - 2014
// # Retorna la descripcion de la calificaion
// # Se recibe el valor como parametros y se retorna la descripcion.
function get_descripcion_calificaion($param){

	if($param != "" || !is_array($param)){
		$array_calif = get_array_calificaciones();
		reset($array_calif);
		//Avanzo un posicion para no comparar con el primer valor vacio del array.
		next($array_calif);
		while (list($key, $valor) = each($array_calif) ) {
			if($key == $param){
				return $valor;
			}
		}
	}

	return $param;
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

function guardarArchivoAdjunto_onServer($files, $seq_ticket_id, $subcarpeta_adjunto){

	if (isset($files['adjunto'])) {
	    $file_ary = reArrayFiles($files['adjunto']);
      $dir_upload = "D:/uploads/$subcarpeta_adjunto/".$seq_ticket_id."/"; //$_SERVER['DOCUMENT_ROOT']."/phd_mto/uploads/".$seq_ticket_id."/";
      mkdir($dir_upload, 0777);
	    foreach ($file_ary as $file) {
				$target_dir = $dir_upload;
				$target_file = $target_dir . basename($file["name"]);
				$nombre_archivo = $seq_ticket_id."_".basename($file["name"]);

				$uploadOk = 1;
				$FileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

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
						$mensaje .= "Su archivo no ha sido cargado. Error al subir archivo.";
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
}

/*function descargar_archivo($seq_ticket_id_, $nombre_archivo)
{
  $target_dir = "D:/uploads/$subcarpeta/".$seq_ticket_id_;
  $file_ = $target_dir."/".$nombre_archivo;
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
}*/
?>
