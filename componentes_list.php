
<?PHP
/*
    Nombre: atributo.php
    Autor: Julio Tuozzo
    Funci�n: Controlador de administraci�n de atributos de los casos.
    Function: Tickets attributes administration controller.
    Ver: 2.12

*/

session_start();
require('config.inc.php');
require($Include.'lang.inc');


if (!isset($_SESSION['PHD_NIVEL']) or $_SESSION['PHD_NIVEL']<20)
    {require($Include.'login.inc');
     exit();
    }

## Depuro los GETs
// GETs sanitization

if (get_magic_quotes_gpc())
    { foreach($_GET as $clave => $val)
      {$_GET[$clave]=stripslashes($_GET[$clave]);
      }
    }

foreach($_GET as $clave => $val)
     {$_GET[$clave]=trim(htmlentities($_GET[$clave],ENT_QUOTES,"ISO-8859-1"));
     }


## Inicializo $mensaje que es donde voy a colocar los mensajes de error en caso de existir, inicializo las variables que vienen por GET.
// Inicializing $mensaje that is where I am going to place the messages of error in case of existing.

$mensaje='<br />';

if (isset($_GET[orden]))
    {$orden=$_GET[orden];
    }
else
    {$orden="atributo";
    }

$sentido=$_GET['sentido'];
$q_registros=$_GET['q_registros'];
$pagina=$_GET['pagina'];


## Me conecto con la base de datos
// Database connect

    $Conect=mysql_connect($Host,$Usuario,$Contrasena) or die ($No_database);
    $Uso=mysql_select_db($Base) or die ($No_database);

## Verifico que no se haya "posteado" el formulario, en caso de ser as�, veo
## cu�l fue la opci�n que se clicke�.
// Verify that the form has not been post, in case of being thus, see which was
// the selected option.

    if (isSet($_POST['guardar'])){
      //$mensaje  = guardar();
   	}
    elseif (isSet($_POST['salir'])){
        unset($_SESSION['EQUIPO_PRINCIPAL']);
         header("Location: index.php");
   	}
    elseif (isSet($_POST['activo'])){
      //require($Include.'atr_activo.inc');
    }

    /*function guardar(){
        $nombre = trim(strip_tags($_POST['nombre']));
        $descripcion =trim(strip_tags($_POST['descripcion']));
        $user=$_SESSION['PHD_OPERADOR'];
        if (empty($nombre)){
           $mensaje=$Blank_value;

         //}elseif (!preg_match('#^[-a-zA-Z0-9" "]+$#', $nombre)){
          //$mensaje="$nombre $Invalid_character";
         } else {
           ## Verifico que no exista
           // Check that not existe

              $query="INSERT INTO equipo_principal
                    VALUES
                    (NULL,
                      '$nombre',
                      '$descripcion',
                      '$user',
                      NOW(),
                      '',
                      NOW())";


              $insert = mysql_query($query) or die (mysql_error());

              if ($inset!="0") {
                $mensaje = "Registro Exitoso :)";
              }else{
                $mensaje = "Registro Fallido :(";
              }
              return $mensaje;
        }
    }/*/

    require($Include.'componentes_list.inc');


?>
