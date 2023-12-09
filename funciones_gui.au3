#include <GuiEdit.au3>
#include <ScrollBarsConstants.au3>

Global $arProgressIndicator[] = ["|","/","-","\"]

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
	; $intMOD determina cuan larga sera la barra de progreso
	If $intValor > 100 Or $intValor < 0 Then Return "Error en lectura progreso"
	$strProgresoTexto = "["
	For $i = 0 To $intValor
		If Mod($i,$intMOD) = 0 Then $strProgresoTexto &= "="
	Next
	For $i = ($intValor + 1) To 100
		If Mod($i,$intMOD) = 0 Then $strProgresoTexto &= "x" ; usamos X por mientras, despues lo reemplazamos por doble espacio en blanco
	Next
	$strProgresoTexto &= "]"
	; ================
	;colocamos el porcentaje en el centro del texto
	If $intValor > 9 Then
		$lenValor = 2
	Else
		$lenValor = 1
	EndIf
	; si usamos espacios en blanco desde un principio, los calculos no seran exactos
	$lenProgresoString = Floor(StringLen($strProgresoTexto)/2)
	$posReemplazo = $lenProgresoString - $lenValor
	;ConsoleWrite("++" & $lenProgresoString & ";;" & $posReemplazo & @CRLF)
	$strProgresoTexto = StringReplace($strProgresoTexto, $posReemplazo , $intValor & "%") ; desplazamos 3 posiciones por los espacios antes del "["
	; se usa doble espacio en blanco, para compensar q autoit hace q estos ocupen menos espacio en pantalla
	$strProgresoTexto = StringReplace($strProgresoTexto, "x" , "  ")
	;=======================
	Return "   " & $strProgresoTexto
EndFunc

Func LimpiarVentanaProgreso()
	$gi_AlmacenTextoMensajes = ""
	;$intBarraProgresoGUI = 0
	GUICtrlSetData($MensajesInstalacion, $gi_AlmacenTextoMensajes)
EndFunc

Func f_UltNElemArray_to_Texto($arSalida, $intIndice, $intN)
	Local $strTexto = ""
	If UBound($arSalida) < $intN Then Return "Error en array"
	For $i = ($intIndice - $intN) To $intIndice
		$strTexto &= $arSalida[$i] & @CRLF
	Next
	Return $strTexto
EndFunc

Func f_ExtraeResumenComando($mensaje_salida, $intPrimeros, $intUltimos)
	; $intPrimeros = indica cuantas filas del inicio vamos a usar
	; $intUltimos = indica cuantas filas del final vamos a usar
	Local $strResumenFinal = ""

	Local $arMensaje = StringSplit($mensaje_salida, @LF)
	Local $ultIndice = UBound($arMensaje) - 1
	For $i = 1 To $intPrimeros
		$strResumenFinal &= $arMensaje[$i] & @CRLF
	Next
	For $i = ($ultIndice - $intUltimos) To $ultIndice
		$strResumenFinal &= $arMensaje[$i] & @CRLF
	Next
	Return $strResumenFinal
EndFunc


Func f_MostrarProgresoTexto($Salida, $psTarea)
	; $Salida: Id del control donde se mostrara
	; handler del proceso q genera la salida
	Local $strProgresoTexto = ""
	Local $value = 0
	Local $percent = 0
	Local $fDiff = 0
	Local $indexProgrIndic = 0
	Local $hTimer = TimerInit()
	While ProcessExists($psTarea)

		$fDiff = TimerDiff($hTimer)
		If $fDiff > 300 Then
			$hTimer = TimerInit()
			$indexProgrIndic += 1
			if UBound($arProgressIndicator) == $indexProgrIndic Then
				$indexProgrIndic = 0
			EndIf
		EndIf

		$line = StdoutRead($psTarea, True)
		If StringInStr($line, ".0%") Then
			;separamos a partir del .0%, para hallar el % de progreso
			$line1 = StringSplit($line, ".0%",$STR_ENTIRESPLIT)
			$value = StringRight($line1[$line1[0] - 1], 2) ; agarramos el ultimo % leido
		EndIf
		; Si llega a 00 es porque llego al 100% y finalizo correctamente
		If $value == "00" Then $value = 100


		Sleep(100)
		If $percent <> $value Then

			$strProgresoTexto = f_ProgresoTexto($value, 3)
			f_MensajesProgreso_MostrarProgresoTexto($Salida, $arProgressIndicator[$indexProgrIndic] & @CRLF & $strProgresoTexto)

			$percent = $value
		EndIf

	WEnd
	Local $sSalida = StdoutRead($psTarea, True)
	$sSalida = ReemplazarCaracteresEspanol($sSalida)

	MensajesProgreso($Salida,@CRLF & $strProgresoTexto)
	MensajesProgreso($Salida, " ")
;==========================
	MensajesProgreso($Salida, "Proceso finalizado")
	MensajesProgreso($Salida, @CRLF & "===========Salida del comando===============" & @CRLF & f_ExtraeResumenComando($sSalida, 4, 3))
EndFunc

