<?PHP
    /*
    Nombre: lang.inc
    Autor: Julio Tuozzo
    Funci&oacute;n: Plantilla de variables de idioma.
    Function: Group of language variables.
    Ver: 2.12
*/

    $Vlang="2.12";


## Valores de variables internas
## IMPORTANTE: estos valores se guardan en la base de datos, NO SE DEBEN MODIFICAR
## una vez ingresados datos en la misma.

// Internal variables values.
// WARNING: These values are stored in the database, YOU MUST NOT MODIFY
// once you have data in it

    $Contact="Contacto";
    $Process="Proceso";
    $State="Estado";
    $Subtype="Subtipo";
    $Type="Tipo";

### FIN DE VALORES QUE SE GUARDAN EN LA BASE DE DATOS
// END OF DATABASE VALUES

## Mensajes varios.
    $Tipo_de_Trabajo = "Tipo de Trabajo";
    $Planta_Text = "Area";
    $Equipo_Principal_Text = "Equipo Principal";
    $Equipo_Secundario_Text = "Equipo Secundario";
    $Componente_Text = "Componente";

    $And_press="y presione";
    $Alert_assign_head="Aviso: se asign&oacute; el ticket #%1% a (%2%) - %3%";
    $Alert_tickets="tiene tickets en estado %1%";
    $Are_data_loaded="Hay datos cargados y no han sido guardados, quiere salir de todas maneras?";
	$Are_you_sure_cancel_file="Esta seguro de cancelar el archivo?";
    $Are_you_sure_erase_log="Esta seguro de borrar el log?";
	$Are_you_sure_load_file="Esta seguro de cargar el archivo?";
    $By="por";
    $Comment_added="Comentario agregado";
	$Explain_load="Al presionar <em>Cargar</em> solo quendan activos los usuarios del archivo CSV, con los datos actualizados.";
	$File_loaded="Archivo cargado, %1% registros procesados";
    $Input_the_code="Ingrese el c&oacute;digo que se muestra en la imagen superior";
    $Mail_sent="Se ha enviado el correo con la contrase&ntilde;a de ";
    $No_mail_sent="Por alg&uacute;n motivo no se envi&oacute; el correo con la contrase&ntilde;a de";
    $New_pswd_assigned="La contrase&ntilde;a asignada es: ";
    $Next="Siguiente";
    $No="NO";
    $None="[Ninguno]";
    $Pswd_was_changed="Su contrase&ntilde;a ha sido cambiada con $e;xito";
    $Previous="Anterior";
    $Pswd_expired="SU CONTRASE&Ntilde;A HA EXPIRADO, DEBE CAMBIARLA";
    $Request_was_send="Se ha enviado la solicitud de soporte %1%, recuerde este n&uacute;mero para futuras referencias.";
    $Subtype_of="Subtipo de";
    $Ticket_was_stored="Se guardo; el ticket";
    $User_doesnt_exists="El usuario no existe, complete los datos";
    $Warning="!! ATENCION !!";
    $Was_modif="%1% fue modificado";
    $Was_loaded="%1% fue ingresado";
    $Yes="SI";
    $Select_area="Seleccione &acute;rea";

## Mensajes de error
    $Are_opers_in="ERROR - Existen operadores activos en el sector";
    $Are_users_in="ERROR - Existen usuarios activos en el a;rea";
    $Area_exists="El a;rea ya existe";
    $Area_input="El a;rea no existe, ingrese el nombre";
    $Attribute_exists_1="ERROR - EL ATRIBUTO";
    $Attribute_exists_2="CON EL VALOR";
    $Attribute_exists_3="YA EXISTE";
    $Big_attach="El tama&ntilde;o del archivo adjunto es mayor a %1%";
    $Blank_name="El nombre no puede estar en blanco";
    $Blank_value="ERROR - EL VALOR NO PUEDE ESTAR EN BLANCO";
    $Cant_assign_private="No se puede asignar un operador de otro sector a un ticket privado";
    $Cant_blank_value="No puede estar en blanco";
    $Correct_err_to_cont="Corrija los errores para poder continuar.";
    $Date_client_server_error="ERROR de fecha de servidor y equipo, la fecha del servidor es: ";
    $Err_input_operator="ERROR - Ingrese operador";
    $Err_input_passwd="ERROR - Ingrese su contrase&ntilde;a";
    $Err_level_access="Error de nivel de acceso";
    $Err_max_row_1="ERROR - La consulta selecciona";
    $Err_max_row_2="filas y el m�ximo permitido es de";
    $Err_max_row_3="ampl�e el apellido y/o nombre";
    $Err_parameters_file="Error en el archivo de par�metros, debe contener un registro y se han le�do %1%";
    $Error_captcha="ERROR - C&oacute;digo incorrecto";
    $High_than_16m="No puede ser mayor a 16.000.000";
    $Inactive_user="ERROR - Usuario inactivo";
    $Invalid_character="CONTIENE UN CARACTER NO VALIDO - ERROR";
    $Invalid_passwd="ERROR - Contrase&ntilde;a inva;lida";
    $No_database="Base no disponible por el momento";
    $Lsd_lower_date="La fecha de &uacute;ltimo estado es menor a la fecha";
    $Mail_srv_err="El mensaje de error del servidor de correo fue";
    $More_than_three_letters="Debe colocar al menos una palabra de ma;s de tres letras";
    $No_area="Falta ingresar el a;rea";
   	$No_assign="Asigne el ticket a un operador";
    $No_attach="El archivo adjunto <i>%1%</i> no existe";
    $No_contact="Falta ingresar el contacto";
    $No_e_mail_usr="ERROR - El usuario no tiene un e-mail para enviarle la contrase&ntilde;a";
    $No_user="ERROR - Ingrese el usuario";
    $No_last_name="Falta ingresar el apellido y nombre";
    $No_incident="Falta ingresar el incidente";
    $No_process="Falta ingresar el proceso";
    $No_modif_attrib="No se puede modificar el %1% %2%, es un valor predeterminado";
    $No_sector="Falta ingresar el sector";
    $No_state="Falta ingresar el estado";
    $No_user_found="No existen usuarios con";
    $No_type="Falta ingresar el tipo";
  	$No_upload_folder="No existe el subdirectorio \"upload\", cree ese subdirectorio en la rai;z de <strong>PHD Help Desk</strong>";
    $No_valid_e_mail="La direcci&oacute;n de correo electr&oacute;nico no es va;lida";
    $No_valid_format_lsd="Formato de fecha de &uacute;ltimo estado inva;lido";
    $No_valid_format_date_from="El formato de la fecha desde no es va;lido";
    $No_valid_format_date_to="El formato de la fecha hasta no es va;lido";
    $No_valid_format_lsd_from="El formato de la fecha &uacute;ltimo estado desde no es va;lido";
    $No_valid_format_lsd_to="El formato de la fecha &uacute;ltimo estado hasta no es va;lido";
    $Oper_exists="EL OPERADOR YA EXISTE";
    $Oper_not_autorized="ERROR - El operador no esta autorizado para ingresar al sistema";
    $Other_win_open="Hay otra ventana abierta con el ticket #%1%, no se puede guardar el ticket actual, cierre esta ventana y vuelva a abrirla.";
    $Pswd_not_equal="ERROR - La nueva contrase&ntilde;a y la reingresada no son iguales";
    $Pswd_only_ln="ERROR - La nueva contrase&ntilde;a debe tener solo letras y/o n&uacute;meros";
    $Pswd_repeat_d="ERROR - La nueva contrase&ntilde;a tiene muchos di;gitos repetidos";
    $Pswd_six_d="ERROR - La nueva contrase&ntilde;a debe tener por lo menos seis di;gitos";
    $Pswd_same_user="ERROR - La nueva contrase&ntilde;a debe ser distinta al nombre de usuario";
    $Pswd_same_act="ERROR - La contrase&ntilde;a actual y la nueva son iguales";
    $Pswd_used="ERROR - La nueva contrase&ntilde;a ya se ha utilizado";
    $Upper_than_cero="Debe ser un n&uacute;mero y mayor a cero.";
    $UPR_error_found="ERRORES ENCONTRADOS:";
    $User_exists="ERROR - El usuario ya existe";
    $User_not_exists="ERROR - El usuario no existe";
    $Sector_exists="El sector ya existe";
    $Was_updated_1="ERROR - Este ticket ha sido actualizado por:";
    $Was_updated_2="despu�s que se leyeron los datos del registro <br> Imposible realizar la actualizaci&oacute;n";


## Opciones de men� y links

    $Advanced_query="Consulta avanzada";
    $Areas="Areas";
    $Attributes="Atributos";
    $Check_last_version="Ver &uacute;ltima versi&oacute;n";
	$Consults="Consultas";
    $E_mail_error_log="Log de errores de e-mail";
    $Forgot_password="Olvide; mi contrase&ntilde;a";
    $Help="Ayuda";
    $Home="Inicio";
    $Management_requests="Gesti&oacute;n de solicitudes";
    $New_request="Nueva solicitud";
    $New_ticket="Nuevo ticket";
	$News="Novedades";
    $Operators="Operadores";
    $Load_users="Carga de usuarios y areas desde archivo";
    $Passwd_change="Cambio Contrase&ntilde;a";
    $Parameters="Para;metros";
    $PHD_home="Pa;gina web de PHD Help Desk";
    $Registry="Registrese";
    $Sectors="Sectores";
    $See_my_request="Ver mis solicitudes";
    $Users_forum="Foro de usuarios";
    $User_request_access="Acceso a solicitud de soporte de usuario";
    $Users="Usuarios";
    $User_guide="Manual de usuario";


## T�tulos
    $Administration="Administraci&oacute;n";
    $Active="Activo";
    $Area_admin="Administraci&oacute;n de a;reas";
    $Attribute_admin="Administraci&oacute;n de atributos del ticket";
    $Body="Contenido";
    $Change_active="Cambiar Activo SI/NO";
    $Class_attribute="Clase de atributo";
    $Comments="Comentarios";
    $Default_values="Valores predeterminados del ticket";
    $Equipos_p_admin="Administraci&oacute;n de Equipos Principales del ticket";
    $Enter_last_name="Ingrese Nombre y/o Apellido, completos o solo una parte";
    $Error_message="Mensaje de error";
	$File_content="Contenido del archivo";
    $Input_your_data="Ingrese sus datos";
   	$Load_csv_file="Cargar archivo formato CSV";
    $Load_user="Ingreso de Usuarios";
    $Parameters_admin="Administraci&oacute;n de para;metros";
    $Oper_pswd_change="Cambio de contrase&ntilde;a de operador";
    $Oper_admin="Administraci&oacute;n de operadores";
    $Query_head="Filtro= ";
    $Reason_request="Motivo de la solicitud";
    $Sector_admin="Administraci&oacute;n de sectores";
    $Support_request="Solicitud de soporte";
    $Log_in="Ingreso al sistema";
    $Receiver="Destinatario";
    $Request_states="Estados de la solicitud de usuario";
    $Sender="Remitente";
    $Subject="Asunto";
    $Tickets_assigned="Tickets asignados";
    $Ticket_information="Datos del ticket";
    $Total="Total";
    $Total_request="Total de Solicitudes";
    $Total_tkt="Total de Tickets";
    $Tkt_follow_up="SEGUIMIENTO DEL TICKET";
    $User_information="Datos del usuario";
    $Users_admin="Administraci&oacute;n de usuarios";
    $Value="Valor";
    $Version="Versi&oacute;n 2.12 - Febrero 2012";



## R�tulos de campos
    $Alert_assign="Avisar asignado";
    $Alert_user_request="Avisar solicitud de usuario";
    $Area="Area";
    $Area_code="C&oacute;digo de a;rea";
    $Assigned_to="Asignado a";
    $Attach_file="Adjuntar archivo";
    $Attached_file="Archivo adjuntado";
    $Date="Fecha";
    $Detail="Detalle";
    $Equipo_Principal = "Equipo Principal";
    $Planta = "Planta";
    $Equipo_Secundario ="Equipo_Secundario";
    $Componente = "Componente";
    $Input_date="Fecha ingreso";
	$Field_delimiter="Delimitador de campo";
    $From="desde";
    $To="hasta";
    $Last_state_date="Fecha ultimo estado";
    $Last_state_oper="Operador ultimo estado";
    $Operator="Operador";
    $User="Usuario";
    $Password="Contrase&ntilde;a";
    $Last_and_first_name="Nombre y Apellido";
    $Floor="Piso";
    $Phone="Telefono";
    $Incident="Incidente";
    $Input_by="Ingresado por";
    $Comment="Comentario";
    $Actual_pswd="Contrase&ntilde;a actual";
    $New_pswd="Nueva contrase&ntilde;a";
    $Retype_pswd="Reingrese nueva contrase&ntilde;a";
    $Elec_mail="Correo electr&oacute;nico";
    $Access_level="Nivel de acceso";
    $Administrator="Administrador";
    $Name="Nombre";
    $New_value="Nuevo valor";
    $No_access="Sin acceso";
    $Modified_field="Campo modificado";
    $Previous_value="Valor anterior";
    $Private="Privado";
    $Priority="Prioridad";
    $Request="Solicitud";
    $Sector="Sector";
    $Sector_code="C&oacute;digo de sector";
    $Ticket="Ticket";
    $Type_a_word="Ingrese una o ma;s palabras separadas por espacio";
    $User_visible="Visible para el usuario";
    $Calificacion_txt="Calificaci&oacute;n";

## Botones
    $Add_comment="Agregar comentario";
    $Cancel_file="Cancelar Archivo";
	$Consult="Consultar";
    $Download="Descargar";
    $Enter="Entrar";
    $Erase_log="Borrar log";
    $Exit="Salir";
    $Export="Exportar";
    $Filter="Filtrar";
	$Follow_up="Seguimiento";
    $Gener_new_pswd="Generar nueva contrase&ntilde;a";
    $List="Listar";
   	$Load="Cargar";
   	$New="Nuevo";
    $Open_ticket="Abrir ticket";
    $Clean="Limpiar";
    $Search="Buscar";
    $Close="Cerrar";
    $Cancel="Cancelar";
    $Change="Cambiar";
    $Save="Guardar";
    $Search="Buscar";
    $Show="Mostrar";
    $Modif="Modificar";

## Mensajes de correo electr&oacute;nico
    $Access_at="Ingrese en";
    $Alert_comment_subjet="Aviso: se agreg&oacute; un comentario a su solicitud #%1%";
    $Alert_ticket_comment_subjet="Aviso: el usuario (%1%) - %2% agreg&oacute; un comentario al ticket #%3%";
    $Alert_user_request_subjet="Aviso: se ingres&oacute; la solicitud de soporte #%1%";
    $Body_new_oper_1="Ha sido dado de alta en PHD Help Desk.";
    $Body_new_pswd_1="Se ha modificado su contrase&ntilde;a en PHD Help Desk.";
    $Body_new_pswd_2="Su usuario es:";
    $Body_new_pswd_3="y su contrase&ntilde;a:";
    $Body_new_pswd_4="El sistema le solicitara; que cambie esta contrase&ntilde;a una vez que haya ingresado.";
    $Comment_added_by="Comentario agregado por %1%, el %2% a las %3%";
    $Subject_new_oper="Alta en PHD Help Desk";
    $Subject_new_pswd="Nueva contrase&ntilde;a para PHD Help Desk";
    $Try_e_mail="Se intent&oacute; enviar a la direcci&oacute;n de correo";
    $Was_sended_to="Se envi&oacute; a la direcci&oacute;n de correo";

## URLs
    $User_guide_url="http://www.p-hd.com.ar/user_guide_2_12.php";
    $Users_forum_url="http://www.p-hd.com.ar/foro.php";
    $PHD_home_url="http://www.p-hd.com.ar";
    $FAQ_url="http://www.p-hd.com.ar/faq_2_12.php";
    $Registry_url="http://www.p-hd.com.ar/registro.php";
    $Check_last_version_url="http://www.p-hd.com.ar/last_ver_2_12.php?ver=212";

## Otros textos

    $DMA="dd/mm/aaaa";
    $MDA="mm/dd/aaaa";
    $AMD="aaaa/mm/dd";

    $High="Urgente";
    $Medium="Importante";
    $Low="Necesario";

    $Explain_PEN="Primer estado de la solicitud cuando el usuario la ha ingresado, a&uacute;n no ha generado un ticket.";
    $Explain_PAS="Estado de la solicitud cuando ha generado un ticket.";
    $Explain_CAN="La solicitud no genera un ticket y se anula.";

	$Explain_assign_ticket="Si se tilda este campo, los tickets se deben asignar obligatoriamente a un operador.";
    $Explain_date_format="Formato de fecha";
    $Explain_dias_psw="Cantidad de di;as en los que no se puede usar una contrase&ntilde;a anterior como nueva contrase&ntilde;a.";
    $Explain_from_user_request=" Remitente del correo que se envi;a a los operadores cuando se ingresa una solicitud de soporte.";
    $Explain_from_user_psw="Remitente del correo que se envi;a a los usuarios cuando generan su contrase&ntilde;a.";
    $Explain_max_attach="Tama&ntilde;o ma;ximo en bytes de un archivo adjunto al ticket, este valor no puede superar los 16000000.";
    $Explain_max_dif_min="Ma;xima diferencia en minutos que puede haber entre el cliente que ejecuta <strong>PHD Help Desk</strong> y el servidor de base de datos. Si no desea que <strong>PHD Help Desk</strong> controle esta diferencia coloque este valor en 1440 o mayor.";
    $Explain_max_lines_export="Cantidad ma;xima de li;neas que se pueden exportar de la base.";
    $Explain_max_lines_screen="Cantidad ma;xima de li;neas que se muestran en una consulta por pantalla.";
    $Explain_main_screen_state="Estado que tienen los tickets que se muestran asignados al operador en la pantalla inicial.";
    $Explain_state_alert="Valor del estado que alertara; al operador si ya hay un ticket ingresado para el mismo usuario.";
    $Explain_validez_psw="Cantidad de di;as de validez de contrase&ntilde;a para un operador.";
    $Ticket_created="Su solicitud ha creado el ticket";

	$Comma="Coma";
	$Semicolon="Punto y coma";
	$Tab="Tabulaci&oacute;n";

## Texto de formato de fecha
switch ($_SESSION['PHD_DATE_FORMAT'])
    {case "DMA":
         $Date_text="dd/mm/aaaa";
         $Date_format="d/m/Y";
     break;

     case "MDA":
         $Date_text="mm/dd/aaaa";
         $Date_format="m/d/Y";
     break;

     case "AMD":
         $Date_text="aaaa/mm/dd";
         $Date_format="Y/m/d";
     break;

     default:
         $Date_text="dd/mm/aaaa";
         $Date_format="d/m/Y";

    }


?>
