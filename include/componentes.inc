<?PHP
/*
    Nombre: sector.inc
    Autor: Julio Tuozzo
    Funci�n: Vista de administraci�n de sectores.
    Function: Administration sectors view.
    Ver: 2.12
*/
$opcion=$Sector_admin;
require('head_frame.inc');

## Formulario de ingreso de datos del sector.
// Sector data input form.

echo "<body>";
require('menu.inc');
echo "<div id='contenido'>
    <div class='error'> $mensaje </div>";



## Muestro los datos de los sectores
// Show the sectors data
echo "
 <iframe src='componentes_list.php?orden=$orden&sentido=$sentido&pagina=$pagina&q_registros=$q_registros' onLoad='this.style.height=document.body.clientHeight-this.offsetTop-95;' />

    </div>
  </body>
</html>";
?>
