;dism /get-imageinfo /imagefile:
Global $arImagenes

Func DismSuccessDosIdiomas($sSalida)
	If StringInStr($sSalida,"The operation completed successfully") Or StringInStr($sSalida,"La operación se completó correctamente") Then
		Return True
	Else
		Return False
	EndIf
EndFunc

Func ConvertDismBytesToGb($sValor)
	Local $intValor
	$sValor = StringReplace($sValor, ",", "")
	;para la version de Dism en ingles
	$sValor = StringReplace($sValor, ".", "")
	$sValor = StringReplace($sValor, "bytes", "")
	$intValor = Number($sValor)
	$intValor = $intValor/1024
	$intValor = $intValor/1024
	$intValor = $intValor/1024
	Return Round($intValor,1)
EndFunc

Func DismApply($UnidadCap, $FilePath, $ImageName, $ImageDescrip,$compresion, $Salida)
;~ 	Dism /Capture-Image /ImageFile:<path_to_image_file>
;~ 					/CaptureDir:<source_directory>
;~ 					/Name:<image_name>
;~ 					[/Description:<image_description>]
;~ [/ConfigFile:<configuration_file.ini>] {[/Compress:{max|fast|none}] [/Bootable] | [/WIMBoot]} [/CheckIntegrity] [/Verify] [/NoRpFix] [/EA]
	Local $txtCommandLine = 'dism /Capture-Image /ImageFile:"' & $FilePath & _
								'" /CaptureDir:"' & $UnidadCap & _
								'" /Name:"' & $ImageName & _
								'" /Description:"' & $ImageDescrip & _
								'" /Compress:' & $compresion
	Local $psTarea = Run(@ComSpec & " /c " & $txtCommandLine, "", @SW_HIDE, $STDOUT_CHILD)
	While ProcessExists($psTarea)
		Local $mensajes = $txtCommandLine & @CRLF & StdoutRead($psTarea, True)
		GUICtrlSetData($Salida, $mensajes)
	WEnd

EndFunc
