;~ 					Global $sWimPathFile = FileOpenDialog("Seleccione el archivo WIM conteniendo la imagen", @WindowsDir & "\", "archivos wim (*.wim)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
;~ 					If $sWimPathFile <> "" Then
;~ 						GUICtrlSetData($inFileImagePath, $sWimPathFile)
;~ 						CargaListaImagenes($sWimPathFile)
;~ 					EndIf


Func SelectFileDialog($tipo, $inControl,$mensaje,$filtro)
	$wim_filtro = "archivos wim (*.wim)"
	$all_files = "Todos (*.*)"
	If $filtro = "wim" Then
		$filtro = $wim_filtro
	Else
		$filtro = $all_files
	EndIf

	If $tipo = "save" Then
		$RutaArchivo = FileSaveDialog($mensaje, @WindowsDir & "\", $filtro,  $FD_PROMPTOVERWRITE)
	ElseIf $tipo = "folder" Then
		$RutaArchivo = FileSelectFolder($mensaje, @WindowsDir & "\")
	Else
		$RutaArchivo =  FileOpenDialog($mensaje, @WindowsDir & "\", $filtro, BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
	EndIf


;~ 	$RutaArchivo =  FileOpenDialog($mensaje, @WindowsDir & "\", $filtro, BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
	If $RutaArchivo <> "" Then
		GUICtrlSetData($inControl, $RutaArchivo)
	EndIf
	Return $RutaArchivo
EndFunc
