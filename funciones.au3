
Func ActualizarListaImagenes($indexTab)
	Local $sRutaFile = GUICtrlRead($arControlesSelectImagen[$indexTab][1])
	If $sRutaFile = "" Then Return
	If CargaListaImagenes($sRutaFile) Then
		UpdateCtrlInputImageNameSelect(0, $indexTab)
		RellenarCtrlListView($ListImageSelect, $arImagenes)
	Else
		 MsgBox($MB_SYSTEMMODAL, "Error", "Error en la carga de imagenes")
	EndIf

EndFunc

Func UpdateCtrlInputImageNameSelect($intNumImage, $indexTab)
		GUICtrlSetData($arControlesSelectImagen[$indexTab][3], $arImagenes[$intNumImage][1])
		GUICtrlSetData($arControlesSelectImagen[$indexTab][2], $arImagenes[$intNumImage][0])
EndFunc

Func CargaImagenSelect($indexTab)
	Local $ItemSelected
	If ControlListView($FormSelectImage, "", $ListImageSelect, "GetItemCount") > 0 Then
		$ItemSelected = ControlListView($FormSelectImage, "", $ListImageSelect,"GetSelected")
		UpdateCtrlInputImageNameSelect($ItemSelected, $indexTab)
	EndIf
EndFunc

Func ShowFormListImagenes()
	If ControlListView($FormSelectImage, "", $ListImageSelect, "GetItemCount") > 0 Then
		GUISetState(@SW_SHOW,$FormSelectImage)
	EndIf

EndFunc



