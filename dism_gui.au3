#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile_x64=dism_gui.exe
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Fileversion=1.0.0.3
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=p
#AutoIt3Wrapper_Res_ProductName=dism_gui
#AutoIt3Wrapper_Res_ProductVersion=1.0
#AutoIt3Wrapper_Res_HiDpi=Y
#AutoIt3Wrapper_Run_AU3Check=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****


#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListView.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>

#include <gui_dism.au3>
#include <gui_select_image.au3>
#include <funciones_gui.au3>

#include <dism2_funciones.au3>
#include <funciones.au3>

GUICtrlSetState($Capturar, @SW_SHOW)
GUISetState(@SW_HIDE,$FormSelectImage)
GUISetState(@SW_SHOW,$gui_dism)

;~ variable para indicar la pestaña de la cual se activo el boton select imagen
Global $indexCtrlSelectImage

While 1
	$nMsg = GUIGetMsg(1)
	;obviamos los mensajes de movimiento del mouse
	If $nMsg[0] = $GUI_EVENT_MOUSEMOVE Then
		ContinueLoop
	EndIf

	Switch $nMsg[1]
		Case $gui_dism
			Eventos_gui($nMsg[0])
		Case $FormSelectImage
			Eventos_sel_image($nMsg[0])
	EndSwitch
WEnd

Func Eventos_gui($ev)
	Switch $ev
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnCapFileDst
			$RutaFile = SelectFileDialog("save", $inCapFileDst, "Seleccione el archivo WIM", "wim")
;~ 			MsgBox($MB_SYSTEMMODAL,"pruba", "mi prueba")
		Case $btCapUnidadSrc
			$RutaFile = SelectFileDialog("folder", $inCapUnidadSrc, "Seleccione la unidad a capturar", "all")
		Case $btnAplFileSrc
			$RutaFile = SelectFileDialog("file", $inAplFileSrc, "Seleccione el archivo WIM", "wim")
			$indexCtrlSelectImage = 0
			ActualizarListaImagenes($indexCtrlSelectImage)
		Case $btnAplExaminarDst
			$RutaFile = SelectFileDialog("folder", $inAplUnidadDst, "Seleccione la unidad a capturar", "all")
		Case $btnAplExaminarDst
			$RutaFile = SelectFileDialog("folder", $inAplUnidadDst, "Seleccione la unidad a aplicar la imagen", "all")
		Case $btnMntMontajeEn
			$RutaFile = SelectFileDialog("folder", $inMntMontajeEn, "Seleccione la carpeta de montaje", "all")
		Case $btnMntFileSrc
			$RutaFile = SelectFileDialog("file", $inMntFileSrc, "Seleccione el archivo WIM", "wim")
			$indexCtrlSelectImage = 1
			ActualizarListaImagenes($indexCtrlSelectImage)
		Case $btnExpExamSrc
			$RutaFile = SelectFileDialog("file", $InExpFileSrc, "Seleccione el archivo WIM", "wim")
			$indexCtrlSelectImage = 2
			ActualizarListaImagenes($indexCtrlSelectImage)
		Case $btnExpDst
			$RutaFile = SelectFileDialog("file", $inExpFileDst, "Seleccione el archivo WIM", "wim")

		Case $btnCapCrearImagen
			If GUICtrlRead($inCapUnidadSrc) <> "" And _
				GUICtrlRead($inCapFileDst) <> "" And _
				GUICtrlRead($inCapImageName) <> "" And _
				GUICtrlRead($inCapImageDescr) <> "" Then
				DismCapture(GUICtrlRead($inCapUnidadSrc), _
					GUICtrlRead($inCapFileDst), _
					GUICtrlRead($inCapImageName), _
					GUICtrlRead($inCapImageDescr), _
					GUICtrlRead($cmbCapComprx), $editForm, False)
			EndIf
		Case $btnCapAddImagen
			If GUICtrlRead($inCapUnidadSrc) <> "" And _
				GUICtrlRead($inCapFileDst) <> "" And _
				GUICtrlRead($inCapImageName) <> "" And _
				GUICtrlRead($inCapImageDescr) <> "" Then
				DismCapture(GUICtrlRead($inCapUnidadSrc), _
					GUICtrlRead($inCapFileDst), _
					GUICtrlRead($inCapImageName), _
					GUICtrlRead($inCapImageDescr), _
					GUICtrlRead($cmbCapComprx), $editForm, True)
			EndIf
		Case $btnaplAplicarIma
			If GUICtrlRead($inAplFileSrc) <> "" And _
				GUICtrlRead($inAplUnidadDst) <> "" And _
				GUICtrlRead($inAplIndexImage) <> "" And _
				GUICtrlRead($inAplIageName) <> "" Then
				DismApply(GUICtrlRead($inAplFileSrc), _
					GUICtrlRead($inAplUnidadDst), _
					GUICtrlRead($inAplIndexImage), _
					$editForm)
			EndIf
		Case $BtnMntMount
			If GUICtrlRead($inMntMontajeEn) <> "" And _
				GUICtrlRead($inMntFileSrc) <> "" And _
				GUICtrlRead($inMntIndexIma) <> "" Then
				DismMount(GUICtrlRead($inMntMontajeEn), _
					GUICtrlRead($inMntFileSrc), _
					GUICtrlRead($inMntIndexIma), _
					$editForm)
				ControlListView($gui_dism, "", $lvMnt1,"SelectClear")
			EndIf
		Case $btnMntUnmount
			Local $ItemSelected
			If ControlListView($gui_dism, "", $lvMnt1, "GetItemCount") > 0 Then
				$intItemSelected = ControlListView($gui_dism, "", $lvMnt1,"GetSelected")
				$strRutaMontajeSel = ControlListView($gui_dism, "", $lvMnt1,"GetText", $ItemSelected, 1)
;~ 				MsgBox($MB_SYSTEMMODAL,"Desmontar1", $strItemSelected & ' error:' & @error )
				If $strRutaMontajeSel <> "" Then
					DismUnmount($strRutaMontajeSel, GUICtrlRead($ckbMntCommit), $editForm)
					getListMounted($lvMnt1)
				Else
					MsgBox($MB_SYSTEMMODAL,"Desmontar", "No ha seleccionado mninguna imagen montada")
				EndIf
			EndIf

		Case $btnMntUpdateList
			getListMounted($lvMnt1)
			ControlListView($gui_dism, "", $lvMnt1,"SelectClear")
		Case $btnMntAddDrivers
			Local $ItemSelected
			If ControlListView($gui_dism, "", $lvMnt1, "GetItemCount") > 0 Then
				$intItemSelected = ControlListView($gui_dism, "", $lvMnt1,"GetSelected")
				$strRutaMontajeSel = ControlListView($gui_dism, "", $lvMnt1,"GetText", $ItemSelected, 1)
;~ 				MsgBox($MB_SYSTEMMODAL,"Desmontar1", $strItemSelected & ' error:' & @error )
				If $strRutaMontajeSel <> "" Then
					Local $RutaDriver = SelectFileDialog("driver", $inCapFileDst,"Seleccione el .inf del driver a instalar", "inf")
					If $RutaDriver <> "" Then
						DismAddDriver($RutaDriver, $strRutaMontajeSel, $editForm)
						VerifyDrivers($strRutaMontajeSel, $editForm)
					EndIf
				Else
					MsgBox($MB_SYSTEMMODAL,"Desmontar", "No ha seleccionado mninguna imagen montada")
				EndIf
			EndIf

		Case $btnMntExplorar
			Local $ItemSelected
			If ControlListView($gui_dism, "", $lvMnt1, "GetItemCount") > 0 Then
				$intItemSelected = ControlListView($gui_dism, "", $lvMnt1,"GetSelected")
				$strRutaMontajeSel = ControlListView($gui_dism, "", $lvMnt1,"GetText", $ItemSelected, 1)
;~ 				MsgBox($MB_SYSTEMMODAL,"Desmontar1", $strItemSelected & ' error:' & @error )
				If $strRutaMontajeSel <> "" Then
					Local $psTarea = Run("explorer.exe " & $strRutaMontajeSel, "", @SW_MAXIMIZE )
				Else
					MsgBox($MB_SYSTEMMODAL,"Desmontar", "No ha seleccionado mninguna imagen montada")
				EndIf
			EndIf

		Case $btnExpExp
			If GUICtrlRead($InExpFileSrc) <> "" And _
				GUICtrlRead($inExpFileDst) <> "" Then
				DismExport(GUICtrlRead($InExpFileSrc), GUICtrlRead($inExpFileDst), GUICtrlRead($inExpImIndex), GUICtrlRead($cmbExpCompx), $editForm)
			EndIf

		Case $btnAplSelIma
			$indexCtrlSelectImage = 0
			ActualizarListaImagenes($indexCtrlSelectImage)
			ShowFormListImagenes()
		Case $btnMntSelIma
			$indexCtrlSelectImage = 1
			ActualizarListaImagenes($indexCtrlSelectImage)
			ShowFormListImagenes()
		Case $btmExpSelIma
			$indexCtrlSelectImage = 2
			ActualizarListaImagenes($indexCtrlSelectImage)
			ShowFormListImagenes()
	EndSwitch
EndFunc

Func Eventos_sel_image($ev)
		Switch $ev
		Case $GUI_EVENT_CLOSE
			GUISetState(@SW_HIDE,$FormSelectImage)
		Case $SelectImage
			CargaImagenSelect($indexCtrlSelectImage)
			GUISetState(@SW_HIDE,$FormSelectImage)
	EndSwitch
EndFunc
