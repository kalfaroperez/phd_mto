<?PHP
/*
    Nombre: ticket_selector.inc
    Autor: Julio Tuozzo
    Funci�n: Cabecera de selecci�n de tickets
    Function: Ticket selection header.
    Ver: 2.12
*/
?>

<div id='contenido'>
  <form  class='consulta' method='post' action='<?php echo $_SERVER['PHP_SELF'] ?> '>


      <?php echo $State.':'; ?>
      <select name='estado'>
         <option>  </option>";

<?php
  ## Busco en la tabla 'atributo' los estados
  // Search in the table 'atributo' the states

        $query="SELECT valor
                FROM {$MyPHD}atributo
                WHERE atributo='$State'
                ORDER BY valor";
        $result_00=mysql_query($query) or die (mysql_error());

        while ($row = mysql_fetch_array($result_00)){
          if ($row['valor']==$_SESSION['PHD_MAIN_CONS']['estado']){
            $selected="selected='selected'";
          }else{
            $selected='';
          }
?>
          <option <?php echo $selected; ?> value='<?php echo $row['valor'] ?>'> <?php echo $row['valor']; ?> </option>;
<?php
        }
?>
    </select>
    <input class='boton_lupa' style='width: 30px; cursor:pointer' type='submit' value='' name='buscar' />
    
  </form>
  </div>
