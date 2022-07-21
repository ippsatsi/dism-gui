#RequireAdmin
#AutoIt3Wrapper_Res_HiDpi=Y

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListView.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>



#include <dism2_funciones.au3>
#include <funciones_gui.au3>
#include <gui_dism.au3>
#include <gui_select_image.au3>

GUICtrlSetState($Capturar, @SW_SHOW)
GUISetState(@SW_HIDE,$FormSelectImage)
GUISetState(@SW_SHOW,$gui_dism)

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
		Case $btnAplExaminarDst
			$RutaFile = SelectFileDialog("folder", $inAplUnidadDst, "Seleccione la unidad a capturar", "all")
		Case $btnAplExaminarDst
			$RutaFile = SelectFileDialog("folder", $inAplUnidadDst, "Seleccione la unidad a aplicar la imagen", "all")
		Case $btnMntMontajeEn
			$RutaFile = SelectFileDialog("folder", $inMntMontajeEn, "Seleccione la carpeta de montaje", "all")
		Case $btnMntFileSrc
			$RutaFile = SelectFileDialog("file", $inMntFileSrc, "Seleccione el archivo WIM", "wim")
		Case $btnExpExamSrc
			$RutaFile = SelectFileDialog("file", $InExpFileSrc, "Seleccione el archivo WIM", "wim")
		Case $btnExpDst
			$RutaFile = SelectFileDialog("file", $inExpFileDst, "Seleccione el archivo WIM", "wim")

		Case $btnCapCrearImagen
			If $inCapUnidadSrc <> "" And _
				$inCapFileDst <> "" And _
				$inCapImageName <> "" And _
				$inCapImageDescr <> "" Then
				DismApply(GUICtrlRead($inCapUnidadSrc), _
					GUICtrlRead($inCapFileDst), _
					GUICtrlRead($inCapImageName), _
					GUICtrlRead($inCapImageDescr), _
					GUICtrlRead($cmbCapComprx), $editForm)
			EndIf

		Case $btnAplSelIma
			GUISetState(@SW_SHOW,$FormSelectImage)
		Case $btnMntSelIma
			GUISetState(@SW_SHOW,$FormSelectImage)
		Case $btmExpSelIma
			GUISetState(@SW_SHOW,$FormSelectImage)
	EndSwitch
EndFunc

Func Eventos_sel_image($ev)
		Switch $ev
		Case $GUI_EVENT_CLOSE
			GUISetState(@SW_HIDE,$FormSelectImage)
		Case $SelectImage
;~ 			CargaImagenSelect()
			GUISetState(@SW_HIDE,$FormSelectImage)
	EndSwitch
EndFunc
