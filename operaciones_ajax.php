
<?PHP
  /*
      Nombre: operador.php
      Autor: Julio Tuozzo
      Funci�n: Controlador de administraci�n de operadores del sistema
      Function: Sistem operators administration controller.
      Ver: 2.12
  */
session_start();
require('config.inc.php');
require($Include.'lang.inc');

require ('operaciones_sql.php');

require('funciones.inc.php');

## Me conecto con la base de datos para poder seleccionar
## las distintas opciones de los atributos, usuarios, etc.
// Connect with the data base to be able to select
// the different options from the attributes, users, etc.

$accion = (isset($_GET['accion'])) ? $_GET['accion'] : $_POST['accion'];
$elemento_html =  $_POST['elemento_html'];

switch ($accion) {
  case 'prueba':
    echo "<pre>"; print_r($_POST);echo "</pre>"; die;
    break;
  case 'load_autocomplete_planta':
    $term = $_GET['term'];
    cargar_autocomplete_planta($term);
    break;

  case 'load_autocomplete_equipoPrincipal':
    $term = $_GET['term'];
    $id_planta = $_GET['id_planta'];
    cargar_autocomplete_equipoPrinc($id_planta, $term);
    break;

  case 'load_autocomplete_equipoSecundario':
      $term = $_GET['term'];
      $id_planta = $_GET['id_planta'];
      $id_equipo_princ = $_GET['id_equipo_princ'];
      cargar_autocomplete_equipoSecundario($id_planta, $id_equipo_princ, $term);
      break;

case 'load_autocomplete_componente':
    $term = $_GET['term'];
    $id_planta = $_GET['id_planta'];
    $id_equipo_princ = $_GET['id_equipo_princ'];
    $id_equipo_sec = $_GET['id_equipo_sec'];
    cargar_autocomplete_componente($id_planta, $id_equipo_princ, $id_equipo_sec, $term);
    break;


  case 'cargar_planta':
    cargar_select_planta();
    break;
  case 'seleccion_planta':
    cargar_select_equipo_princ();
    break;
  case 'seleccion_equipo_principal':
      cargar_select_equipo_sec();
      break;
  case 'seleccion_equipo_secundario':
      cargar_componentes();
      break;
  case 'listar_equipos_princ':
      lista_equipos_principales($elemento_html);
      break;
  case 'edit_equipo_principal':
      edit_equipo_principal();
      break;
  case 'delete_equipo_principal':
      delete_equipo_principal();
      break;
  case 'insertar_equipo_principal':
      insertar_equipo_principal();
      break;
  case 'listar_equipos_secundario':
      lista_equipos_secundario($elemento_html);
      break;
  case 'edit_equipo_secundario':
      edit_equipo_secundario();
      break;
  case 'delete_equipo_secundario':
      delete_equipo_secundario();
      break;
  case 'insertar_equipo_secundario':
      insertar_equipo_secundario();
      break;
  case 'listar_planta':
      lista_plantas();
      break;
  case 'edit_planta':
      edit_planta();
      break;
  case 'delete_planta':
      delete_planta();
      break;
  case 'insert_planta':
      insertar_planta();
      break;
  case 'listar_componentes':
      listar_componentes($elemento_html);
      break;
  case 'edit_componente':
      edit_componente();
      break;
  case 'delete_componente':
      delete_componente();
      break;
  case 'insertar_componente':
      insertar_componente();
      break;
  case 'listar_equipos_clasificados':
    listar_equipos_clasificados();
    break;

  case 'insert_clasificacion':
    registrar_clasificacion($accion);
    break;

  case 'edit_clasificacion':
    registrar_clasificacion($accion);
    break;

  case 'delete_clasificacion':
    $id_registro = $_POST['id_elemento'];
    delete_clasificacion($id_registro);
    break;

}

function cargar_autocomplete_planta($term){
    $plantas = buscarPlantaAutocompletar($term);
    if (!empty($plantas)) {
        while (list($k, $row) = each($plantas)) {
          $id = $row["id_planta"];
          $valor = $row["nombre"];
          //$data [] = array('id'=> $id, 'label' => $valor, 'value' => $valor);
          $data [] = array('id'=> $id, 'text' => $valor);
        }
    }
    echo json_encode($data);
}

function cargar_autocomplete_equipoPrinc($id_planta, $term){
    if (!empty($id_planta)) {
        $data_equipos = buscarEquiposPrincipalesAutocompletar($id_planta, $term);
        if (!empty($data_equipos)) {
          while (list($k, $row) = each($data_equipos)) {
            $id = $row["id_equipo_princ"];
            $valor = $row["nombre"];
            $data [] = array('id'=> $id, 'label' => $valor, 'value' => $valor);
          }
          echo json_encode($data);
        }else{
          echo json_encode(array('0' => 'Sin resultados, Seleccione una planta'));
        }
    }else{
        echo json_encode(array('0' => 'Sin resultados, Seleccione una planta'));
    }
}

function cargar_autocomplete_equipoSecundario($id_planta, $id_equipo_princ, $term){
    if (!empty($id_planta) && !empty($id_equipo_princ)) {
        $data_equipos = buscarEquiposSecundarioAutocompletar($id_planta, $id_equipo_princ, $term);
        if (!empty($data_equipos)) {
          while (list($k, $row) = each($data_equipos)) {
            $id = $row["id_equipo_sec"];
            $valor = $row["nombre"];
            $data [] = array('id'=> $id, 'label' => $valor, 'value' => $valor);
          }
          echo json_encode($data);
        }else{
          echo json_encode(array('0' => 'Sin resultados, Seleccione una planta'));
        }
    }else{
        echo json_encode(array('0' => 'Sin resultados, Seleccione una planta'));
    }
}


function cargar_autocomplete_componente($id_planta, $id_equipo_princ, $id_equipo_sec, $term){
  if (!empty($id_planta)  && !empty($id_equipo_princ) && !empty($id_equipo_sec)) {
      $data_equipos = buscarComponenteAutocompletar($id_planta, $id_equipo_princ, $id_equipo_sec, $term);
      if (!empty($data_equipos)) {
        while (list($k, $row) = each($data_equipos)) {
          $id = $row["id_componente"];
          $valor = $row["nombre"];
          $data [] = array('id'=> $id, 'label' => $valor, 'value' => $valor);
        }
        echo json_encode($data);
      }else{
        echo json_encode(array('0' => 'Sin resultados, Seleccione una planta'));
      }
  }else{
      echo json_encode(array('0' => 'Sin resultados, Seleccione una planta'));
  }
}

function cargar_select_planta(){
  $plantas = getPlantas();

  if (!empty($plantas)) {
    $selected = ""; $id_planta = 0;
    if (isset($_POST['id_planta'])) {
      if (!empty($_POST['id_planta'])) {
        if ($_POST['id_planta'] > 0) {
          $id_planta = $_POST['id_planta'];
        }
      }
    }
    $option .= <<<HTML
    <option id_planta="0" value="0">Seleccione..</option>
HTML;
    while (list($k, $row) = each($plantas)) {
      $key = $row["id_planta"];
      $valor = $row["nombre"];

      $selected = ($key == $id_planta) ? "selected" : "";
      $option .= <<<HTML
      <option value="$key" $selected>$valor</option>
HTML;

    }

    $html =<<<HTML
            $option
HTML;
  }

  echo $html;
}

function cargar_select_equipo_princ(){
  if (isset($_POST["id_planta"])) {
    if (!empty($_POST["id_planta"])) {
      $id_planta = $_POST["id_planta"];
      $equipos_Princ = getEquiposPrincipales($id_planta);
      if (!empty($equipos_Princ)) {

        while (list($k, $row) = each($equipos_Princ)) {
            $key = $row["id_equipo_princ"];
            $valor = $row["nombre"];
            $return_arr[] = array(
              "id_equipo_princ" => $key,
              "nombre"          => $valor);
        }
        // Encoding array in JSON format
        echo json_encode($return_arr);
      }else{
        unset($return_arr);
        echo json_encode($return_arr);
      }

    }

  }else{
    echo "";
  }

}

function cargar_select_equipo_sec(){
    if (isset($_POST['id_equipo_princ']) && isset($_POST['id_planta'])) {
      if (!empty($_POST['id_equipo_princ']) && !empty($_POST['id_planta'])) {

          $id_equipo_princ = $_POST['id_equipo_princ'];
          $id_planta = $_POST['id_planta'];
          $equipos_sec = getEquipoSecundario($id_equipo_princ, $id_planta);
          if (!empty($equipos_sec)) {
              while (list($k, $row) = each($equipos_sec)) {
                $key = $row["id_equipo_sec"];
                $valor = $row["nombre"];
                $return_arr[] = array(
                  "id_equipo_sec" => $key,
                  "nombre"          => $valor);
              }
              echo json_encode($return_arr);
          }else{
            unset($return_arr);
            echo json_encode($return_arr);
          }
      }

    }else{
      echo "";
    }
}
function cargar_componentes(){

  if (isset($_POST["id_equipo_sec"]) && isset($_POST['id_equipo_princ']) && isset($_POST['id_planta']) ) {
    if (!empty($_POST["id_equipo_sec"]) && !empty($_POST['id_equipo_princ']) && !empty($_POST['id_planta'])) {

        $id_planta = $_POST['id_planta'];
        $id_equipo_princ = $_POST['id_equipo_princ'];
        $id_equipo_sec = $_POST["id_equipo_sec"];
        $componentes = getComponentes($id_planta, $id_equipo_princ, $id_equipo_sec);

        if (!empty($componentes)) {
            while (list($k, $row) = each($componentes)) {
              $key = $row["id_componente"];
              $valor = $row["nombre"];
              $return_arr[] = array(
                "id_componente" => $key,
                "nombre"          => $valor);
            }
            echo json_encode($return_arr);
        }else{
          unset($return_arr);
          echo json_encode($return_arr);
        }
    }
  }else {
    echo "";
  }
}

function lista_equipos_principales($elemento_html="tabla_html"){
    $data = getEquiposPrincipalesAll();
    $html="";
    if ($elemento_html == "tabla_html") {
      while(list($k, $row) = each($data)){
        $id = $row["id_equipo_princ"];
        $nombre = $row["nombre"];
        $descripcion = $row["descripcion"];

          $html .=<<<html
            <tr>
              <td>
                <span class="custom-checkbox">
                  <input class="checkbox" type="checkbox" id="checkbox$id" name="options[]" value="1" >
                  <label for="checkbox$id"></label>
                </span>
              </td>
              <td>$nombre</td>
              <td>$descripcion</td>
              <td>-</td>
              <td>
                  <a id="editElementoModal$id" href="#editElementoModal" class="edit" data-toggle="modal" id_elemento="$id" nombre="$nombre" descripcion="$descripcion"><i class="material-icons" data-toggle="tooltip" title="Edit" >&#xE254;</i></a>
                  <a id="deleteElementoModal$id" href="#deleteElementoModal" class="delete" data-toggle="modal" id_elemento="$id" nombre="$nombre" descripcion="$descripcion"><i class="material-icons" data-toggle="tooltip" title="Delete" >&#xE872;</i></a>
              </td>
          </tr>
html;
      }
    }

    if ($elemento_html == "selector_html") {
      $selected = ""; $id_equipo_princ = 0;
      if (isset($_POST['id_equipo_princ'])) {
        if (!empty($_POST['id_equipo_princ'])) {
          if ($_POST['id_equipo_princ'] > 0) {
            $id_equipo_princ = $_POST['id_equipo_princ'];
          }
        }
      }
      $html .= <<<html
      <option value="0">Seleccione..</option>
html;
      while(list($k, $row) = each($data)){
        $id = $row["id_equipo_princ"];
        $nombre = $row["nombre"];
        $descripcion = $row["descripcion"];
        $selected = ($id == $id_equipo_princ) ? "selected" : "";
        $html .=<<<html
          <option value='$id' $selected> $nombre </option>
html;
      }
    }

  echo $html;
}



function  edit_equipo_principal(){
    $id_elemento = $_POST['id_elemento'];
    $nombre = $_POST["nombre"];
    $descripcion = $_POST["descripcion"];
    $estado = "1";

    $resultado = editar_Equipo_principal($id_elemento, $nombre, $descripcion, $estado);
    echo $resultado;
}

function delete_equipo_principal(){
    $id_elemento = $_POST['id_elemento'];
    $resultado = deleteEquipoPrincipal($id_elemento);
    echo $resultado;
}

function insertar_equipo_principal(){
  $nombre = $_POST["nombre"];
  $descripcion = $_POST["descripcion"];
  $estado = "1";

  $resultado = insertarEquipoPrincipal($nombre, $descripcion, $estado);
  echo $resultado;
}

function lista_plantas(){
  $data = getPlantas();
if (!empty($data)) {
  // code...

    $html="";
    while(list($k, $row) = each($data)){
      $id = $row["id_planta"];
      $nombre = $row["nombre"];
      $descripcion = $row["descripcion"];

        $html .=<<<html
          <tr>
            <td>
              <span class="custom-checkbox">
                <input class="checkbox" type="checkbox" id="checkbox$id" name="options[]" value="1" >
                <label for="checkbox$id"></label>
              </span>
            </td>
            <td>$nombre</td>
            <td>$descripcion</td>
            <td>
                <a id="editElementoModal$id" href="#editElementoModal" class="edit" data-toggle="modal" id_elemento="$id" nombre="$nombre" descripcion="$descripcion"><i class="material-icons" data-toggle="tooltip" title="Edit" >&#xE254;</i></a>
                <a id="deleteElementoModal$id" href="#deleteElementoModal" class="delete" data-toggle="modal" id_elemento="$id" nombre="$nombre" descripcion="$descripcion"><i class="material-icons" data-toggle="tooltip" title="Delete" >&#xE872;</i></a>
            </td>
        </tr>
html;
    }
  }else{
    $html .=<<<html
      <tr>
        <td colspan='4'> No hay resultados para mostrar</td>
    </tr>
html;
  }

  echo $html;
}


function edit_planta(){
    $id_elemento = $_POST['id_elemento'];
    $nombre = $_POST["nombre"];
    $descripcion = $_POST["descripcion"];
    $estado = "1";

    $resultado = editar_Planta($id_elemento, $nombre, $descripcion, $estado);
    echo $resultado;
}




function delete_planta(){
    $id_elemento = $_POST['id_elemento'];
    $resultado = deletePlanta($id_elemento);
    echo $resultado;
}

function insertar_planta(){
  $nombre = $_POST["nombre"];
  $descripcion = $_POST["descripcion"];
  $estado = "1";

  $resultado = insertarPlanta($nombre, $descripcion, $estado);
  echo $resultado;
}

function lista_equipos_secundario($elemento_html = "tabla_html"){
    $data = getEquiposSecundarioAll();
    if ($elemento_html == "tabla_html") {
    $html="";
    if (!empty($data)) {
      while(list($k, $row) = each($data)){
        $id = $row["id_equipo_sec"];
        $nombre = $row["nombre"];
        $descripcion = $row["descripcion"];

          $html .=<<<html
            <tr>
              <td>
                <span class="custom-checkbox">
                  <input class="checkbox" type="checkbox" id="checkbox$id" name="options[]" value="1" >
                  <label for="checkbox$id"></label>
                </span>
              </td>
              <td>$nombre</td>
              <td>$descripcion</td>
              <td>
                  <a id="editElementoModal$id" href="#editElementoModal" class="edit" data-toggle="modal" id_elemento="$id" nombre="$nombre" descripcion="$descripcion"><i class="material-icons" data-toggle="tooltip" title="Edit" >&#xE254;</i></a>
                  <a id="deleteElementoModal$id" href="#deleteElementoModal" class="delete" data-toggle="modal" id_elemento="$id" nombre="$nombre" descripcion="$descripcion"><i class="material-icons" data-toggle="tooltip" title="Delete" >&#xE872;</i></a>
              </td>
          </tr>
html;
        }
      }else{
        $html .=<<<html
          <tr>
            <td colspan='4'> No hay resultados para mostrar</td>
        </tr>
html;
      }
    }

    if ($elemento_html == "selector_html") {
      $selected = ""; $id_equipo_sec = 0;
      if (isset($_POST['id_equipo_sec'])) {
        if (!empty($_POST['id_equipo_sec'])) {
          if ($_POST['id_equipo_sec'] > 0) {
            $id_equipo_sec = $_POST['id_equipo_sec'];
          }
        }
      }
      $html .= <<<html
      <option value="0">Seleccione..</option>
html;
      if (!empty($data)) {
        while(list($k, $row) = each($data)){
          $id = $row["id_equipo_sec"];
          $nombre = $row["nombre"];
          $descripcion = $row["descripcion"];
          $selected = ($id == $id_equipo_sec) ? "selected" : "";
          $html .=<<<html
            <option value='$id' $selected> $nombre </option>
html;
        }
      }
    }

  echo $html;
}



function  edit_equipo_secundario(){
    $id_elemento = $_POST['id_elemento'];
    $nombre = $_POST["nombre"];
    $descripcion = $_POST["descripcion"];
    $estado = "1";

    $resultado = editar_EquipoSecundario($id_elemento, $nombre, $descripcion, $estado);
    echo $resultado;
}

function delete_equipo_secundario(){
    $id_elemento = $_POST['id_elemento'];
    $resultado = deleteEquipoSecundario($id_elemento);
    echo $resultado;
}

function insertar_equipo_secundario(){
  $nombre = $_POST["nombre"];
  $descripcion = $_POST["descripcion"];
  $estado = "1";

  $resultado = insertarEquipoSecundario($nombre, $descripcion, $estado);
  echo $resultado;
}



function listar_componentes($elemento_html = "tabla_html"){
    $data = getComponentesAll();
    if ($elemento_html == "tabla_html") {
      $html="";
      if (!empty($data)) {
        while(list($k, $row) = each($data)){
          $id = $row["id_componente"];
          $nombre = $row["nombre"];
          $descripcion = $row["descripcion"];

            $html .=<<<html
              <tr>
                <td>
                  <span class="custom-checkbox">
                    <input class="checkbox" type="checkbox" id="checkbox$id" name="options[]" value="1" >
                    <label for="checkbox$id"></label>
                  </span>
                </td>
                <td>$nombre</td>
                <td>$descripcion</td>
                <td>
                    <a id="editElementoModal$id" href="#editElementoModal" class="edit" data-toggle="modal" id_elemento="$id" nombre="$nombre" descripcion="$descripcion"><i class="material-icons" data-toggle="tooltip" title="Edit" >&#xE254;</i></a>
                    <a id="deleteElementoModal$id" href="#deleteElementoModal" class="delete" data-toggle="modal" id_elemento="$id" nombre="$nombre" descripcion="$descripcion"><i class="material-icons" data-toggle="tooltip" title="Delete" >&#xE872;</i></a>
                </td>
            </tr>
html;
        }
      }else{
        $html .=<<<html
          <tr>
            <td colspan='6'> No hay resultados para mostrar</td>
        </tr>
html;
      }
    }
    if ($elemento_html == "selector_html") {
      if (isset($_POST['id_componente'])) {
        if (!empty($_POST['id_componente'])) {
          if ($_POST['id_componente'] > 0) {
            $id_componente = $_POST['id_componente'];
          }
        }
      }
      $html .= <<<html
      <option value="0">Seleccione..</option>
html;
      if (!empty($data)) {

        while(list($k, $row) = each($data)){
          $id = $row["id_componente"];
          $nombre = $row["nombre"];
          $descripcion = $row["descripcion"];
          $selected = ($id == $id_componente) ? "selected" : "";
          $html .=<<<html
            <option value='$id' $selected> $nombre </option>
html;
        }
      }
    }


  echo $html;
}



function  edit_componente(){
    $id_elemento = $_POST['id_elemento'];
    $nombre = $_POST["nombre"];
    $descripcion = $_POST["descripcion"];
    $estado = "1";

    $resultado = editarComponente($id_elemento, $nombre, $descripcion, $estado);
    echo $resultado;
}

function delete_componente(){
    $id_elemento = $_POST['id_elemento'];
    $resultado = deleteComponente($id_elemento);
    echo $resultado;
}

function insertar_componente(){
  $nombre = $_POST["nombre"];
  $descripcion = $_POST["descripcion"];
  $estado = "1";

  $resultado = insertarComponente($nombre, $descripcion, $estado);
  echo $resultado;
}

function listar_equipos_clasificados()
{
  $data = GetAllEquipoClasificados();

  $html="";
  if (!empty($data)) {
    while(list($k, $row) = each($data)){
      $id = $k;

      $planta = $row["nombre_planta"];
      $equipo_princ = $row["nombre_equipo_princ"];
      $equipo_sec = $row["nombre_equipo_sec"];
      $componente = $row["nombre_componente"];

      $id_registro = $row["id_registro_equipo"];
      $id_planta = $row["id_planta"];
      $id_equipo_princ = $row["id_equipo_princ"];
      $id_equipo_sec = $row["id_equipo_sec"];
      $id_componente = $row["id_componente"];

        $html .=<<<html
          <tr>
            <td>
              <span class="custom-checkbox">
                <input class="checkbox" type="checkbox" id="checkbox$id" name="options[]" value="1" >
                <label for="checkbox$id"></label>
              </span>
            </td>
            <td>$planta</td>
            <td>$equipo_princ</td>
            <td>$equipo_sec</td>
            <td>$componente</td>
            <td>
                <a id="editElementoModal$id" href="#editElementoModal" class="edit" data-toggle="modal" id_elemento="$id_registro" id_planta="$id_planta" nombre_planta="$nombre_planta" id_equipo_princ="$id_equipo_princ" id_equipo_sec="$id_equipo_sec" id_componente="$id_componente"><i class="material-icons" data-toggle="tooltip" title="Edit" >&#xE254;</i></a>
                <a id="deleteElementoModal$id" href="#deleteElementoModal" class="delete" data-toggle="modal" id_elemento="$id_registro" nombre="$nombre" descripcion="$descripcion"><i class="material-icons" data-toggle="tooltip" title="Delete" >&#xE872;</i></a>
            </td>
        </tr>
html;
    }
  }else{
    $html .=<<<html
      <tr>
        <td colspan='6'> No hay resultados para mostrar</td>
    </tr>
html;
  }

echo $html;
}

function registrar_clasificacion($accion)
{
  $accion = $_POST["accion"] ;
  $id_planta = $_POST["id_planta"];
  $id_equipo_princ = $_POST["id_equipo_princ"];
  $id_equipo_sec = $_POST["id_equipo_sec"];
  $id_componente = $_POST["id_componente"];

  $nombre_planta = $_POST["nombre_planta"];
  $nombre_equipo_princ = $_POST["nombre_equipo_princ"];
  $nombre_equipo_sec = $_POST["nombre_equipo_sec"];
  $nombre_componente = $_POST["nombre_componente"];





  if ($accion == "insert_clasificacion") {
    //echo "Los ID => $id_planta, $id_equipo_princ, $id_equipo_sec, $id_componente"; die;
    $resultado = insertarClasificacionEquipos($id_planta, $id_equipo_princ, $id_equipo_sec, $id_componente,
                                              $nombre_planta, $nombre_equipo_princ, $nombre_equipo_sec, $nombre_componente);


    echo $resultado;
  }

  if ($accion == "edit_clasificacion") {
    $id_registro_equipo = $_POST['id_registro_equipo'];
    //echo "Los ID => $id_planta, $id_equipo_princ, $id_equipo_sec, $id_componente"; die;
    $resultado = editarClasificacionEquipos($id_registro_equipo, $id_planta, $id_equipo_princ, $id_equipo_sec, $id_componente,
                                              $nombre_planta, $nombre_equipo_princ, $nombre_equipo_sec, $nombre_componente);


    echo $resultado;
  }

}

function delete_clasificacion($id_registro){
    $resultado = deleteClasificacionEquipos($id_registro);
    echo $resultado;
}
?>
