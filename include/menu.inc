
<script type='text/javascript' src='menu_ie6.js'></script>
<table border='0' align='center' cellspacing='0' cellpadding='0' width='100%'  id='encabezado'>
<tr>
<td  width='180'><a href='/webphd'><img src='./images/phd_150_20.gif' border='0' alt='PHD Help Desk' title='PHD Help Desk by Julio Tuozzo'/></a></td>
<td style='text-align:center; vertical-align:bottom'><?pghp echo $opcion ?> </td>
<td style='text-align:right; vertical-align:bottom'>
    <h4 class='menu'><a href='#' onclick=\"window.open('help.php','','width=250,height=390,scrollbars=0,resizable=1,toolbar=0,location=0,menubar=0,status=0,directories=0')\"><?php echo $Help; ?></a></h4>

</td>
</tr>
</table>


<div id='menu'>
<ul>
    <li><a href='index.php'><?php echo $Home; ?></a></li>
    <li><a id='nuevo_ticket_menu' href='ticket_insert.php'><?php echo $New_ticket; ?></a></li>
    <li>
      <a href='#'><?php echo $Consults; ?></a>
    	   <ul>
    	    <!--li><a href='novedades.php'>$News</a></li-->
    	    <li><a href='consulta.php'><?php echo $Advanced_query; ?></a></li>
    	   </ul>
    </li>
	<li><a href='solic_list.php'><?php echo $Management_rRRRRRRRRRRRRRRRRRRRRRRRequests; ?></a></li>

<?php  if ($_SESSION['PHD_NIVEL']==20){ ?>
      <li><a href='clave_chg.php'><?php echo $Passwd_change; ?></a></li>";
       <li><a href='#'><?php echo $Administration; ?></a>
      <ul>
        <li><a href='area.php'><?php echo $Areas; ?></a></li>
        <li><a href='usuario.php'><?php echo $Users; ?></a></li>
        <li><a href='carga_usuario_area.php'><?php echo $Load_users; ?></a></li>
        <li><a href='atributo.php'><?php echo $Attributes; ?></a></li>
        <li><a href='parametro.php'><?php echo $Parameters; ?></a></li>
        <li><a href='sector.php'><?php echo $Sectors; ?></a></li>
        <li><a href='operador.php'><?php echo $Operators; ?></a></li>
        <li><a href='equipo.php'>Equipos principales </a></li>
        <li><a href='plantas.php'>Plantas </a></li>
        <li><a href='equipo_sec.php'>Equipos Secundarios </a></li>
        <li><a href='componentes.php'>Componentes </a></li>
        <li><a href='registro_equipos.php'>Clasificacion Equipos </a></li>
        <li><a href='e_mail_error.php'><?php echo $E_mail_error_log; ?></a></li>
      </ul>
    </li>
  <?php  } ?>
<li style='float:right; margin-right:30px'><a href='login.php'><?php echo $Exit; ?></a></li>
</ul>
</div>
