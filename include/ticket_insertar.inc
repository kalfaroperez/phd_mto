<?php

$opcion = $New_ticket;
$ancho_guardar = 23 + (strlen ( $Save ) * 9);
$ancho_salir = 23 + (strlen ( $Exit ) * 9);
require ('head.inc');
require ('menu.inc');
require ('f_subtipo_JS.inc');
require ('f_fecha_JS.inc');
require ('f_usuario_AJAX.inc');

?>
<div id='contenido'>
<form enctype='multipart/form-data' name='ticket' method='post' action='<? $_SERVER[PHP_SELF]?>'>
    <table border='0' width='95%' cellpadding='1' cellspacing='1' align='center'>
     <tr>
      <td align='left'> <? $Date ?> :  <strong id='disp_fecha'><? $fecha ?> </strong> <input type='hidden' name='fecha' value='<?$fecha?>'> </td>
      <td align='center'> <? $Operator ?> : <strong> <? $operador ?> - <? $operador_ape_y_nom ?> </strong> </td>
      <td align='right'>
        <? $Contact ?> :
        <select id="sel_contactos" name='contacto'>
            <option></option>";
        </select>
     </td>
    </tr>
    </table>
    <div id='mensaje' class='error'><?$mensaje?></div>

    <table class='borde_fino' width='95%' cellpadding='1' cellspacing='0' align='center' >
     <tr>
      <td colspan='3'><strong><? $User_information ?></strong></td>
     </tr>
     <tr>
      <td>
      <? $User ?>: <input type='text' name='usuario' id='usuario' value='$usuario' size='15' maxlength='15' onblur='f_actualizo_fechas()' />&nbsp;
       <input class='boton_lupa' style='cursor:pointer' title='$Search $User' type='button' value= '' onclick=window.open('usr_busco.php','','width=500,height=390,scrollbars=1,resizable=1,toolbar=0,location=0,menubar=0,status=0,directories=0') />
      </td>
      <td> $Last_and_first_name: <input type='text' name='ape_y_nom' id='ape_y_nom' value='$ape_y_nom' size='45' maxlength='50' > </td>
      <td> $Area: <input type='text' name='area_id' id='area_id' value='$area_id' size='15' maxlength='15' > </td>
     </tr>";

// # Pido el resto de los datos
// Get the rest of the data

echo " <tr>
       <td colspan='3'>
        <table  width='100%' cellpadding='2' cellspacing='1' align='center' >
         <tr>
          <td> $Floor: <input type='text' name='piso' id='piso' value='$piso' size='4' maxlength='4' > </td>
          <td>$Phone: <input type='text' name='telefono' id='telefono' value='$telefono' size='30' maxlength='30' > </td>
          <td>$Elec_mail: <input type='text' name='e_mail' id='e_mail' value='$e_mail' size='45' maxlength='60' > </td>
         <td ><strong><div id='nombre_area'>$nombre_area</div></strong></td>
        </tr>
       </table>
       </td>
      </tr>

      <tr>
        <td colspan='3' align='center' class='error' ><span id='alert'></span>
        </td>
       </tr>

   </table>

    <table border='0' width='95%' cellpadding='3' cellspacing='1' align='center' >
     <tr> <td colspan='2'> <strong> $Ticket_information </strong> </td>

     </tr>
     <tr> <td valign='top'> $Incident: </td>
      <td>
        <TEXTAREA name='incidente' rows='4' cols='130'>$incidente</TEXTAREA>
      </td>
     </tr>
     <tr> <td valign='top'> $Comment: </td>
      <td>
        <TEXTAREA name='comentario' rows='4' cols='130'>$comentario</TEXTAREA>
      </td>
     </tr>
    <tr>
    <td>$Attach_file: </td>
            <td><input type='file' name='adjunto' size='60' maxlength='120'> (Max. $text_max_attach)
        </td>
    </tr>
    </table>

<br />
<table  width='95%' cellpadding='3' cellspacing='1' align='center' >
      <tr>
        <td>$Priority: <select name='prioridad'>";
for($I = 3; $I > 0; $I --) {
	if ($I == $prioridad) {
		$selected = 'selected';
	} else {
		$selected = '';
	}
	echo "<option $selected value='$I'> $I ";
	switch ($I) {
		case 3 :
			print "- $High";
			break;
		case 2 :
			print "- $Medium";
			break;
		case 1 :
			print "- $Low";
			break;
	}
	echo "</OPTION> \n";
}

echo "</select>
       </td>
       <td colspan=>
";

$query = "select operador_id, ape_y_nom, sector_id, nivel
                FROM {$MyPHD}operador
                WHERE nivel>0 AND
                (sector_id='$_SESSION[PHD_SECTOR_ID]' OR privado='N')
                ORDER BY sector_id, operador_id";
$result = mysql_query ( $query ) or die ( mysql_error () );
$options="";

while ( $row = mysql_fetch_array ( $result ) ) {
	if ($row ['operador_id'] == $asignado_a){
		$selected = 'selected';
	} else if($row ['operador_id'] == 'jmto'){
		$selected = 'selected';
	}else{
		$selected = '';
	}
	$options .=  "<OPTION $selected value='$row[operador_id]'> $row[operador_id] - $row[ape_y_nom] / $row[sector_id]  </OPTION> \n";
}

echo "
$Assigned_to: 	<select name='asignado_a'>
            		<option> </option>
            		$options
				</select>
       </td>
       <td>$Private &nbsp; <input type='checkbox' name='privado' value='S' />
       </td>
      </tr>
      <tr>
       <td>
        $Process: <select name='proceso'>
                  <option></option>";

$query = "select valor
                FROM {$MyPHD}atributo
                WHERE atributo='$Process' AND activo='S'
                ORDER BY valor";
$result = mysql_query ( $query ) or die ( mysql_error () );

while ( $row = mysql_fetch_array ( $result ) ) {
	if ($row ['valor'] == $proceso) {
		$selected = 'selected';
	} else {
		$selected = '';
	}
	echo "<OPTION $selected> {$row['valor']} </OPTION> \n";
}

echo "               </select>
       </td>
       </tr>
       ";

// # Ahora armo la lista de clasificaci�n de tipo y subtipo, primero
// # armo la lista de los "tipos";
// Make the list of classification of type and subtype, at first
// make the list of the �types�;



      //// AQUI TRABAJO KENNYS	 DESDE EL 23 DE ENERO 2018
      // VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
?>


          <tr>
              <!--td>Planta</td-->
              <td>
                Planta:
                  <select id="sel_planta" accion_selec="seleccion_planta">
                      <option value=0> Seleccione...</option>
                  </select>
              </td>
              <!--td>Equipo Principal</td-->
              <td>
                  Equipo Principal:
                  <select id="sel_equipo_princ" accion_selec="seleccion_equipo_principal">
                      <option value=0> Seleccione...</option>
                  </select>
              </td>
          </tr>
          <tr>
            <!--td>Equipo Secundario</td-->
            <td>
              Equipo Secundario:
                <select id="sel_equipo_sec" accion_selec="seleccion_equipo_secundario">
                    <option value=0> Seleccione...</option>
                </select>
            </td>
            <!--td>Componentes</td-->
            <td>
                Componentes:
                <select id="sel_componente" accion_selec="cargar_componentes">
                    <option value=0> Seleccione...</option>
                </select>
            </td>
          </tr>




<?php

// /\ /\ /\ /\/\ /\ /\ /\ /\ /\
//// AQUI TRABAJO KENNYS	 DESDE EL 23 DE ENERO 2018

// ### Armo la lista de opciones de estado del ticket

echo "<tr>
       <td>
        $State: <select name='estado' onChange='document.ticket.fecha_ultimo_estado.value=f_fecha();'>
                 <option></option>";

$query = "select valor
                FROM {$MyPHD}atributo
                WHERE atributo='$State' AND activo='S'
                ORDER BY valor";
$result = mysql_query ( $query ) or die ( mysql_error () );

while ( $row = mysql_fetch_array ( $result ) ) {
	if ($row ['valor'] == $estado) {
		$selected = 'selected';
	} else {
		$selected = '';
	}
	echo "<OPTION $selected value='{$row['valor']}'> {$row['valor']} </OPTION> \n";
}

echo "        </select>
        </td>
        <td colspan='2'>

       $Last_state_date: <input type='text' name='fecha_ultimo_estado' value='$fecha_ultimo_estado' size='19' maxlength='19' >

        </td>
       </tr>
      </table>
      <p>

      <table class='borde_fino' border='0' cellspacing='0' cellpadding='0' width='95%' align='center'>
             <tr>
              <td align='right'>
               <input class='boton_guardar' style='width: {$ancho_guardar}px;' type='submit' value='$Save' name='guardar' onclick='this.value=\"Wait...\"'>
              </td>
              <td align='right'>
               <input class='boton_salir' style='width: {$ancho_salir}px;' type='button' value='$Home' name='Salir'
               onClick='window.location=\"index.php\";'>
              </td>
             </tr>
           </table>


    </form>
 </div> ";
// # Verifico si tengo n�mero de ticket anterior para informarlo al operador
// Verify if exists the previous ticket number to inform it yo the operator.



<script lang='javascript'>
  window.onbeforeunload = function(e){
    if (verifico_vacio()){
        return '$Are_data_loaded';
     }
  };

  function verifico_vacio(){
      var c_usuario=document.ticket.usuario.value;
      var c_inci=document.ticket.incidente.value;
      if ((c_usuario.length>0 || c_inci.length>0) && document.ticket.guardar.value!='Wait...'){
        return true
      }else{
        return false
      }
  }

  window.onload = function (){
    document.getElementById('disp_fecha').innerHTML = document.ticket.fecha.value= document.ticket.fecha_ultimo_estado.value=f_fecha();
    document.getElementById('usuario').onblur = valida_usuario;
    document.getElementById('area_id').onblur = valida_area;
    valida_area();
  }
</script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"> </script>
<script type="text/javascript">
  $(document).ready(function(){
      cargar_select_planta();
      cargar_select_equipo_princ();
      cargar_select_equipo_sec();
      cargar_select_componente();
  });

  function cargarContactos(){
    var accion_selec = "cargar_contactos";
    var contacto_atributo = "$Contact";
    $.ajax({
        method: "POST",
        data: { 'accion': accion_selec, 'contact': $Contact},
        url: "operaciones_ajax.php",

      })
        .done(function( msg ) {
          $("#sel_contactos").html(msg);
      });
  }

  function cargar_select_planta(){
    var accion_selec = "cargar_planta";
    $.ajax({
        method: "POST",
        data: { 'accion': accion_selec},
        url: "operaciones_ajax.php",

      })
        .done(function( msg ) {
          $("#sel_planta").html(msg);
      });
  }

  function cargar_select_equipo_princ(){
    $( "#sel_planta" ).change(function () {
        var id_planta = "", accion_selec = "";
        id_planta = $("#sel_planta option:selected").attr("id_planta");
        accion_selec = $("#sel_planta").attr("accion_selec");

        $.ajax({
            method: "POST",
            data: {
              'accion': accion_selec,
              'id_planta': id_planta
            },
            url: "operaciones_ajax.php",

          })
            .done(function( msg ) {
              $("#sel_equipo_princ").html(msg);
          });
    }).change();
  }

  function cargar_select_equipo_sec(){
    $( "#sel_equipo_princ" ).change(function () {
        var id_equipo_princ = "", accion_selec = "";

        id_equipo_princ = $("#sel_equipo_princ option:selected").attr("id_equipo_princ");
        accion_selec = $("#sel_equipo_princ").attr("accion_selec");

        $.ajax({
            method: "POST",
            data: {
              'accion': accion_selec,
              'id_equipo_princ': id_equipo_princ
            },
            url: "operaciones_ajax.php",

          })
            .done(function( msg ) {
              $("#sel_equipo_sec").html(msg);
          });
    }).change();
  }

  function cargar_select_componente(){
    $("#sel_equipo_sec").change(function () {
        var id_equipo_princ = "", accion_selec = "";

        id_equipo_sec = $("#sel_equipo_sec option:selected").attr("id_equipo_sec");
        accion_selec = $("#sel_equipo_sec").attr("accion_selec");

        $.ajax({
            method: "POST",
            data: {
              'accion': accion_selec,
              'id_equipo_sec': id_equipo_sec
            },
            url: "operaciones_ajax.php",

          })
            .done(function( msg ) {
              $("#sel_componente").html(msg);
          });
    }).change();
  }


</script>
