

$(document).ready(function(){

    listar_registros();
    btnInsertarRegistro();
    editar_registro();
    btnEditarRegistro();
    delete_registro();
    btnDeleteElemento();
    btnNuevoRegistro();
    btnEditarFilaRegistro();
    btnSaveRegistroClasificado();
    cargarDatePicker();

    ocultar_campos_form_ticket();
    autocomplete_planta();
    clonarFileUpload();
    descargar_archivo();
    /*
    sobreescribir_fileUpload();
    var filesToUpload = [];
    var files1Uploader = $("#adjunto").fileUploader(filesToUpload, "files1");
    //inputFileUpload(filesToUpload);
    adjunto(filesToUpload, files1Uploader);
    */


    //delete_adjunto();
    /**/
    // Activate tooltip
    //$('[data-toggle="tooltip"]').tooltip();

    // Select/Deselect checkboxes
    $("#selectAll").click(function(){
    if(this.checked){
        $('input[type=checkbox]').each(function(){
           this.checked = true;
        });
    }else{
      $('input[type=checkbox]').each(function(){
        this.checked = false;
      });
    }
  });
  $('input[type=checkbox]').click(function(){
    if(!this.checked){
      $("#selectAll").prop("checked", false);
    }
  });
});

function descargar_archivo() {
  $(".adjunto").on('click',function(i){
    var nombre_archivo = $(this).attr("nombre_adjunto");
    var seq_ticket_id = $(this).attr("id_ticket");
    $.ajax({
        method: "GET",
        data: {
          'accion': "download_adjuntos",
          'seq_ticket_id' : seq_ticket_id,
          'nombre_archivo' : nombre_archivo
        },
        url: "operaciones_ajax.php"
      })
      .done(function( msg ) {
          alert("archivo descargado con exito!");
      });

  });
}

function clonarFileUpload() {
  var cont = 0;
  $(".button").click(function() {
    cont = $("input[class='fileUpload']").length + 1;
    var x = $("#adjunto1"),
        y = x.clone();
    y.attr("id", "file"+cont);
    var div_ = $(".files").append("<div id='div_"+cont+"'></div>");
    var removeLink = "<a class='removeFile' href='#' data-fileid='div_"+cont+"'> x </a>";
    $("#div_"+cont).append(y);
    $("#div_"+cont).append(removeLink);
  });

  $('.files').on("click", ".removeFile", function (e) {
      e.preventDefault();

      var fileId = $(this).parent().children("a").data("fileid");

      // loop through the files array and check if the name of that file matches FileName
      // and get the index of the matc
      $("#"+fileId).remove();
  });
}



function autocomplete_planta(){
  $('#cbxPlanta').select2({
    ajax: {
      url: "operaciones_ajax.php?accion=load_autocomplete_planta",
      dataType: 'json',
      data: function (params) {
        return {
          query: params.term, // search term
        };
      },
      processResults: function (data, params) {
        return {
          results: data,
        };
      }
    }
  }).on('select2:select', function (e) {
    var id_planta = e.params.data.id;
    $("#sel_planta").attr("value", id_planta);
    autocomplete_equipoPrincipal(id_planta);
  });
  /*$( "#cbxPlanta").autocomplete({
      source: "operaciones_ajax.php?accion=load_autocomplete_planta",
      minLength: 2,
      select: function( event, ui ) {
        var id_planta = ui.item.id
        $("#sel_planta").attr("value", id_planta);
        autocomplete_equipoPrincipal(id_planta);
      }
    });*/
}

function autocomplete_equipoPrincipal(id_planta) {
  $('#cbxEquipoPrincipal').select2({
    ajax: {
      url: "operaciones_ajax.php?accion=load_autocomplete_equipoPrincipal",
      dataType: 'json',
      data: function (params) {
        return {
          query: params.term, // search term
          id_planta: id_planta
        };
      },
      processResults: function (data, params) {
        return {
          results: data,
        };
      }
    }
  }).on('select2:select', function (e) {
    var id_equipo_princ = e.params.data.id;
    $("#sel_equipo_princ").attr("value", id_equipo_princ);
    autocomplete_equipoSecundario(id_planta, id_equipo_princ);
  });
  /*$( "#cbxEquipoPrincipal").autocomplete({
      source: "operaciones_ajax.php?accion=load_autocomplete_equipoPrincipal&id_planta="+id_planta ,
      minLength: 2,
      select: function( event, ui ) {
        var id_equipo_princ = ui.item.id;
        $("#sel_equipo_princ").attr("value", id_equipo_princ);
        autocomplete_equipoSecundario(id_planta, id_equipo_princ);
      }
    });*/
}

function autocomplete_equipoSecundario(id_planta, id_equipo_princ) {
  $('#cbxEquipoSecundario').select2({
    ajax: {
      url: "operaciones_ajax.php?accion=load_autocomplete_equipoSecundario",
      dataType: 'json',
      data: function (params) {
        return {
          query: params.term, // search term
          id_planta: id_planta,
          id_equipo_princ : id_equipo_princ
        };
      },
      processResults: function (data, params) {
        return {
          results: data,
        };
      }
    }
  }).on('select2:select', function (e) {
    var id_equipo_sec = e.params.data.id;
    $("#sel_equipo_sec").attr("value", id_equipo_sec);
    autocomplete_Componente(id_planta, id_equipo_princ, id_equipo_sec);
  });
  /*$( "#cbxEquipoSecundario").autocomplete({
      source: "operaciones_ajax.php?accion=load_autocomplete_equipoSecundario&id_planta="+id_planta+"&id_equipo_princ="+id_equipo_princ,
      minLength: 2,
      select: function( event, ui ) {
        var id_equipo_sec = ui.item.id;
        $("#sel_equipo_sec").attr("value", id_equipo_sec);
        autocomplete_Componente(id_planta, id_equipo_princ, id_equipo_sec);
      }
    });*/
}

function autocomplete_Componente(id_planta, id_equipo_princ, id_equipo_sec) {
  $('#cbxComponente').select2({
    ajax: {
      url: "operaciones_ajax.php?accion=load_autocomplete_componente",
      dataType: 'json',
      data: function (params) {
        return {
          query: params.term, // search term
          id_planta: id_planta,
          id_equipo_princ : id_equipo_princ,
          id_equipo_sec: id_equipo_sec
        };
      },
      processResults: function (data, params) {
        return {
          results: data,
        };
      }
    }
  }).on('select2:select', function (e) {
    var id_componente = e.params.data.id;
    $("#sel_componente").attr("value", id_componente);
  });
  /*$( "#cbxComponente").autocomplete({
      source: "operaciones_ajax.php?accion=load_autocomplete_componente&id_planta="+id_planta+"&id_equipo_princ="+id_equipo_princ+"&id_equipo_sec="+id_equipo_sec,
      minLength: 2,
      select: function( event, ui ) {
          var id_componente = ui.item.id;
          $("#sel_componente").attr("value", id_componente);
      }

    });*/
}



function delete_adjunto(i){
  /*$("#ul_adjuntos #li_adjunto_"+i).remove();
  var myFiles = $('#adjunto');//.prop('files');
  myFiles = myFiles.clone( true );
  var filesToUpload = [];
  var files1Uploader = $("#adjunto").fileUploader(filesToUpload, "adjunto");*/
  /*
  var txt = '';
  if (myFiles != 'undefined') {
        if (myFiles.length == 0) {
            txt = "Select one or more files.";
        } else {
            for (var i = 0; i < myFiles.length; i++) {
                txt += "<br><strong>" + (i+1) + ". file</strong><br>";
                var file = myFiles[i];
                if ('name' in file) {
                    txt += "name: " + file.name + "<br>";
                }
                if ('size' in file) {
                    txt += "size: " + file.size + " bytes <br>";
                }
            }
        }
    }
    else {
        if (myFiles.value == "") {
            txt += "Select one or more files.";
        } else {
            txt += "The files property is not supported by your browser!";
            txt  += "<br>The path of the selected file: " + myFiles.value; // If the browser does not support the files property, it will return the path of the selected file instead.
        }
    }

    console.log(txt);
    */
  //myFile.replaceWith(myFile.clone());
}

function cargarDatePicker() {
  $.datepicker.regional['es'] = {
      closeText: 'Cerrar',
      prevText: '<Ant',
      nextText: 'Sig>',
      currentText: 'Hoy',
      monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
      monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
      dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
      dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sab'],
      dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sa'],
      minDate: 0,
      weekHeader: 'Sm',
      dateFormat: 'dd/mm/yy',
      firstDay: 1,
      isRTL: false,
      showMonthAfterYear: false,
      yearSuffix: ''
    };

  $.datepicker.setDefaults($.datepicker.regional['es']);

  $(".datepicker").datepicker({
     changeMonth: true,
     changeYear: true

   });
}
function ocultar_campos_form_ticket() {
  //Si es operador deshabilita campos innecesarios
    if($("#nivel").val()==10){
      $("#div_admin").css("display", "none");
    }
//Si es administrador muestra los campos
    if($("#nivel").val()==20){
      $("#div_admin").css("display", "block");
    }
}

function listar_registros(){
  if ($("#tbody_elementos").length > 0) {
    var accion_selec = $("#tbody_elementos").attr("accion");
    var elemento_html = $("#tbody_elementos").attr("elemento_html");


    $.ajax({
        method: "POST",
        data: {
          'accion': accion_selec,
          'elemento_html' : elemento_html
        },
        url: "operaciones_ajax.php",

      })
      .done(function( msg ) {
          $("#tbody_elementos").html(msg);
      });
  }else {

  }


}

function btnInsertarRegistro(){

    $("#addElementoModal").on('click', '#btnSave', function(){
      var accion_selec = $(this).attr("accion");
      var nombre = $("#txtNombreInsert").val();
      var descripcion = $("#txtDescripcionInsert").val();
      console.log(accion_selec);
      $.ajax({
          method: "POST",
          data: {
            'accion': accion_selec,
            'nombre' : nombre,
            'descripcion': descripcion
          },
          url: "operaciones_ajax.php",

        })
        .done(function( msg ) {
            console.log(msg);
        });
    });
}

function editar_registro(){
    $("body").on('click',".edit", function(event){
        event.preventDefault();
        var id_elemento = $(this).attr("id_elemento");
        var nombre = $(this).attr("nombre");
        var descripcion = $(this).attr("descripcion");
        $("#btnEditElemento").attr("id_elemento", id_elemento);
        $("#txtNombreEdit").attr('value', nombre);
        $("#txtDescripcionEdit").attr('value', descripcion);
    });
}

function btnEditarRegistro(){

    $("#editElementoModal").on('click', '#btnEditElemento', function(){
      var accion_selec = $(this).attr("accion");
      var id_elemento = $(this).attr("id_elemento");
      var nombre = $("#txtNombreEdit").val();
      var descripcion = $("#txtDescripcionEdit").val();

      $.ajax({
          method: "POST",
          data: {
            'accion': accion_selec,
            'id_elemento' : id_elemento,
            'nombre' : nombre,
            'descripcion': descripcion
          },
          url: "operaciones_ajax.php",

        })
        .done(function( msg ) {
            console.log(msg);
        });

    });
}

function delete_registro(){
    $("body").on('click',".delete", function(event){
        event.preventDefault();
        var id_elemento = $(this).attr("id_elemento");
        var nombre = $(this).attr("nombre");
        var descripcion = $(this).attr("descripcion");
        $("#btnDeleteElemento").attr("id_elemento", id_elemento);
        $("#lblNombreDelete").append(nombre);
        $("#lblDescripcionDelete").append(descripcion);
    });
}

function btnDeleteElemento(){

    $("#deleteElementoModal").on('click', '#btnDeleteElemento', function(){
      var accion_selec = $(this).attr("accion");
      var id_elemento = $(this).attr("id_elemento");
      $.ajax({
          method: "POST",
          data: {
            'accion': accion_selec,
            'id_elemento' : id_elemento
          },
          url: "operaciones_ajax.php",

        })
        .done(function( msg ) {
            console.log(msg);
        });
    });
}

function btnNuevoRegistro(){
  var modal_activo =  "#addElementoModal";
  $("#btnNuevoRegistro").click(function() {

      cargar_select_planta(modal_activo);
      cargar_select_equipo_princ(modal_activo);
      cargar_select_equipo_sec(modal_activo);
      cargar_select_componente(modal_activo);
  });

}

function btnEditarFilaRegistro(){
  var modal_activo = "#editElementoModal";
  var id_planta, id_equipo_princ, id_equipo_sec, id_componente = 0;

  $("body").on('click',".edit", function(event){
      event.preventDefault();
      var id_registro_equipo = $(this).attr("id_elemento");
      $(modal_activo + " #id_registro").attr("value", id_registro_equipo);

      var id_planta = $(this).attr("id_planta");
      var id_equipo_princ = $(this).attr("id_equipo_princ")
      var id_equipo_sec = $(this).attr("id_equipo_sec")
      var id_componente = $(this).attr("id_componente");

      cargar_select_planta(modal_activo, id_planta);
      cargar_select_equipo_princ(modal_activo, id_equipo_princ);
      cargar_select_equipo_sec(modal_activo, id_equipo_sec);
      cargar_select_componente(modal_activo, id_componente);



  });
}

function btnSaveRegistroClasificado(){
    $(".btn-submit").click(function(){
        var div_padre = "#"+ $(this).parents(".fade").attr("id");
        var accion_selec = $(this).attr("accion");
        var id_registro_equipo = $("#id_registro").attr("value");

        var id_planta = $(div_padre+ " #sel_planta").val();
        var nombre_planta = $(div_padre+ " #sel_planta option:selected").text();

        var id_equipo_princ = $(div_padre+ " #sel_equipo_princ").val();
        var nombre_equipo_princ = $(div_padre+ " #sel_equipo_princ option:selected").text();

        var id_equipo_sec = $(div_padre+ " #sel_equipo_sec").val();
        var nombre_equipo_sec = ($(div_padre+ " #sel_equipo_sec").val() != 0) ?  $(div_padre+ " #sel_equipo_sec option:selected").text() : "-";

        var id_componente = $(div_padre+ " #sel_componente").val();
        var nombre_componente = ($(div_padre+ " #sel_componente").val() != 0) ?  $(div_padre+ " #sel_componente option:selected").text() : "-";

        $.ajax({
            method: "POST",
            data: {
              'accion': accion_selec,
              'id_registro_equipo' : id_registro_equipo,
              'id_planta' : id_planta,
              'nombre_planta' : nombre_planta,

              'id_equipo_princ': id_equipo_princ,
              'nombre_equipo_princ' : nombre_equipo_princ,

              'id_equipo_sec': id_equipo_sec,
              'nombre_equipo_sec' : nombre_equipo_sec,

              'id_componente': id_componente,
              'nombre_componente' : nombre_componente,
            },
            url: "operaciones_ajax.php",

          })
          .done(function( msg ) {
              console.log(msg);
          });
    });

}

function cargar_select_planta(modal_activo, id_planta){
  var accion_selec = "cargar_planta";
  $.ajax({
      method: "POST",
      data: { 'accion': accion_selec, 'id_planta': id_planta},
      url: "operaciones_ajax.php",

    })
      .done(function( msg ) {
        $(modal_activo +" #sel_planta").html(msg);
    });
}

function cargar_select_equipo_princ(modal_activo, id_equipo_princ){
  var accion_selec = "listar_equipos_princ";
  $.ajax({
      method: "POST",
      data: { 'accion': accion_selec, 'elemento_html' : "selector_html", 'id_equipo_princ': id_equipo_princ },
      url: "operaciones_ajax.php",

    })
      .done(function( msg ) {
        $(modal_activo +" #sel_equipo_princ").html(msg);
    });
}

function cargar_select_equipo_sec(modal_activo, id_equipo_sec){
  var accion_selec = "listar_equipos_secundario";
  $.ajax({
      method: "POST",
      data: { 'accion': accion_selec, 'elemento_html' : "selector_html", 'id_equipo_sec': id_equipo_sec },
      url: "operaciones_ajax.php",

    })
      .done(function( msg ) {
        $(modal_activo +" #sel_equipo_sec").html(msg);
    });
}

function cargar_select_componente(modal_activo, id_componente){
  var accion_selec = "listar_componentes";
  $.ajax({
      method: "POST",
      data: { 'accion': accion_selec, 'elemento_html' : "selector_html", 'id_componente': id_componente},
      url: "operaciones_ajax.php",

    })
      .done(function( msg ) {
        $(modal_activo +" #sel_componente").html(msg);
    });
}

function cargar_select_planta_ticket(){
  //if ($("#sel_planta_ti").length >0) {

    var accion_selec = "cargar_planta";
    var id_planta = $("#sel_planta_ti option:selected").val()
    $.ajax({
        method: "POST",
        data: { 'accion': accion_selec, 'id_planta':id_planta},
        url: "operaciones_ajax.php",

      })
        .done(function( msg ) {
          $("#sel_planta_ti").empty();
          $("#sel_equipo_princ_ti").empty();
          $("#sel_equipo_sec_ti").empty();
          $("#sel_componente_ti").empty();

          $("#sel_planta_ti").html(msg);

      });
    /*}else{

    }*/
}

function cargar_select_equipo_princ_ticket(){
    var id_planta = "", accion_selec = "";
    id_planta = $("#sel_planta_ti option:selected").val();
    accion_selec = $("#sel_planta_ti").attr("accion_selec");
    var options = "<option value='0'> Selecione...</option>";
    if (id_planta != 0) {
      $.ajax({
          method: "POST",
          dataType: 'JSON',
          data: {
            'accion': accion_selec,
            'id_planta': id_planta
          },
          url: "operaciones_ajax.php",

        })
          .done(function( data ) {
            $("#sel_equipo_princ_ti").empty();
            $("#sel_equipo_sec_ti").empty();
            $("#sel_componente_ti").empty();
            $("#sel_equipo_princ_ti").append(options);
            if (data != undefined) {
                var length = data.length;
                for (var i = 0; i < length; i++) {
                    var id_equipo_princ = data[i].id_equipo_princ;
                    var nombre          = data[i].nombre;

                    options = "<option value='" +id_equipo_princ +"'>"+ nombre +"</option>";
                    $("#sel_equipo_princ_ti").append(options);
                }
            }


        });
      }else{
          $("#sel_equipo_princ_ti").empty();
          $("#sel_equipo_princ_ti").append(options);
      }

}

function cargar_select_equipo_sec_ticket(){
    var id_planta = "", id_equipo_princ = "", accion_selec = "";
    id_planta = $("#sel_planta_ti option:selected").val();
    id_equipo_princ = $("#sel_equipo_princ_ti option:selected").val();
    accion_selec = $("#sel_equipo_princ_ti").attr("accion_selec");
    var options = "<option value='0'> Selecione...</option>";
    if (id_equipo_princ != 0) {
      $.ajax({
          method: "POST",
          dataType: 'JSON',
          data: {
            'accion': accion_selec,
            'id_equipo_princ': id_equipo_princ,
            'id_planta' : id_planta
          },
          url: "operaciones_ajax.php",

        })
          .done(function( data ) {
            $("#sel_equipo_sec_ti").empty();
            $("#sel_componente_ti").empty();

            $("#sel_equipo_sec_ti").append(options);
            if (data != undefined) {
                var length = data.length;
                for (var i = 0; i < length; i++) {
                    var id_equipo_sec = data[i].id_equipo_sec;
                    var nombre          = data[i].nombre;

                    options = "<option value='" +id_equipo_sec +"'>"+ nombre +"</option>";
                    $("#sel_equipo_sec_ti").append(options);
                }
            }
        });
      }else{
          $("#sel_equipo_sec_ti").empty();
          $("#sel_equipo_sec_ti").append(options);
      }
}

function cargar_select_componente_ticket(){
    var id_planta= "", id_equipo_princ ="",  id_equipo_sec = "", accion_selec = "";

    id_planta = $("#sel_planta_ti option:selected").val();
    id_equipo_princ = $("#sel_equipo_princ_ti option:selected").val();
    id_equipo_sec = $("#sel_equipo_sec_ti option:selected").val();

    accion_selec = $("#sel_equipo_sec_ti").attr("accion_selec");
    var options = "<option value='0'> Selecione...</option>";
    if (id_equipo_sec != 0) {
      $.ajax({
          method: "POST",
          dataType: 'JSON',
          data: {
            'accion': accion_selec,
            'id_planta' : id_planta,
            'id_equipo_princ': id_equipo_princ,
            'id_equipo_sec': id_equipo_sec
          },
          url: "operaciones_ajax.php",

        })
          .done(function( data ) {
            $("#sel_componente_ti").empty();
            $("#sel_componente_ti").append(options);
            if (data != undefined) {
              var length = data.length;
              for (var i = 0; i < length; i++) {
                  var id_componente = data[i].id_componente;
                  var nombre          = data[i].nombre;
                  options = "<option value='" +id_componente +"'>"+ nombre +"</option>";
                  $("#sel_componente_ti").append(options);
              }
            }
        });
      }else{
          $("#sel_componente_ti").empty();
          $("#sel_componente_ti").append(options);
      }
}

/*
function cargar_select_equipo_princ(){
  $( "#sel_planta").change(function () {
      var id_planta = "", accion_selec = "";
      id_planta = $("#sel_planta option:selected").attr("id_planta");
      accion_selec = $("#sel_planta").attr("accion_selec");

      $.ajax({
          method: "POST",
          data: {
            'accion': accion_selec,
            'id_planta': id_planta
          },
          url: "operaciones_ajax.php",

        })
          .done(function( msg ) {
            $("#sel_equipo_princ").html(msg);
        });
  }).change();
}

function cargar_select_equipo_sec(){
  $( "#sel_equipo_princ" ).change(function () {
      var id_equipo_princ = "", accion_selec = "";

      id_equipo_princ = $("#sel_equipo_princ option:selected").attr("id_equipo_princ");
      accion_selec = $("#sel_equipo_princ").attr("accion_selec");

      $.ajax({
          method: "POST",
          data: {
            'accion': accion_selec,
            'id_equipo_princ': id_equipo_princ
          },
          url: "operaciones_ajax.php",

        })
          .done(function( msg ) {
            $("#sel_equipo_sec").html(msg);
        });
  }).change();
}

function cargar_select_componente(){
  $("#sel_equipo_sec").change(function () {
      var id_equipo_princ = "", accion_selec = "";

      id_equipo_sec = $("#sel_equipo_sec option:selected").attr("id_equipo_sec");
      accion_selec = $("#sel_equipo_sec").attr("accion_selec");

      $.ajax({
          method: "POST",
          data: {
            'accion': accion_selec,
            'id_equipo_sec': id_equipo_sec
          },
          url: "operaciones_ajax.php",

        })
          .done(function( msg ) {
            $("#sel_componente").html(msg);
        });
  }).change();
}
*/
