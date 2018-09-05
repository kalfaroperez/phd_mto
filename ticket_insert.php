<?PHP
/*
 * Nombre: ticket_insert.php Autor: Julio Tuozzo / jtuozzo@p-hd.com.ar Funci�n: Ingreso de ticket en la base de datos Function: Insert ticket in the data base. Ver: 2.12
 */

// # Verifico que se encuentre validado el usuario, si no es asi lo
// # dirijo a la pantalla de login.
// Verify that one is validated the user, if it is not therefore
// redirect to the screen of login.
session_start ();
require ('config.inc.php');
require ($Include . 'lang.inc');
if (! isset ( $_SESSION ['PHD_NIVEL'] ) or $_SESSION ['PHD_NIVEL'] < 10) {
	require ($Include . 'login.inc');
	exit ();
}
//echo "<pre>"; print_r($_POST);echo "</pre>";
//echo "<pre>"; print_r($_SESSION);echo "</pre>"; die;
// # Me conecto con la base de datos para poder seleccionar
// # las distintas opciones de los atributos, usuarios, etc.
// Connect with the data base to be able to select
// the different options from the attributes, users, etc.

$Conect = mysql_connect ( $Host, $Usuario, $Contrasena ) or die ( mysql_error () );
$Uso = mysql_select_db ( $Base ) or die ( mysql_error () );

// # Traigo las funciones PHP.
// Get PHP functions.

require ('funciones.inc.php');

// # Inicializo las variables del formulario.
// Inicialized the variables of the form.

$text_max_attach = conv_bytes ( $_SESSION [PHD_MAX_ATTACH] );

$operador = $_SESSION ['PHD_OPERADOR'];
$operador_ape_y_nom = $_SESSION ['PHD_APE_Y_NOM'];
$nivel = $_SESSION['PHD_NIVEL'];

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

if (! isset ( $_POST ['contacto'] )) {
	$contacto = $_SESSION ['PHD_CONTACT_DEFAULT'];
} else {
	$contacto = $_POST ['contacto'];
}
$fecha = $_POST ['fecha'];
$usuario = $_POST ['usuario'];
$ape_y_nom = $_POST ['ape_y_nom'];
$area_id = $_POST ['area_id'];
$piso = $_POST ['piso'];
$e_mail = $_POST ['e_mail'];
$telefono = $_POST ['telefono'];
$incidente = $_POST ['incidente'];
$comentario = $_POST ['comentario'];
$asignado_a = $_POST ['asignado_a'];

if (! isSet ( $_POST ['proceso'] )) {
	$proceso = $_SESSION ['PHD_PROCESS_DEFAULT'];
} else {
	$proceso = $_POST ['proceso'];
}

$tipo_trabajo = $_POST ['tipo_trabajo'];

/*$tipo = $_POST ['tipo'];
$sub_tipo = $_POST ['sub_tipo'];*/

/*

Comentado por cambio en los campos autocompletar del Formulario de insercion.
Comentado hasta nueva orden 07/07/2018 8:10pm
*/
if ($nivel == "10") {
	$id_planta = 0;
	$id_equipo_princ = 0;
	$id_equipo_sec = 0;
	$id_componente = 0;

}else if ($nivel == "20") {
	$id_planta = $_POST ['sel_planta'];
	$id_equipo_princ = $_POST ['sel_equipo_princ'];
	$id_equipo_sec = $_POST ['sel_equipo_sec'];
	$id_componente = $_POST ['sel_componente'];

}



if (! isSet ( $_POST ['prioridad'] )) {
	$prioridad = 3;
	$private_check = "checked"; // Aqu� detecto que el formulario esta en blanco e inicializo el ticket como privado
} else {
	$prioridad = $_POST ['prioridad'];
}

if ($_POST [privado] == "S") {
	$privado = $_POST [privado];
	$private_check = "checked";
} elseif (! isset ( $private_check )) {
	$privado = "N";
	$private_check = "";
}

if (! isSet ( $_POST ['estado'] )) {
	$estado = $_SESSION ['PHD_STATE_DEFAULT'];
} else {
	$estado = $_POST ['estado'];
}

$fecha_ultimo_estado = $_POST ['fecha_ultimo_estado'];
$fecha_entrega = $_POST ['fecha_entrega'];
$operador_ultimo_estado = $operador;

//Adjunto
/*
$file = $_FILES;
$target_dir = "D:/uploads/"; //"$_SERVER['DOCUMENT_ROOT']."/phd_mto/uploads/";
$ruta_adjunto = $target_file = $target_dir . basename($file["adjunto"]["name"]);
$nombre_adjunto = basename($file["adjunto"]["name"]);
$tipo_adjunto = $_FILES ["adjunto"] ["type"];
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
*/
/*
$archivo = $_FILES ["adjunto"] ["tmp_name"];
$nombre_adjunto = $_FILES ["adjunto"] ["name"];
$tamanio_adjunto = $_FILES ["adjunto"] ["size"];
$tipo_adjunto = $_FILES ["adjunto"] ["type"];
*/

// # Verfico que se haya ingresado por "submit"", si no es as� muestro
// # el formulario para ingresar la info del ticket.
// Verfy that has entered by �submit "", if it is not thus show
// the form to enter info of the ticket.

if (! isSet ( $_POST ['guardar'] )) {
	require ($Include . 'ticket_insert.inc');
	exit ();
}

// # Sector de validaciones de los campos ingresados
// Sector of validations of the entered fields

if (strlen ( $contacto ) == 0) // # Verifico que haya ingresado la forma de contacto
                               // Verify that the contact way was entered
{
	$mensaje .= "<br> $No_contact";
}

if (strlen ( $usuario ) == 0) // # Verifico que haya ingresado el usuario
                              // Verify that the user has entered
{
	$mensaje .= "<br> $No_user";
}

if (strlen ( $ape_y_nom ) == 0) // # Verifico que haya ingresado el apellido y nombre
                                // Verify that the last name and name has entered
{
	$mensaje .= "<br> $No_last_name";
}

if (strlen ( $area_id ) == 0) // # Verifico que haya ingresado el area
                              // Verify that the area has entered
{
	$mensaje .= "<br> $No_area";
}

if (strlen ( $e_mail ) > 0 and ! preg_match ( '#^.+@.+\\..+$#', $e_mail )) // # Verifico el formato del e-mail
                                                                           // verify the e-mail format
{
	$mensaje .= "<br /> $No_valid_e_mail";
}

if (strlen ( $incidente ) == 0) // # Verifico que haya ingresado el incidente
                                // Verify that the incident has entered
{
	$mensaje .= "<br> $No_incident";
}

if (strlen ( $asignado_a ) == 0 and $_SESSION ['PHD_ASSIGN_TICKET'] == "S") {
	$mensaje .= "<br /> $No_assign";
}

if ($privado == "S" and strlen ( $asignado_a ) > 0) // # Si es privado verifico que no se haya asignado a un operador de otro sector
                                                    // If is private verify that doesn't assigned to other sector operator.

{
	$query = "SELECT *
              FROM {$MyPHD}operador
              WHERE operador_id='$asignado_a'";

	$result = mysql_query ( $query ) or die ( mysql_error () );
	$row = mysql_fetch_array ( $result );
	$operador_sector_id = $row ['sector_id'];

	if ($operador_sector_id != $_SESSION [PHD_SECTOR_ID]) {
		$mensaje .= "<br /> $Cant_assign_private";
	}
}

if (strlen ( $proceso ) == 0) // # Verifico que haya ingresado el proceso
                              // Verify that the process has entered
{
	$mensaje .= "<br> $No_process";
}

if ($nivel == "20") {
		if (strlen ( $id_planta ) == 0) // # Verifico que haya ingresado el tipo
															 // Verify that the type has entered
		{
			$mensaje .= "<br> Seleccione una planta";
		}

		if (strlen ( $estado ) == 0) // # Verifico que haya ingresado estado
																 // Verify that the state has entered
		{
			$mensaje .= "<br> $No_state";
		}

		/*if (! fecha_valida ($fecha_entrega)) // # Verifico que haya ingresado estado
																				// Verify that the state has entered
		{
			$mensaje .= "<br> La fecha invalida, seleccione una fecha correcta";
		}
		elseif (strtotime(fecha_mysql($fecha_entrega)) < strtotime(date('Y-m-d') )) {
			echo "Fecha 1: $fecha_entrega"; echo "<br>";
			echo "Fecha 2: ";
			print_r(fecha_mysql($fecha_entrega). " < ");
		 	print_r(date('Y-m-d'));
			echo "<br/><br/>";
			$mensaje .= "<br> Fecha seleccionada no puede ser menor que la fecha actual";
		}*/
}


if (! fecha_valida ( $fecha_ultimo_estado )) // # Verfico que el formato de la fecha de ultimo estado sea v�lido
                                             // Verify that the last state date format is valid.
{
	$mensaje .= "<br> $No_valid_format_lsd";
}

elseif (strtotime ( fecha_mysql ( $fecha ) ) > strtotime ( fecha_mysql ( $fecha_ultimo_estado ) )) {
	$mensaje .= "<br> $Lsd_lower_date";
}

//Validacion del archivo
$files = $_FILES;
//echo "Tamaño => ";print_r($files['adjunto']['size'][0]);die;
if (isset($files['adjunto']) && $files['adjunto']['size'][0] > 0) {
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

if (isSet ( $mensaje )) // # Hay errores, los muestro y no proceso el ticket
                        // Error found, show the errors and doesn�t procces the ticket
{
	$mensaje = $UPR_error_found . $mensaje;
	require ($Include . 'ticket_insert.inc');
	exit ();
}

else // # No hubo errores, guardo el registro
     // Not error found, store the registry

{ // # Paso las fechas a formato MySQL/GNU
  // Set the dates in MySQL/GNU format
	$fecha = fecha_mysql ( $fecha );
	$fecha_ultimo_estado = fecha_mysql ( $fecha_ultimo_estado );
	$fecha_entrega = fecha_mysql ( $fecha_entrega );

	// # paso las entidades html a caracter
	// Convert the html entities to character

	$telefono = mysql_real_escape_string ( html_entity_decode ( $telefono, ENT_QUOTES, "ISO-8859-1" ) );
	$ape_y_nom = mysql_real_escape_string ( html_entity_decode ( $ape_y_nom, ENT_QUOTES, "ISO-8859-1" ) );
	$incidente = mysql_real_escape_string ( html_entity_decode ( $incidente, ENT_QUOTES, "ISO-8859-1" ) );
	$comentario = mysql_real_escape_string ( html_entity_decode ( $comentario, ENT_QUOTES, "ISO-8859-1" ) );

	// # Busco el sector asignado
	// Search the assigned sector

	if (strlen ( $asignado_a ) > 0) {
		$query = "SELECT sector_id
                FROM {$MyPHD}operador
                WHERE operador_id='$asignado_a'";
		$result = mysql_query ( $query ) or die ( mysql_error () );
		$row = mysql_fetch_array ( $result );
		$asignado_a_sector = $row ['sector_id'];
	}

	// # verifico si hay adjunto y lo proceso
	// Check if there is a attach file and proccess it.
/*
	if (strlen ( $archivo ) > 1) {
		$fp = fopen ( $archivo, "rb" );
		$adjunto = fread ( $fp, $tamanio_adjunto );
		$adjunto = addslashes ( $adjunto );
		fclose ( $fp );
	}
*/
	$result = mysql_query ( "START TRANSACTION" ) or die ( mysql_error () );
	$calificacion = 'SIN_CALIFICAR';
	/*echo "<pre>"; print_r($_POST);echo "</pre>";
	echo "planta $id_planta, equipo p $id_equipo_princ, equipo_se $id_equipo_sec,Componentes $id_componente";die;*/



	$query = "INSERT INTO {$MyPHD}ticket VALUES
             (NULL,
             '$fecha',
             '$privado',
             '$operador',
             '$_SESSION[PHD_SECTOR_ID]',
             '$contacto',
             '$usuario',
             '$ape_y_nom',
             '$area_id',
             '$piso',
             '$telefono',
             '$e_mail',
             '$asignado_a',
             '$asignado_a_sector',
             '$prioridad',
             '$incidente',
             '$proceso',
						 '$tipo_trabajo',
             '0',
             '0',
						 '$id_planta',
             '$id_equipo_princ',
						 '$id_equipo_sec',
             '$id_componente',
             '$estado',
             '$calificacion',
             '$fecha_ultimo_estado',
						 '$fecha_entrega',
             '$operador_ultimo_estado',
             '$adjunto',
             '$tipo_adjunto',
						 '$ruta_adjunto',
             '$nombre_adjunto',
             '$operador',
             NOW(),
             '$operador',
             NOW())";
//echo "<pre>"; print_r($query); echo "</pre>"; die;
	$query = str_replace ( "''", "null", $query ); // coloco null en los campos vac�os
	$insert = mysql_query ( $query ) or die ( mysql_error () );

	// # Levanto el n�mero de ticket para informarlo al operador.
	// Get the number of ticket to inform it to the operator.

	$query = "SELECT LAST_INSERT_ID() as seq_ticket_id";
	$result = mysql_query ( $query ) or die ( mysql_error () );
	$row = mysql_fetch_array ( $result );
	$_SESSION ['PHD_SEQ_TICKET_ID'] = $seq_ticket_id = $row ['seq_ticket_id'];

	if (strlen ( $comentario ) > 1) // # Hay un comentario, se abre el seguimiento
	                                // There is a comment, it's open a follow up

	{
		$query = "INSERT INTO {$MyPHD}sigo_ticket VALUES
                (NULL,
                 $seq_ticket_id,
                 NOW(),
                 '$operador',
                 null,
                 NULL,
                 NULL,
                 NULL,
                 '$comentario',
                 'N',
                 NULL,
                 NULL,
                 NULL,
                 '$operador',
                 null,
                 NOW())";
		$insert = mysql_query ( $query ) or die ( mysql_error () );
	}

	$result = mysql_query ( "COMMIT" ) or die ( mysql_error () );

	// # Verifico si el ticket esta asignado para mandar aviso a quien se lo asignaron.
	// Check if the ticket was assined to send an e-mail to the assigned operator.
	guardarArchivoAdjunto_onServer($_FILES, $seq_ticket_id, $_SESSION['PHD_SUBCARPETA_ADJUNTO_TICKET']);

	if (strlen ( $asignado_a ) > 0) {
		send_ticket ( $asignado_a, $seq_ticket_id, $Filtro_ticket );
	}

	header ( "Location: ticket_insert.php" );
}





?>
