
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Select TEST Combobox</title>
    <link href="plugins/select2/dist/css/select2.min.css" rel="stylesheet" />

  </head>
  <body>
    <form action="test.php" method="post" enctype="multipart/form-data">
      <table>
      <tr>
      <td><?php echo $Attach_file; ?>: </td>
          <td>
            <div class="container">
              <div class="row files" id="files1">
                <div id='div_0'>
                  <input type='file' id="adjunto1" class="fileUpload" name='adjunto[]' maxlength='120'> (Max. <?php echo $text_max_attach; ?>)
                  &nbsp;<input type="button" class="button" name="" value="+">
                </div>
              </div>
            </div>
          </td>
      </tr>
      <tr>
          <td>&nbsp;</td>
          <td>

            <!--
            <div id="div_adjuntos">
              <ul id='ul_adjuntos'>
              </ul>
            </div>
          -->

          </td>
      </tr>
      </table>
      <input type='submit' value='Guardar' name='guardar' onclick='return false;this.value=\"Wait...\"'>


        <script src="js/jquery-2.1.0.min.js" type="text/javascript"></script>
        <script src="plugins/select2/dist/js/select2.min.js"></script>
        <script type="text/javascript" src="web_script.js"></script>

    </form>
  </body>
</html>

<?php

$seq_ticket_id = strtotime(date("Y/m/d"));
echo "GET<br/><pre>";print_r($_FILES); echo "<pre>";
guardarArchivoAdjunto_onServer($_FILES, $seq_ticket_id);

function guardarArchivoAdjunto_onServer($files, $seq_ticket_id){

	if ($files['adjunto']) {
	    $file_ary = reArrayFiles($files['adjunto']);

      $dir_upload = "D:/uploads/".$seq_ticket_id."/"; //$_SERVER['DOCUMENT_ROOT']."/phd_mto/uploads/".$seq_ticket_id."/";
      mkdir($dir_upload, 0777);

	    foreach ($file_ary as $file) {
				$target_dir = $dir_upload;
				$target_file = $target_dir . basename($file["name"]);
				$nombre_archivo = $seq_ticket_id."_".basename($file["name"]);

				$uploadOk = 1;
				$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
				// Check if image file is a actual image or fake image
				/*if(isset($_POST["submit"])) {
					check = getimagesize($file["adjunto"]["tmp_name"]);
					if($check !== false) {
							echo "File is an image - " . $check["mime"] . ".";
							$uploadOk = 1;
					} else {
							echo "File is not an image.";
							$uploadOk = 0;
					}


				}*/

				// Check if file already exists
				if (file_exists($target_file)) {
						//echo "Sorry, file already exists.";
						unlink($target_file);
						//$uploadOk = 0;
				}

				// Check file size
				if ($file["size"] > 5000000) {
						$mensaje .= "El archivo supera el tamaño establecido (5Mb).";
						$uploadOk = 0;
				}

				// Allow certain file formats
				if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" && $imageFileType != "pdf") {
						$mensaje .= "Archivo invalido. Solo es permitido las siguientes extensiones: PDF, JPG, JPEG, PNG & GIF";
						$uploadOk = 0;
				}

				// Check if $uploadOk is set to 0 by an error
				if ($uploadOk == 0) {
						$mensaje .= "Su archivo no ha sido cargado. Error al subir archivo.";
				// if everything is ok, try to upload file
				} else {
						$info_archivo = array('nombre' => $nombre_archivo,
																'tipo_archivo' => $imageFileType,
																'ruta_archivo' => $target_file);


						if (move_uploaded_file($file["tmp_name"], $target_file)) {
								$mensaje .= "El archivo nombre ". basename( $nombre_archivo). " ha sido cargado exitosamente.";
						} else {
								$mensaje .= "Su archivo no ha sido cargado. Error al subir archivo.";
						}

       }
	   }
  }
}

function reArrayFiles(&$file_post) {

	$file_ary = array();
	$file_count = count($file_post['name']);
	$file_keys = array_keys($file_post);

	for ($i=0; $i<$file_count; $i++) {
			foreach ($file_keys as $key) {
					$file_ary[$i][$key] = $file_post[$key][$i];
			}
	}

	return $file_ary;
}
?>
