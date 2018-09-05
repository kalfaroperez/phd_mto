<?php

require ("config.inc.php");


function getPlantas(){

      global $Host,$Usuario,$Contrasena, $Base;
      $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
      $Uso=mysql_select_db($Base) or die (mysql_error());

      $query="SELECT p.id_planta, p.nombre, p.descripcion FROM {$MyPHD} planta p";

      $result=mysql_query($query) or die (mysql_error());
      mysql_close($Conect);

      while ( $row = mysql_fetch_array ( $result ) ) {
        $data [] = $row;
      }
      return $data;

}
function getPlantaByID($id_planta){

      global $Host,$Usuario,$Contrasena, $Base;
      $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
      $Uso=mysql_select_db($Base) or die (mysql_error());

      $query="SELECT p.id_planta, p.nombre as nombre_planta FROM {$MyPHD} planta p WHERE id_planta='$id_planta'";

      $result=mysql_query($query) or die (mysql_error());
      mysql_close($Conect);

      while ( $row = mysql_fetch_array ( $result ) ) {
        $data [] = $row;
      }
      return $data;

}

function buscarPlantaAutocompletar($term){
    global $Host,$Usuario,$Contrasena, $Base;
    $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
    $Uso=mysql_select_db($Base) or die (mysql_error());

    $query="SELECT p.id_planta, p.nombre, p.descripcion FROM {$MyPHD} planta p WHERE p.nombre like '%$term%' ";
    $result=mysql_query($query) or die (mysql_error());
    mysql_close($Conect);

    while ( $row = mysql_fetch_array ( $result ) ) {
      $data [] = $row;
    }
    return $data;
}

function buscarEquiposPrincipalesAutocompletar($id_planta, $term){
  global $Host,$Usuario,$Contrasena, $Base;
  if (isset($id_planta)) {
    if (!empty($id_planta)) {
        $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
        $Uso=mysql_select_db($Base) or die (mysql_error());

        $query="SELECT rp.id_equipo_princ, rp.nombre_equipo_princ as nombre
                FROM registro_equipo rp
                WHERE rp.id_planta = $id_planta and rp.nombre_equipo_princ like '%$term%'
                GROUP BY id_equipo_princ, nombre;
                ";

        $result=mysql_query($query) or die (mysql_error());
        if(!empty($result)){
          while ( $row = mysql_fetch_array ( $result ) ) {
            $data [] = $row;
          }
          return $data;
          mysql_close($Conect);

        }else{
            return $data = "";
        }
        mysql_close($Conect);
    }else{
        return $data = "";
    }
    return $data;
  }
}

function buscarEquiposSecundarioAutocompletar($id_planta, $id_equipo_princ, $term){
  global $Host,$Usuario,$Contrasena, $Base;
  if (isset($id_planta) && isset($id_equipo_princ)) {
    if (!empty($id_planta)  && !empty($id_equipo_princ)) {
        $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
        $Uso=mysql_select_db($Base) or die (mysql_error());

        $query="  SELECT rp.id_equipo_sec, rp.nombre_equipo_sec as nombre
                  FROM registro_equipo rp
                  WHERE rp.id_planta = $id_planta and rp.id_equipo_princ = $id_equipo_princ
                  and rp.nombre_equipo_sec like '%$term%'
                  group by id_equipo_sec, nombre;";

        $result=mysql_query($query) or die (mysql_error());
        if(!empty($result)){
          while ( $row = mysql_fetch_array ( $result ) ) {
            $data [] = $row;
          }
          return $data;
          mysql_close($Conect);

        }else{
            return $data = "";
        }
        mysql_close($Conect);
      }

  }else{
      return $data = "";
  }
  return $data;
}

function buscarComponenteAutocompletar($id_planta, $id_equipo_princ, $id_equipo_sec, $term){
  global $Host,$Usuario,$Contrasena, $Base;
  if (isset($id_planta) && isset($id_equipo_princ) && isset($id_equipo_sec)) {
    if (!empty($id_planta)  && !empty($id_equipo_princ) && !empty($id_equipo_sec)) {
        $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
        $Uso=mysql_select_db($Base) or die (mysql_error());

        $query="  SELECT rp.id_componente, rp.nombre_componente as nombre
                  FROM registro_equipo rp
                  WHERE rp.id_planta = $id_planta and rp.id_equipo_princ = $id_equipo_princ and id_equipo_sec = $id_equipo_sec
                  and rp.nombre_componente like '%$term%'
                  group by id_componente, nombre;";

        $result=mysql_query($query) or die (mysql_error());
        if(!empty($result)){
          while ( $row = mysql_fetch_array ( $result ) ) {
            $data [] = $row;

          }
          return $data;
          mysql_close($Conect);
        }else{
            return $data = "";
        }

      }

  }else{
      return $data = "";
  }
  return $data;
}

function getEquiposPrincipales($id_planta=""){
  global $Host,$Usuario,$Contrasena, $Base;
  if (isset($id_planta)) {
    if (!empty($id_planta)) {
        $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
        $Uso=mysql_select_db($Base) or die (mysql_error());

        $query="SELECT id_equipo_princ, nombre_equipo_princ as nombre
                FROM registro_equipo rp
                WHERE id_planta = $id_planta
                GROUP BY id_equipo_princ, nombre;
                ";

        $result=mysql_query($query) or die (mysql_error());
        if(!empty($result)){
          while ( $row = mysql_fetch_array ( $result ) ) {
            $data [] = $row;
          }
        }
        return $data;
        mysql_close($Conect);
    }else{
        return $data = "";
    }
  }else{
      return $data = "";
  }
  return $data;
}

function getEquipoPrincipalByID($id_equipo_princ){
    global $Host,$Usuario,$Contrasena, $Base;

    $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
    $Uso=mysql_select_db($Base) or die (mysql_error());

    $query="SELECT ep.id_equipo_princ, ep.nombre as nombre_equipo_princ, ep.descripcion
            FROM equipo_principal ep
            WHERE ep.id_equipo_princ='$id_equipo_princ'";

    $result=mysql_query($query) or die (mysql_error());
    if(!empty($result)){
      while ( $row = mysql_fetch_array ( $result ) ) {
        $data [] = $row;
      }
    }

    mysql_close($Conect);

    return $data;
}

function getEquiposPrincipalesAll(){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso=mysql_select_db($Base) or die (mysql_error());

  $query="SELECT ep.id_equipo_princ, ep.nombre, ep.descripcion
          FROM equipo_principal ep";

  $result=mysql_query($query) or die (mysql_error());
  if(!empty($result)){
    while ( $row = mysql_fetch_array ( $result ) ) {
      $data [] = $row;
    }
  }

  mysql_close($Conect);

  return $data;
}

function getEquiposSecundarioAll(){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso=mysql_select_db($Base) or die (mysql_error());

  $query="SELECT * FROM equipo_secundario ep";

  $result=mysql_query($query) or die (mysql_error());
  while ( $row = mysql_fetch_array ( $result ) ) {
    $data [] = $row;
  }
  return $data;
  mysql_close($Conect);

  return $data;
}

function getEquipoSecundarioByID($id_equipo_sec){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso=mysql_select_db($Base) or die (mysql_error());

  $query="SELECT ep.id_equipo_sec, ep.nombre as nombre_equipo_sec
          FROM equipo_secundario ep
          WHERE ep.id_equipo_sec='$id_equipo_sec'";

  $result=mysql_query($query) or die (mysql_error());
  if(!empty($result)){
    while ( $row = mysql_fetch_array ( $result ) ) {
      $data [] = $row;
    }
  }

  mysql_close($Conect);

  return $data;
}

function getEquipoSecundario($id_equipo_princ, $id_planta){
  global $Host,$Usuario,$Contrasena, $Base;

  if (isset($id_equipo_princ)) {
    if (!empty($id_equipo_princ)) {
        $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
        $Uso=mysql_select_db($Base) or die (mysql_error());

        $query="  SELECT id_equipo_sec, nombre_equipo_sec as nombre
                  FROM registro_equipo
                  WHERE id_planta = $id_planta and id_equipo_princ = $id_equipo_princ
                  group by id_equipo_sec, nombre;";

        $result=mysql_query($query) or die (mysql_error());
        while ( $row = mysql_fetch_array ( $result ) ) {
          $data [] = $row;
        }

        mysql_close($Conect);
      }else{
          return $data = "";
      }
    }else{
        return $data = "";
    }
    return $data;
}


function getComponentes($id_planta, $id_equipo_princ, $id_equipo_sec){
  global $Host,$Usuario,$Contrasena, $Base;

  if (isset($id_equipo_sec)) {
    if (!empty($id_equipo_sec)) {

        $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
        $Uso=mysql_select_db($Base) or die (mysql_error());

        $query="SELECT id_componente, nombre_componente AS nombre
                FROM registro_equipo
                WHERE id_planta = $id_planta and id_equipo_princ = $id_equipo_princ and id_equipo_sec = $id_equipo_sec
                GROUP BY id_componente, nombre";

        $result=mysql_query($query) or die (mysql_error());
        while ( $row = mysql_fetch_array ( $result ) ) {
          $data [] = $row;
        }
        mysql_close($Conect);
      }else{
          return $data = "";
      }
    }else{
        return $data = "";
    }
    return $data;
}

function getComponentesAll(){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso=mysql_select_db($Base) or die (mysql_error());

  $query="SELECT * FROM componentes";

  $result=mysql_query($query) or die (mysql_error());
  while ( $row = mysql_fetch_array ( $result ) ) {
    $data [] = $row;
  }
  return $data;
  mysql_close($Conect);

  return $data;
}

function getComponenteByID($id_componente){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso=mysql_select_db($Base) or die (mysql_error());

  $query="SELECT c.id_componente, c.nombre as nombre_componente
          FROM componentes c
          WHERE id_componente='$id_componente'";

  $result=mysql_query($query) or die (mysql_error());
  while ( $row = mysql_fetch_array ( $result ) ) {
    $data [] = $row;
  }

  mysql_close($Conect);

  return $data;
}

function editar_Equipo_principal($id_elemento, $nombre="", $descripcion="", $estado=""){
    global $Host,$Usuario,$Contrasena, $Base;

    $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
    $Uso = mysql_select_db($Base) or die (mysql_error());
    $fecha =date('Y-m-d h:i:s');
    $query="UPDATE equipo_principal SET
              nombre = '$nombre',
              descripcion = '$descripcion',
              estado = '$estado',
              update_oper = 'update',
              update_datetime = '$fecha'
            WHERE id_equipo_princ = '$id_elemento'
            ";

    $result=mysql_query($query) or die (mysql_error());

    if ($result == 1) {
        $resultado = "ok";
    }else {
      $resultado = "malo";
    }
    mysql_close($Conect);

    return $resultado;
}

function deleteEquipoPrincipal($id_elemento){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso = mysql_select_db($Base) or die (mysql_error());
  $fecha =date('Y-m-d h:i:s');
  $query="DELETE FROM equipo_principal WHERE id_equipo_princ = '$id_elemento' ";

  $result=mysql_query($query) or die (mysql_error());

  if ($result == 1) {
      $resultado = "ok";
  }else {
    $resultado = "malo";
  }
  mysql_close($Conect);

  return $resultado;
}

function insertarEquipoPrincipal($nombre="", $descripcion="", $estado=""){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso = mysql_select_db($Base) or die (mysql_error());
  $fecha =date('Y-m-d h:i:s');
  $query="INSERT INTO equipo_principal(
              nombre,
              descripcion,
              estado,
              insert_oper,
              insert_datetime)
            VALUES(
            '$nombre',
            '$descripcion',
            '$estado',
            'insert',
            '$fecha')
          ";

  $result=mysql_query($query) or die (mysql_error());

  if ($result == 1) {

      // # Levanto el n�mero de ticket para informarlo al operador.
    	// Get the number of ticket to inform it to the operator.

    	$query = "SELECT LAST_INSERT_ID() as id_equipo_princ";
    	$result = mysql_query ( $query ) or die ( mysql_error () );
    	$row = mysql_fetch_array ( $result );
    	$id_equipo_princ = $row ['id_equipo_princ'];
      $resultado = array('id_equipo_princ' => $id_equipo_princ, "resultado" => "ok");
  }else {
    $resultado = "malo";
  }
  mysql_close($Conect);

  return $resultado;

}


function editar_EquipoSecundario($id_elemento, $nombre="", $descripcion="", $estado=""){
    global $Host,$Usuario,$Contrasena, $Base;

    $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
    $Uso = mysql_select_db($Base) or die (mysql_error());
    $fecha =date('Y-m-d h:i:s');
    $query="UPDATE equipo_secundario SET
              nombre = '$nombre',
              descripcion = '$descripcion',
              estado = '$estado',
              update_oper = 'update',
              update_datetime = '$fecha'
            WHERE id_equipo_sec = '$id_elemento'
            ";

    $result=mysql_query($query) or die (mysql_error());

    if ($result == 1) {
        $resultado = "ok";
    }else {
      $resultado = "malo";
    }
    mysql_close($Conect);

    return $resultado;
}

function deleteEquipoSecundario($id_elemento){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso = mysql_select_db($Base) or die (mysql_error());
  $fecha =date('Y-m-d h:i:s');
  $query="DELETE FROM equipo_secundario WHERE id_equipo_sec = '$id_elemento' ";

  $result=mysql_query($query) or die (mysql_error());

  if ($result == 1) {
      $resultado = "ok";
  }else {
    $resultado = "malo";
  }
  mysql_close($Conect);

  return $resultado;
}

function insertarEquipoSecundario($nombre="", $descripcion="", $estado=""){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso = mysql_select_db($Base) or die (mysql_error());
  $fecha =date('Y-m-d h:i:s');
  $query="INSERT INTO equipo_secundario(
              nombre,
              descripcion,
              estado,
              insert_oper,
              insert_datetime)
            VALUES(
            '$nombre',
            '$descripcion',
            '$estado',
            'insert',
            '$fecha')
          ";

  $result=mysql_query($query) or die (mysql_error());

  if ($result == 1) {
      $resultado = "ok";
  }else {
    $resultado = "malo";
  }
  mysql_close($Conect);

  return $resultado;

}



function editar_Planta($id_elemento, $nombre="", $descripcion="", $estado=""){
    global $Host,$Usuario,$Contrasena, $Base;

    $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
    $Uso = mysql_select_db($Base) or die (mysql_error());
    $fecha =date('Y-m-d h:i:s');
    $query="UPDATE planta SET
              nombre = '$nombre',
              descripcion = '$descripcion',
              estado = '$estado',
              update_oper = 'update',
              update_datetime = '$fecha'
            WHERE id_planta = '$id_elemento'
            ";

    $result=mysql_query($query) or die (mysql_error());

    if ($result == 1) {
        $resultado = "ok";
    }else {
      $resultado = "malo";
    }
    mysql_close($Conect);

    return $resultado;
}

function insertarPlanta($nombre="", $descripcion="", $estado=""){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso = mysql_select_db($Base) or die (mysql_error());
  $fecha =date('Y-m-d h:i:s');
  $query="INSERT INTO planta(
              nombre,
              descripcion,
              estado,
              insert_oper,
              insert_datetime)
            VALUES(
            '$nombre',
            '$descripcion',
            '$estado',
            'insert',
            '$fecha')
          ";

  $result=mysql_query($query) or die (mysql_error());

  if ($result == 1) {
      $resultado = "ok";
  }else {
    $resultado = "malo";
  }
  mysql_close($Conect);

  return $resultado;

}

function deletePlanta($id_elemento){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso = mysql_select_db($Base) or die (mysql_error());
  $fecha =date('Y-m-d h:i:s');
  $query="DELETE FROM planta WHERE id_planta = '$id_elemento' ";

  $result=mysql_query($query) or die (mysql_error());

  if ($result == 1) {
      $resultado = "ok";
  }else {
    $resultado = "malo";
  }
  mysql_close($Conect);

  return $resultado;
}


function editarComponente($id_elemento, $nombre="", $descripcion="", $estado=""){
    global $Host,$Usuario,$Contrasena, $Base;

    $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
    $Uso = mysql_select_db($Base) or die (mysql_error());
    $fecha =date('Y-m-d h:i:s');
    $query="UPDATE componentes SET
              nombre = '$nombre',
              descripcion = '$descripcion',
              estado = '$estado',
              update_oper = 'update',
              update_datetime = '$fecha'
            WHERE id_componente = '$id_elemento'
            ";

    $result=mysql_query($query) or die (mysql_error());

    if ($result == 1) {
        $resultado = "ok";
    }else {
      $resultado = "malo";
    }
    mysql_close($Conect);

    return $resultado;
}

function deleteComponente($id_elemento){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso = mysql_select_db($Base) or die (mysql_error());
  $fecha =date('Y-m-d h:i:s');
  $query="DELETE FROM componentes WHERE id_componente = '$id_elemento' ";

  $result=mysql_query($query) or die (mysql_error());

  if ($result == 1) {
      $resultado = "ok";
  }else {
    $resultado = "malo";
  }
  mysql_close($Conect);

  return $resultado;
}

function insertarComponente($nombre="", $descripcion="", $estado=""){
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso = mysql_select_db($Base) or die (mysql_error());
  $fecha =date('Y-m-d h:i:s');
  $query="INSERT INTO componentes(
              nombre,
              descripcion,
              estado,
              insert_oper,
              insert_datetime)
            VALUES(
            '$nombre',
            '$descripcion',
            '$estado',
            'insert',
            '$fecha')
          ";

  $result=mysql_query($query) or die (mysql_error());

  if ($result == 1) {
      $resultado = "ok";
  }else {
    $resultado = "malo";
  }
  mysql_close($Conect);

  return $resultado;

}

function GetAllEquipoClasificados()
{
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso=mysql_select_db($Base) or die (mysql_error());

  $query="SELECT * FROM registro_equipo ORDER BY id_planta DESC";

  $result=mysql_query($query) or die (mysql_error());
  mysql_close($Conect);

  while ( $row = mysql_fetch_array ( $result ) ) {
    $data [] = $row;
  }
  return $data;
}

function insertarClasificacionEquipos($id_planta, $id_equipo_princ, $id_equipo_sec, $id_componente, $nombre_planta, $nombre_equipo_princ, $nombre_equipo_sec, $nombre_componente)
{
    global $Host,$Usuario,$Contrasena, $Base;

    $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
    $Uso = mysql_select_db($Base) or die (mysql_error());
    $fecha =date('Y-m-d h:i:s');

    if ($id_planta != 0 && $id_equipo_princ != 0 && !empty($id_planta) && !empty($id_equipo_princ) ) {

      $query ="";
      $query="INSERT INTO registro_equipo(
                  id_equipo_princ,
                  nombre_equipo_princ,
                  id_planta,
                  nombre_planta,
                  id_equipo_sec,
                  nombre_equipo_sec,
                  id_componente,
                  nombre_componente
                  )
                VALUES(
                '$id_equipo_princ',
                '$nombre_equipo_princ',
                '$id_planta',
                '$nombre_planta',
                '$id_equipo_sec',
                '$nombre_equipo_sec',
                '$id_componente',
                '$nombre_componente'
                )
              ";
      $result=mysql_query($query) or die (mysql_error());
      $id_registro_equipo = mysql_insert_id();
      if ($result == 1) {
          $resultado = "ok";

      }else {
        $resultado = "malo";
      }
  }

  mysql_close($Conect);

  return $resultado;
}

function editarClasificacionEquipos($id_registro_equipo, $id_planta, $id_equipo_princ, $id_equipo_sec, $id_componente, $nombre_planta, $nombre_equipo_princ, $nombre_equipo_sec, $nombre_componente)
{
    global $Host,$Usuario,$Contrasena, $Base;

    $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
    $Uso = mysql_select_db($Base) or die (mysql_error());
    $fecha =date('Y-m-d h:i:s');

    if ($id_registro_equipo != 0 && !empty($id_registro_equipo)) {

      $query ="";
      $query="UPDATE registro_equipo SET
                  id_equipo_princ = '$id_equipo_princ',
                  nombre_equipo_princ = '$nombre_equipo_princ',
                  id_planta = '$id_planta',
                  nombre_planta = '$nombre_planta',
                  id_equipo_sec = '$id_equipo_sec',
                  nombre_equipo_sec = '$nombre_equipo_sec',
                  id_componente = '$id_componente',
                  nombre_componente = '$nombre_componente'
                WHERE id_registro_equipo = '$id_registro_equipo'

              ";
      $result=mysql_query($query) or die (mysql_error());

      if ($result == 1) {
          $resultado = "ok";
      }else {
        $resultado = "malo";
      }
  }

  mysql_close($Conect);

  return $resultado;
}
function deleteClasificacionEquipos($id_registro)
{
  global $Host,$Usuario,$Contrasena, $Base;

  $Conect = mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
  $Uso = mysql_select_db($Base) or die (mysql_error());

  if ($id_registro != 0 && !empty($id_registro)) {
    $query ="DELETE FROM registro_equipo WHERE id_registro_equipo = '$id_registro';";
    $result=mysql_query($query) or die (mysql_error());
    if ($result == 1) {
        $resultado = "ok";
    }else {
      $resultado = "malo";
    }
  }
}

?>
