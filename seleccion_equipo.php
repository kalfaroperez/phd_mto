
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Listo Combobox</title>
    <link href="css/base/jquery-ui-1.9.2.custom.css" rel="stylesheet">

    <style>
      .custom-combobox {
        position: relative;
        display: inline-block;
      }
      .custom-combobox-toggle {
        position: absolute;
        top: 0;
        bottom: 0;
        margin-left: -1px;
        padding: 0;
      }
      .custom-combobox-input {
        margin: 0;
        padding: 5px 10px;
      }
      </style>
  </head>
  <body>
    <form action="seleccion_equipo.php" method="post">

        <div class="ui-widget">
          <select id='cbxPlanta' name="planta">
            <option value="">Select one...</option>
          </select>
        </div>

        <div class="ui-widget">
          <label for="cbxEquipoPrincipal">Equipo Principal: </label>
          <input id='cbxEquipoPrincipal' class="ui-autocomplete-input" />
        </div>

        <div class="ui-widget">
          <label for="cbxEquipoSecundario">Equipo Secundario:</label>
          <input id='cbxEquipoSecundario' class="ui-autocomplete-input" />
        </div>

        <div class="ui-widget">
          <label for="cbxComponente">Componentes:</label>
          <input id='cbxComponente' class="ui-autocomplete-input" />
        </div>

        <input type='hidden' id="sel_planta" name='sel_planta' />
        <input type='hidden' id="sel_equipo_princ"  name='sel_equipo_princ' />
        <input type='hidden' id="sel_equipo_sec" name='sel_equipo_sec' />
        <input type='hidden' id="sel_componente" name='sel_componente' />
        <input type="submit" name="" value="Enviar">

        <script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui-1.9.2.custom.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="web_script.js"></script>
    </form>
  </body>
</html>

<?php

?>
