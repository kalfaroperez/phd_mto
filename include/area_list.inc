<?PHP
/*
    Nombre: area_list.inc
    Autor: Julio Tuozzo
    Funci�n: Vista del listado de �reas.
    Function: Areas list view.
    Ver: 2.00
    
*/

$ancho=22+(strlen($Filter)*8);
require('head.inc');
echo "
    <body>
    <form method='post' action='$_SERVER[PHP_SELF]' style='text-align:center'>
    $Area: <input type='text' name='area_id' size='10' maxlength='15' value='{$_SESSION[AREA][area_id]}'> &nbsp; &nbsp;
    $Name: <input type='text' name='nombre' size='35' maxlength='50' value='{$_SESSION[AREA][nombre]}' >  &nbsp; &nbsp;
    $Active: <select name='activo'>
        <option></option>
        <option value='S' $S_selected> $Yes </option>
        <option value='N' $N_selected> $No </option>
   </select> &nbsp; &nbsp;
   <input class='boton_filtrar' style='width: {$ancho}px;' type='submit' value='$Filter' name='filtrar'>
</form><br />";
require('ant_123_prox.inc');  ## L�nea que muestra <Ant | 1 2 3..... | Prox>
                              // Line that shows <Prev | 1 2 3 ..... | Prox>

echo "    <form method='post' action='area.php?orden=$orden&sentido=$sentido&pagina=$pagina&q_registros=$q_registros' target='_parent'>
    <table border='0' align='center' cellspacing='1' cellpadding='2' width='80%'>
    <tr>
     <th nowrap> <a href=$_SERVER[PHP_SELF]?orden=area_id&sentido=$sen_area_id&pagina=1&q_registros=$q_registros>$Area </a> $arr_area_id</th>
	 <th> <a href=$_SERVER[PHP_SELF]?orden=nombre&sentido=$sen_nombre&pagina=1&q_registros=$q_registros> $Name </a> $arr_nombre</th>
	 <th> <a href=$_SERVER[PHP_SELF]?orden=activo&sentido=$sen_activo&pagina=1&q_registros=$q_registros> $Active </a> $arr_activo </th>
    </tr>";
    
  
    $color[0]='class=b_linea_1';
    $color[1]='class=b_linea_2';
    $J=0;
    $atributo_ant='';
    while ($row = mysql_fetch_array($result))
 	      {## Formateo los datos
           // Formating data

           foreach($row as $clave => $valor)
                {$row[$clave]=htmlentities($row[$clave],ENT_QUOTES,"ISO-8859-1");
                }

           $activo= ($row[activo]=='S') ? "<img src='./images/ok.gif' border='0' alt='$Yes' />" : "<img src='./images/cancelar.gif' border='0' alt='$No' />" ;
           $J++;
           $J=$J % 2;
           $ancho_editar=26+(strlen($row[area_id])*8);
           echo "<tr $color[$J]>
           <td> <input class='boton_editar' style='width: {$ancho_editar}px;' type='submit' value='$row[area_id]' name='area_modificar' > </td>
           <td> $row[nombre]  </td>
           <td> $activo  </td>";

	      }

echo "</table>
    </form>
    <strong>$Total: $q_registros</strong>";

require('ant_123_prox.inc');  ## L�nea que muestra <Ant | 1 2 3..... | Prox>
                              // Line that shows <Prev | 1 2 3 ..... | Prox>


echo    "
  </body>
</html>";


?>
