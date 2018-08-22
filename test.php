
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Select TEST Combobox</title>
    <link href="plugins/select2/dist/css/select2.min.css" rel="stylesheet" />

  </head>
  <body>
    <form action="test.php" method="post">

        <div class="ui-widget">
          <label for="txtEquipoPrincipal">Planta: </label>
          <select id='txtPlanta' name="planta" width="100%">
            <option value="">Select one...</option>
          </select>
        </div>
<!--
        <div class="ui-widget">
          <label for="txtEquipoPrincipal">Equipo Principal: </label>
          <input id='txtEquipoPrincipal' class="ui-autocomplete-input" />
        </div>

        <div class="ui-widget">
          <label for="txtEquipoSecundario">Equipo Secundario:</label>
          <input id='txtEquipoSecundario' class="ui-autocomplete-input" />
        </div>

        <div class="ui-widget">
          <label for="txtComponente">Componentes:</label>
          <input id='txtComponente' class="ui-autocomplete-input" />
        </div>
-->
        <input type='hidden' id="sel_planta" name='sel_planta' />
        <input type='hidden' id="sel_equipo_princ"  name='sel_equipo_princ' />
        <input type='hidden' id="sel_equipo_sec" name='sel_equipo_sec' />
        <input type='hidden' id="sel_componente" name='sel_componente' />
        <input type="submit" name="" value="Enviar">

        <script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
        <script src="plugins/select2/dist/js/select2.min.js"></script>
        <script type="text/javascript" src="web_script.js"></script>
        <script type="text/javascript">

          $('#txtPlanta').select2({

            ajax: {
              url: "operaciones_ajax.php?accion=load_autocomplete_planta",
              dataType: 'json',
              data: function (params) {
                return {
                  q: params.term, // search term
                };
              },
              processResults: function (data, params) {
                return {
                  results: data,
                };
              }
            }
          });



        </script>
    </form>
  </body>
</html>

<?php

?>
