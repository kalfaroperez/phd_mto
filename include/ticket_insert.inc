 <?php
 /*
  * Nombre: ticket_insert.inc
  * Autores: Julio Tuozzo / jtuozzo@p-hd.com.ar
  * Funci�n: Formulario de ingreso de ticket de mesa de ayuda.
  * Function: Form of entrance of ticket of help desk.
  * Ver: 2.12
  */
 $opcion = $New_ticket;
 $ancho_guardar = 23 + (strlen ( $Save ) * 9);
 $ancho_salir = 23 + (strlen ( $Exit ) * 9);
 require ('head.inc');
 include ($_SERVER['DOCUMENT_ROOT'].'/phd_mto/operaciones_sql.php');


 // # Inicio el formulario de carga de tickets
 // Start the load tiket form.
?>

<!--<link rel="stylesheet" href="jquery-ui.css">-->
<link href="css/base/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<style>
    .ui-autocomplete {
      max-height: 100px;
      overflow-y: auto;
      /* prevent horizontal scrollbar */
      overflow-x: hidden;
    }
/* IE 6 doesn't support max-height
 * we use height instead, but this forces the menu to always be this tall
 */
    * html .ui-autocomplete {
      height: 100px;
    }


	.ui-autocomplete-loading {
		background: white url("images/ui-anim_basic_16x16.gif") right center no-repeat;
	}

  .btn-file {
    position: relative;
    overflow: hidden;
}

    .btn-file input[type=file] {
        position: absolute;
        top: 0;
        right: 0;
        min-width: 100%;
        min-height: 100%;
        font-size: 100px;
        text-align: right;
        filter: alpha(opacity=0);
        opacity: 0;
        outline: none;
        background: white;
        cursor: inherit;
        display: block;
    }

  </style>
<body>

 <?php require ('menu.inc');

 // # Funcion JavaScript que verifica que al salir del formulario
 // # esten vac�os los campos usuario e incidente por si apret�
 // # el bot�n "Cerrar" por error.

 // Javascript function that verifies that when leaving the form
 // the fields 'user' and 'incident' are empty in case the button 'Cerrar' (Close)
 // tightened by error

 ?>
 <script>
 window.onbeforeunload = function(e)
         {	if (verifico_vacio())
                 {return '<?php echo $Are_data_loaded; ?> ';
 	            }
         };

     function verifico_vacio() {
       var c_usuario=document.ticket.usuario.value;
       var c_inci=document.ticket.incidente.value;
       if ((c_usuario.length>0 || c_inci.length>0) && document.ticket.guardar.value!='Wait...'){
           return true
         }else{
           return false
         }
       }

 </script>
<?php
 require ('f_subtipo_JS.inc');
 require ('f_fecha_JS.inc');
 require ('f_usuario_AJAX.inc');
?>

 <script language='JavaScript'>
 window.onload = function ()
         { document.getElementById('disp_fecha').innerHTML = document.ticket.fecha.value= document.ticket.fecha_ultimo_estado.value=f_fecha();
           document.getElementById('usuario').onblur = valida_usuario;
           document.getElementById('area_id').onblur = valida_area;
           valida_area();
         }
 </script>


<div id='contenido'>
<form  name='ticket' method='post' action='<?php echo $_SERVER[PHP_SELF]; ?>' enctype="multipart/form-data">
    <div id='div_ticket_user'>
      <table border='0' width='95%' cellpadding='1' cellspacing='1' align='center'>
       <tr>
        <td align='left'> <?php echo $Date; ?>: <strong id='disp_fecha'><?php echo $fecha; ?></strong> <input type='hidden' name='fecha' value='<?php echo $fecha; ?>'> </td>
        <td align='center'><?php echo $Operator; ?>: <strong><?php echo $operador; ?> - <?php echo $operador_ape_y_nom; ?> <input type='hidden' id='nivel' value='<?php echo $nivel; ?>' /></strong> </td>

        <!--
        <td align='right'>
          <?php //echo $Contact; ?>:
          <select name='contacto'>
              <option></option>";
<?php

                /*$query = "SELECT valor
                            FROM {$MyPHD}atributo
                            WHERE atributo='$Contact' AND activo='S'
                            ORDER BY valor";
                $result = mysql_query ( $query ) or die ( mysql_error () );

                while ( $row = mysql_fetch_array ( $result ) ) {
                	if ($row ['valor'] == $contacto) {
                		$selected = 'selected';
                	} else {
                		$selected = '';
                	}
                  */
?>
            	<option value='<?php // echo $row['valor']; ?>' <?php // echo $selected; ?> > <?php // echo $row['valor']; ?> </option>
            <?php //} ?>
          </select>
        -->
     </td>
    </tr>
    </table>
    <div id='mensaje' class='error'><?php echo $mensaje; ?> </div>

    <table class='borde_fino' width='95%' cellpadding='1' cellspacing='0' align='center' >
     <tr>
      <td colspan='3'><strong> <?php echo $User_information; ?> </strong></td>
     </tr>
     <tr>
      <td>
        <?php echo $User; ?>: <input type='text'  name='usuario' id='usuario' value='<?php echo $usuario; ?>' size='15' maxlength='15' onblur='f_actualizo_fechas()' />&nbsp;
       <input class='boton_lupa' style='cursor:pointer' title='<?php echo '$Search $User'; ?>' type='button' value= '' onclick=window.open('usr_busco.php','','width=500,height=390,scrollbars=1,resizable=1,toolbar=0,location=0,menubar=0,status=0,directories=0') />
      </td>
      <td> <?php echo $Last_and_first_name; ?>: <input type='text' name='ape_y_nom' id='ape_y_nom' value='<?php echo $ape_y_nom; ?>' size='45' maxlength='50' > </td>
      <td> <?php echo $Area; ?>: <input type='text' name='area_id' id='area_id' value='<?php echo $area_id; ?>' size='15' maxlength='15' > </td>
     </tr>

<tr>
       <td colspan='3'>
        <table  width='100%' cellpadding='2' cellspacing='1' align='center' >
         <tr>
          <td> <?php echo $Floor; ?>: <INPUT type='text' name='piso' id='piso' value='<?php echo $piso; ?>' size='4' maxlength='4' > </td>
          <td><?php echo $Phone; ?>: <INPUT type='text' name='telefono' id='telefono' value='<?php echo $telefono; ?>' size='30' maxlength='30' > </td>
          <td><?php echo $Elec_mail; ?>: <INPUT type='text' name='e_mail' id='e_mail' value='<?php echo $e_mail; ?>' size='45' maxlength='60' > </td>
         <td ><strong><div id='nombre_area'><?php echo $nombre_area; ?></div></strong></td>
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
       <tr> <td colspan='2'> <strong><?php echo $Ticket_information;  ?></strong> </td>

       </tr>
       <tr>
        <td style="width:10%"> <?php echo $Incident; ?>: </td>
        <td  style='width:90%'>
          <TEXTAREA name='incidente'style="width:100%"><?php echo $incidente; ?></TEXTAREA>
        </td>
       </tr>
     </table>

     </div>
     <div id='div_admin' style='display:block'>


     <table border='0' width='95%' cellpadding='3' cellspacing='1' align='center' >
     <tr> <td  style='width:10%'> <?php echo $Comment; ?>: </td>
      <td <td  style='width:90%'>
        <TEXTAREA name='comentario' rows='4' cols='130'><?php echo $comentario ?></TEXTAREA>
      </td>
     </tr>
    <tr>
    <td><?php echo $Attach_file; ?>: </td>
        <td>
          <div class="container">
            <div class="row files" id="files1">
              <div id='div_0'>
                <input type='file' id="adjunto1" class="fileUpload" name='adjunto[]' maxlength='120'> (Max. <?php echo $text_max_attach; ?>)
                &nbsp;<input type="button" class="button" name="" value="+">
              </div>
            </div>
          </div>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>

          <!--
          <div id="div_adjuntos">
            <ul id='ul_adjuntos'>
            </ul>
          </div>
        -->

        </td>
    </tr>
    </table>

<br />
<table  width='95%' cellpadding='3' cellspacing='1' align='center' >
      <tr>
        <td><?php echo $Priority; ?>:
          <select name='prioridad'>

<?php

for($I = 3; $I > 0; $I --) {
	if ($I == 2) {
		$selected = 'selected';
	} else {
		$selected = '';
	}
  ?>
	<option <?php echo $selected; ?> value='<?php echo $I; ?> '> <?php echo $I; ?>
    <?php
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
  ?>
</option>

<?php  } ?>

</select>
    </td>
    <td>
      <?php echo $Assigned_to; ?>:
      <select name='asignado_a'>
          <option> </option>

<?php
$query = "SELECT operador_id, ape_y_nom, sector_id, nivel
                FROM {$MyPHD}operador
                WHERE nivel>0 AND
                (sector_id='$_SESSION[PHD_SECTOR_ID]' OR privado='N')
                ORDER BY sector_id, operador_id";
$result = mysql_query ( $query ) or die ( mysql_error () );

while ( $row = mysql_fetch_array ( $result ) ) {
	if ($row ['operador_id'] == $asignado_a){
		$selected = 'selected';
	} else if($row ['operador_id'] == 'jmto'){
		$selected = 'selected';
	}else{
		$selected = '';
	}
?>
	<option <?php echo $selected; ?> value='<?php echo $row['operador_id']; ?>'> <?php echo $row['operador_id']; ?> - <?php  echo $row['ape_y_nom']; ?> / <?php echo $row['sector_id']; ?>  </option>
<?php } ?>


				</SELECT>
       </td>
       <td><?php echo $Private; ?> &nbsp; <input type='checkbox' name='privado' value='S' />
       </td>
      </tr>
      <tr>
       <td>
        <?php echo $Process; ?>:
        <SELECT name='proceso'>

<?php
      $query = "SELECT valor
                      FROM {$MyPHD}atributo
                      WHERE atributo='$Process' AND activo='S'
                      ORDER BY valor";
      $result = mysql_query ( $query ) or die ( mysql_error () );

      while ( $row = mysql_fetch_array ( $result ) ) {
      	if ($row ['valor'] == "Mto Correctivo") {
      		$selected = 'selected';
      	} else {
      		$selected = '';
      	}
  ?>
	<OPTION value='<?php echo $row['valor']; ?>' <?php echo $selected; ?> > <?php echo $row['valor']; ?>  </option>
<?php } ?>

</SELECT>
       </td>
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
       <select id="tipo_trabajo" name="tipo_trabajo">
          <option value='0'>Seleccione...</option>
          <?php
          $selected = '';
          while (list($key, $val)=each($arr_tipo_trabajo)) {
            /*if ($tipo_trabajo == $val) {
              $selected = 'selected';
              $existe = true;
            } else {
              $selected = '';
            }*/
          ?>
          <option value='<?php echo $key; ?>'><?php echo $val; ?></option>
          <?php
          }
          ?>



       </select>
   </td>
  </tr>

<!--

      //// AQUI TRABAJO KENNYS	 DESDE EL 23 DE ENERO 2018
      // VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV



-->

          <tr>
              <!--td>Planta</td-->
              <td>
                <div class="ui-widget">
                  <label for="txtPlanta">Area: </label>
                  <input id='txtPlanta' class="ui-autocomplete-input" />
                </div>
                  <!--<select id="sel_planta_ti" name="sel_planta"  class="combobox_equipos" accion_selec="seleccion_planta" onchange="cargar_select_equipo_princ_ticket();">
                      <option value=0> Seleccione...</option> -->
<?php
/*
                      $plantas = getPlantas();
                      if (!empty($plantas)) {
                          while (list($k, $row) = each($plantas)) {
                            $key = $row["id_planta"];
                            $valor = $row["nombre"];
?>
                            <option value="<?php echo $key; ?>"> <?php echo $valor; ?> </option>
<?php

                          }
                      }
*/
?>
                <!--
                  </select>
                -->
              </td>
              <!--td>Equipo Principal</td-->
              <td>

                  <div class="ui-widget">
                    <label for="txtEquipoPrincipal">Equipo Principal: </label>
                    <input id='txtEquipoPrincipal' class="ui-autocomplete-input" />
                  </div>
                  <!--
                  <select id="sel_equipo_princ_ti" name="sel_equipo_princ"  class="combobox_equipos" accion_selec="seleccion_equipo_principal" onchange="cargar_select_equipo_sec_ticket();">
                      <option value=0> Seleccione...</option>
                  </select>
                  -->
              </td>
          </tr>
          <tr>
            <!--td>Equipo Secundario</td-->
            <td>
              <div class="ui-widget">
                <label for="txtEquipoSecundario">Equipo Secundario:</label>
                <input id='txtEquipoSecundario' class="ui-autocomplete-input" />
              </div>
                <!--
                <select id="sel_equipo_sec_ti" name="sel_equipo_sec" class="combobox_equipos"  accion_selec="seleccion_equipo_secundario" onchange="cargar_select_componente_ticket();">
                    <option value=0> Seleccione...</option>
                </select>
              -->
            </td>
            <!--td>Componentes</td-->
            <td>

              <div class="ui-widget">
                <label for="txtComponente">Componentes:</label>
                <input id='txtComponente' class="ui-autocomplete-input" />
              </div>
                <!--
                <select id="sel_componente_ti" name="sel_componente" class="combobox_equipos"  accion_selec="cargar_componentes">
                    <option value=0> Seleccione...</option>
                </select>
              -->

            </td>
          </tr>
      <!--
      <script src="jquery-1.9.1.min.js"> </script>
      <script src="jquery-ui.js"></script>
      -->
      <input type='hidden' id="sel_planta" name='sel_planta' />
      <input type='hidden' id="sel_equipo_princ"  name='sel_equipo_princ' />
      <input type='hidden' id="sel_equipo_sec" name='sel_equipo_sec' />
      <input type='hidden' id="sel_componente" name='sel_componente' />

      <script src="js/jquery-2.1.0.min.js"></script>
      <script src="js/jquery-ui-1.9.2.custom.js"></script>
      <script type="text/javascript" src="web_script.js"></script>



<!--
// /\ /\ /\ /\/\ /\ /\ /\ /\ /\
//// AQUI TRABAJO KENNYS	 DESDE EL 23 DE ENERO 2018

// ### Armo la lista de opciones de estado del ticket
-->
<tr>
    <td>
        <?php echo $State; ?>:
        <SELECT name='estado' onChange='document.ticket.fecha_ultimo_estado.value=f_fecha();'>
<?php
        global $Host,$Usuario,$Contrasena, $Base;
        $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
        $Uso=mysql_select_db($Base) or die (mysql_error());
        $query = "SELECT valor
                        FROM {$MyPHD}atributo
                        WHERE atributo='$State' AND activo='S'
                        ORDER BY valor";
        $result = mysql_query ( $query ) or die ( mysql_error () );

        while ( $row = mysql_fetch_array ( $result ) ) {
        	if ($row ['valor'] == "Programado") {
        		$selected = 'selected';
        	} else {
        		$selected = '';
        	}
?>
        	       <OPTION <?php echo $selected; ?> value='<?php echo ucwords($row['valor']); ?>'> <?php echo ucwords($row['valor']); ?> </OPTION>

        <?php } ?>

</select>
        </td>
        <td>

       <?php echo $Last_state_date; ?> : <input type='text' name='fecha_ultimo_estado' value='<?php echo $fecha_ultimo_estado; ?>' size='19' maxlength='19' >

        </td>
        <td>

       Fecha de Entrega de Trabajo: <input type='text' class="datepicker" name='fecha_entrega' value='<?php echo $fecha_entrega; ?>' size='19' maxlength='19' >

        </td>
       </tr>
      </table>
</div>
<div id='div_boton_accion'>

      <table class='borde_fino' border='0' cellspacing='0' cellpadding='0' width='95%' align='center'>
             <tr>
              <td align='right'>
               <input class='boton_guardar' style='width: <?php echo $ancho_guardar; ?>px;' type='submit' value='<?php echo $Save; ?>' name='guardar' onclick='return false;this.value=\"Wait...\"'>
<!--               <button type="button" id="btnGuardar">Guardar</button>-->
              </td>
              <td align='right'>
               <input class='boton_salir' style='width: <?php echo $ancho_salir; ?>px;' type='button' value='<?php echo $Home; ?>' name='Salir'
               onClick='window.location=\"index.php\"'>
              </td>
             </tr>
           </table>
</div>

    </form>
 </div>


<?php

// # Verifico si tengo n�mero de ticket anterior para informarlo al operador
// Verify if exists the previous ticket number to inform it yo the operator.
if ($_SESSION ['PHD_SEQ_TICKET_ID'] > 0) {
  ?>
	<script >
         window.alert('<?php echo $Ticket_was_stored; ?> #<?php echo $_SESSION['PHD_SEQ_TICKET_ID']; ?>')
  </script>
	<?php $_SESSION ['PHD_SEQ_TICKET_ID'] = 0; ?>
<?php } ?>

</body>
</html>
