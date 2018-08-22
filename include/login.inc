<?PHP
/*
    Nombre: login.inc
    Autor: Julio Tuozzo jtuozzo@p-hd.com.ar
    Funci�n: Formulario de ingreso de operador y contrase�a
    Function: Operator entrance and password
    Ver: 2.12
*/

require('head.inc');

?>

<body>
    <span style='position:absolute; left:10px'>
        <h4>PHD Help Desk <br /> <small><?php $Version ?> </small></h4>
    </span>
    <span style='position:absolute; right:10px'>
        <h4 class='menu'><a href='' onclick="window.open('help.php','','width=250,height=390,scrollbars=0,resizable=1,toolbar=0,location=0,menubar=0,status=0,directories=0')"><?php $Help ?> </a></h4>

    </span>

    <br style='line-height:2.8;'/>

    <div style='text-align:center'>
    <a href='http://www.p-hd.com.ar'><img SRC='./images/phd_400_55.gif' border='0' alt='PHD Help Desk' title='PHD Help Desk by Julio Tuozzo'></a>
    </div>
    <br style='line-height:3.8;'/>

    <br />


    <form method='post' action='login.php' >
    <div id='login'>
       <h3 style='text-align:center'>Ingreso al sistema</h3>
        <table>
          <tr>
            <td>Tipo de Usuario:</td>
            <td>
              <select id='tipo_usuario' name="tipo_usuario">
                 <option value='operador' selected>Operador</option>
                 <option value='administrador'>Administrador</option>
              </select>
           </td>
          </tr>
          <tr>
            <td>Usuario</td>
            <td><input type='text' id='usuario' name='operador' size='15' maxlength='15'></td>
          </tr>
          <tr>
              <td>Contrase&ntilde;a</td>
              <td><input type='password' id="password" name='contrasenia' size='16'maxlength='16'></td>
          </tr>
          <tr>
            <td colspan="2" text-align="center">
              <input class='boton' type='submit' value='Ingresar' name='submit'>
            </td>
          </tr>
        </table>
    </div>


    <p style='text-align:center' id='forgot_text'><a href='#' onfocus="document.getElementById('forgot').style.visibility='visible'; document.getElementById('forgot_text').style.visibility='hidden'; document.getElementById('error').style.visibility='hidden';"><?php $Forgot_password ?></a></p>
    <p class='error' id='error'> <?php echo $mensaje; ?> </p>

    <p style='visibility:hidden; text-align:center; font-weight:bold;' id='forgot'>
    <img id='captcha' src='./securimage/securimage_show.php' alt='CAPTCHA Image' /><br /><br />
    <?php $Input_the_code ?> <input type='text' name='captcha' size='4' maxlength='4' />
    <?php $And_press ?>   <input type='submit' class='boton' name='genera'  value='<?php echo $Gener_new_pswd; ?>' onclick='this.value=\"Wait...\"' />  </p>

    <br />
    <div style='text-align:center'><h3 class='menu' ><a href='user_request.php' >
    <img src='./images/usuario.gif' alt='$User_request_access' border='0' /><?php echo $User_request_access; ?> </a></h3></div>
</form>


<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>
<script>
  $(document).ready(function(){
        $("#tipo_usuario").change(function(){
          if ($(this).val() == "operador") {
                $("#password").val("<?php echo time(); ?>");
                $("#password").attr("readonly", 'readonly');
          }

          if ($(this).val() == "administrador") {
            $("#password").val("");
            $("#password").removeAttr("readonly");
          }

        }).change();
    });
</script>
<?php echo $js_muestro_captcha; ?>
</body>
</html>";
