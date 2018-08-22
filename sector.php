<?PHP
/*
    Nombre: sector.php
    Autor: Julio Tuozzo
    Funci�n: Controlador de administraci�n de sectores.
    Function: Sectors administration controller.
    Ver: 2.12
    
*/

session_start();
require('config.inc.php');
require($Include.'lang.inc');

if (!isset($_SESSION['PHD_NIVEL']) or $_SESSION['PHD_NIVEL']<20)
    {include($Include.'login.inc');
     exit();
    }

## Depuro los GETs
// GETs sanitization

if (get_magic_quotes_gpc())
    { foreach($_GET as $clave => $valor)
      {$_GET[$clave]=stripslashes($_GET[$clave]);
      }
    }

foreach($_GET as $clave => $valor)
     {$_GET[$clave]=trim(htmlentities($_GET[$clave],ENT_QUOTES,"ISO-8859-1"));
     }

## Inicializo $mensaje que es donde voy a colocar los mensajes de error en caso de existir.
// Inicializing $mensaje that is where going to place the messages of error in case of existing.

$mensaje='<br />';

if (isset($_GET[orden]))
    {$orden=$_GET[orden];
    }
else
    {$orden="sector_id";
    }

$sentido=$_GET['sentido'];
$q_registros=$_GET['q_registros'];
$pagina=$_GET['pagina'];

## Me conecto con la base de datos
// Database connect

$Conect=mysql_connect($Host,$Usuario,$Contrasena) or die (mysql_error());
$Uso=mysql_select_db($Base) or die (mysql_error());

 
## Verifico que no se haya "posteado" el formulario, en caso de ser as�, veo
## cu�l fue la opci�n que se clicke�.
// Verify that the form has not been post, in case of being thus, see which was
// the selected option.

    if (isSet($_POST['guardar']))
	   {require($Include.'sector_insert.inc');
        $type_cancelar="hidden";
        $value_guardar=$Save;
        $name_guardar="guardar";
   	    }
    elseif (isSet($_POST['salir']))
	   { unset($_SESSION['SECTOR']);
         header("Location: index.php");
   	    }
    elseif (isSet($_POST['sector_modificar']))
        {require($Include.'sector_select.inc');
         $type_cancelar="submit";
         $value_guardar=$Modif;
         $name_guardar="modificar";
        }
    elseif (isSet($_POST['modificar']))
        {require($Include.'sector_modif.inc');
                if ($fail_modif)
                    {$type_cancelar="submit";
                     $value_guardar=$Modif;
                     $name_guardar="modificar";
                    }
                 else
                    {$active_check="checked";
                     $type_cancelar="hidden";
                     $value_guardar=$Save;
                     $name_guardar="guardar";
                    }
        }
    else
        {$active_check="checked";
         $type_cancelar="hidden";
         $value_guardar=$Save;
         $name_guardar="guardar";
        }

require($Include.'sector.inc'); ## Vista del formulario
                     // Form view
?>
