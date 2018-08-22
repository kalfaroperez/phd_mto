<?PHP
/*
    Nombre: set_admin.php
    Autor: Julio Tuozzo - jtuozzo@p-hd.com.ar
    Funci�n: Create the operator with administrator permission
    Ver: 2.12
*/

session_start();
require('../../config.inc.php');

if (!isset($_SESSION['ADMIN']))

    {include('setup_head.inc');
     echo "<p class='danger'>INVALID CALL</p>";
     exit();
    }



if (!isset($_POST[b_admin]))
    {require('set_admin.inc');
     exit();
    }

## Preparo los datos ingresados
$operador=trim(strip_tags($_POST['operador']));
$ape_y_nom=trim(strip_tags($_POST['ape_y_nom']));
$e_mail=trim(strip_tags($_POST['e_mail']));
$contrasenia=strip_tags($_POST['contrasenia']);
$reingresa=strip_tags($_POST['reingresa']);
$sector_id=trim(strip_tags($_POST['sector_id']));
$sector_nombre=trim(strip_tags($_POST['sector_nombre']));

## Valido que el operador tenga por lo menos tres d�gitos.

if (strlen($operador)<1)
    {$mensaje="<p class='danger'> ERROR - There aren't operator code.</p>";
     include('set_admin.inc');
     exit();
    }

## Valido que el apellido y nombre no venga en blanco.

if (strlen($ape_y_nom)<1)
    {$mensaje="<p class='danger'> ERROR - There aren't last name and name.</p>";
     include('set_admin.inc');
     exit();
    }


## Valido que sean letras y/o n�meros

if(!preg_match('#^[a-zA-Z0-9]+$#', $contrasenia))

   {$mensaje="<p class='danger'> ERROR - The password must have letters and/or numbers.</p>";
     include('set_admin.inc');
     exit();

    }

## Valido que la contrase�a y su reingreso sean iguales

if ($contrasenia!= $reingresa)
    {$mensaje="<p class='danger'> ERROR - The password and the retype one are not equal. </p>";
     include('set_admin.inc');
     exit();
    }


## Verifico que la nueva contrase�a no tenga m�s de tres letras/n�meros repetidos

foreach (count_chars($contrasenia, 1) as $cantidad)
    {if ($cantidad>3)
        {$mensaje="<p class='danger'> ERROR - The password has many repeated digits.</p>";
         include('set_admin.inc');
         exit();
        }
    }


## Valido que por lo menos tenga seis d�gitos


if (strlen($contrasenia)<6)
   {$mensaje="<p class='danger'> ERROR - The password must have six digits at least.</p>";
     include('set_admin.inc');
     exit();

    }

## Valido que el operador y la contrase�a sean distintos


if (strtoupper($contrasenia)==$operador)
   {$mensaje="<p class='danger'> ERROR - The password must be different to the operator name.</p>";
     include('set_admin.inc');
     exit();

    }


## Valido el formato de correo electr�nico

if (!preg_match('#^.+@.+\\..+$#',$e_mail))
    {$mensaje="<p class='danger'> ERROR - Invalid e-mail address format.</p>";
     include('set_admin.inc');
     exit();
    }

## Valido que el c�digo del �rea no venga en blanco.

if (strlen($sector_id)<1)
    {$mensaje="<p class='danger'> ERROR - There aren't sector code.</p>";
     include('set_admin.inc');
     exit();
    }

## Valido que el apellido y nombre no venga en blanco.

if (strlen($sector_nombre)<1)
    {$mensaje="<p class='danger'> ERROR - There aren't sector name.</p>";
     include('set_admin.inc');
     exit();
    }


## Me conecto con la base de datos

if(!mysql_connect($Host,$Usuario,$Contrasena) or !mysql_select_db($Base))
    {$mensaje="<p class='danger'>ERROR - Database conexion error.</p>
     <p>MySQL error: ".mysql_error()."</p>";
     require('set_admin.inc');
     exit();
    }

## Inserto el operador administrador
$contrasenia=md5($contrasenia);
$query="INSERT INTO operador VALUES
        ('$operador',
         '$ape_y_nom',
         '$sector_id',
         '$e_mail',
         '$contrasenia',
         'S',
         20,
         DATE_ADD(NOW(),INTERVAL 30 DAY),
         'N',
         'N',
         'SETUP',
         NOW(),
         'SETUP',
         NOW())";

if (!mysql_query($query))
    {$mensaje="<h2 class='danger'>Error - Fail insert data in the table operador.</h2>
     <p>MySQL error: ".mysql_error()."</p>";
     require('set_admin.inc');
     exit();

    }

## Inserto el �rea del administrador

$query="INSERT INTO sector VALUES
        ('$sector_id',
         '$sector_nombre',
         'S',
         'SETUP',
         NOW(),
         'SETUP',
         NOW())";

if (!mysql_query($query))
    {$mensaje="<h2 class='danger'>Error - Fail insert data in the table sector.</h2>
     <p>MySQL error: ".mysql_error()."</p>";
     require('set_admin.inc');
     exit();

    }



session_destroy();
header("Location: index.php");
?>
