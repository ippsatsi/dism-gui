#include <GuiEdit.au3>
#include <ScrollBarsConstants.au3>

Func SelectFileDialog($tipo, $inControl,$mensaje,$filtro)
	$wim_filtro = "archivos wim (*.wim)"
	$all_files = "Todos (*.*)"
	$inf_files = "archivos .inf (*.inf)"
	If $filtro = "wim" Then
		$filtro = $wim_filtro
	ElseIf $filtro = "inf" Then
		$filtro = $inf_files
	Else
		$filtro = $all_files
	EndIf

	If $tipo = "save" Then
		$RutaArchivo = FileSaveDialog($mensaje, @WindowsDir & "\", $filtro,  $FD_PROMPTOVERWRITE)
	ElseIf $tipo = "folder" Then
;~ 		$RutaArchivo = FileSelectFolder($mensaje, @WindowsDir & "\")
;~ 		$RutaArchivo = FileSelectFolder($mensaje, "C:")
		$RutaArchivo = FileSelectFolder("Choose your folder", "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}")
	ElseIf $tipo = "driver" Then
		$RutaArchivo = FileOpenDialog($mensaje, @WindowsDir & "\", $filtro, $FD_FILEMUSTEXIST)
	Else
		$RutaArchivo =  FileOpenDialog($mensaje, @WindowsDir & "\", $filtro, $FD_MULTISELECT)
	EndIf
;~ 	$RutaArchivo =  FileOpenDialog($mensaje, @WindowsDir & "\", $filtro, BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
	If $RutaArchivo <> "" And $filtro <> "driver" Then
		GUICtrlSetData($inControl, $RutaArchivo)
	EndIf
	Return $RutaArchivo
EndFunc


Func MensajesProgreso($xBoxProgreso, $mensaje, $xlblEstado = 0)
	;$xBoxProgreso, es el id del control
	; $gi_AlmacenTextoMensajes es donde se acumula la salida de los comandos
	$gi_AlmacenTextoMensajes &= " " & $mensaje & @CRLF
	GUICtrlSetData($xBoxProgreso,$gi_AlmacenTextoMensajes)
	_GUICtrlEdit_Scroll($xBoxProgreso, $SB_SCROLLCARET)
	Return $mensaje
EndFunc

Func MensajesProgresoSinCRLF($xBoxProgreso, $mensaje, $xlblEstado = 0)
	;$xBoxProgreso, es el id del control
	; $gi_AlmacenTextoMensajes es donde se acumula la salida de los comandos
	$gi_AlmacenTextoMensajes &= $mensaje
	GUICtrlSetData($xBoxProgreso, $gi_AlmacenTextoMensajes)
	Return $mensaje
EndFunc

Func f_MensajesProgreso_MostrarProgresoTexto($xBoxProgreso, $mensaje)
	;$xBoxProgreso, es el id del control
	; $gi_AlmacenTextoMensajes es donde se acumula la salida de los comandos
	; Aca a diferencia de las funciones anteriores, mantenemos sin actualizar el $gi_AlmacenTextoMensajes, y solo actualizamos el
	; el $mensaje con la nueva data
	GUICtrlSetData($xBoxProgreso, $gi_AlmacenTextoMensajes & $mensaje)
	Return $mensaje
EndFunc

Func f_ProgresoTexto($intValor, $intMOD)
	If $intValor > 100 Or $intValor < 0 Then Return "Error en lectura progreso"
	$strProgresoTexto = "   ["
	For $i = 0 To $intValor
		If Mod($i,$intMOD) = 0 Then $strProgresoTexto &= "="
	Next
	For $i = ($intValor + 1) To 100
		If Mod($i,$intMOD) = 0 Then $strProgresoTexto &= "  "
	Next
	$strProgresoTexto &= "]"
	Return $strProgresoTexto
EndFunc

Func LimpiarVentanaProgreso()
	$gi_AlmacenTextoMensajes = ""
	;$intBarraProgresoGUI = 0
	GUICtrlSetData($MensajesInstalacion, $gi_AlmacenTextoMensajes)
EndFunc