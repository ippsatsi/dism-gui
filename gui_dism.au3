#Region ### START Koda GUI section ### Form=c:\users\w10\documents\git\dism gui\dism_gui_form.kxf
$gui_dism = GUICreate("Dism GUI v1.0", 615, 578, 192, 124)
$Tab1 = GUICtrlCreateTab(23, 8, 569, 377)

$Capturar = GUICtrlCreateTabItem("Capturar")
$inCapUnidadSrc = GUICtrlCreateInput("", 143, 56, 329, 21)
$btCapUnidadSrc = GUICtrlCreateButton("Examinar", 495, 54, 75, 25)
$lblOrigen = GUICtrlCreateLabel("Unidad a capturar", 39, 59, 89, 17)
$inCapFileDst = GUICtrlCreateInput("", 143, 100, 329, 21)
$lblDestino = GUICtrlCreateLabel("Archivo destino", 38, 103, 77, 17)
$btnCapFileDst = GUICtrlCreateButton("Examinar", 495, 96, 75, 25)
$Group1 = GUICtrlCreateGroup("Imagen", 39, 135, 529, 145)
$Label1 = GUICtrlCreateLabel("Nombre", 52, 166, 41, 17)
$inCapImageName = GUICtrlCreateInput("", 142, 159, 329, 21)
$Label2 = GUICtrlCreateLabel("Descripcion", 52, 204, 60, 17)
$inCapImageDescr = GUICtrlCreateInput("", 142, 198, 329, 21)
$Label3 = GUICtrlCreateLabel("Compresion", 52, 243, 59, 17)
$cmbCapComprx = GUICtrlCreateCombo("", 142, 239, 65, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData($cmbCapComprx, "Max|Fast", "Fast")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$btnCapAddImagen = GUICtrlCreateButton("Añadir Imagen", 495, 290, 75, 25)
$btnCapCrearImagen = GUICtrlCreateButton("Crear Imagen", 396, 290, 75, 25)

$Aplicar = GUICtrlCreateTabItem("Aplicar")
$lblApl1 = GUICtrlCreateLabel("Archivo WIM", 42, 58, 66, 17)
$inAplFileSrc = GUICtrlCreateInput("", 127, 56, 337, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
$btnAplFileSrc = GUICtrlCreateButton("Examinar", 495, 56, 75, 25)
$lblApl2 = GUICtrlCreateLabel("Unidad Destino", 40, 104, 77, 17)
$inAplUnidadDst = GUICtrlCreateInput("", 127, 100, 337, 21)
$btnAplExaminarDst = GUICtrlCreateButton("Examinar", 495, 97, 75, 25)
$lblApl3 = GUICtrlCreateLabel("Imagen", 42, 148, 39, 17)
$inAplIndexImage = GUICtrlCreateInput("", 127, 144, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY,$ES_NUMBER))
$btnAplSelIma = GUICtrlCreateButton("Seleccionar", 495, 141, 75, 25)
$inAplIageName = GUICtrlCreateInput("", 175, 144, 289, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
$btnaplAplicarIma = GUICtrlCreateButton("Aplicar", 495, 192, 75, 25)

$TabSheet3 = GUICtrlCreateTabItem("Montar")
$lblMnt1 = GUICtrlCreateLabel("Montaje en:", 47, 59, 60, 17)
$inMntMontajeEn = GUICtrlCreateInput("", 120, 56, 353, 21)
$btnMntMontajeEn = GUICtrlCreateButton("Examinar", 495, 53, 75, 25)
$lblMnt2 = GUICtrlCreateLabel("Archivo WIM", 47, 96, 66, 17)
$inMntFileSrc = GUICtrlCreateInput("", 120, 96, 353, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
$btnMntFileSrc = GUICtrlCreateButton("Examinar", 495, 93, 75, 25)
$lblMnt3 = GUICtrlCreateLabel("Imagen", 50, 143, 39, 17)
$inMntIndexIma = GUICtrlCreateInput("", 120, 139, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY,$ES_NUMBER))
$InMntNameImage = GUICtrlCreateInput("", 159, 139, 313, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
$btnMntSelIma = GUICtrlCreateButton("Seleccionar", 495, 136, 75, 25)
;~ $ckbMntRW = GUICtrlCreateCheckbox("R/W", 51, 184, 97, 17)
$BtnMntMount = GUICtrlCreateButton("Montar", 497, 184, 75, 25)
$grpMnt = GUICtrlCreateGroup("Desmontar", 39, 224, 537, 105)
$lvMnt1 = GUICtrlCreateListView("RW|Montaje en|Archivo Imagen|Imagen|ST", 47, 245, 522, 70)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 35)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 200)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 190)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 3, 50)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 4, 40)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($lvMnt1), 1, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($lvMnt1), 2, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($lvMnt1), 3, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($lvMnt1), 4, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$ckbMntCommit = GUICtrlCreateCheckbox("Guardar Cambios", 47, 347, 97, 17)
$btnMntUpdateList = GUICtrlCreateButton("Actualizar", 391, 344, 75, 25)
$btnMntUnmount = GUICtrlCreateButton("Desmontar", 495, 344, 75, 25)
$btnMntAddDrivers = GUICtrlCreateButton("Add Drivers", 295, 344, 75, 25)
$btnMntExplorar = GUICtrlCreateButton("Explorar", 207, 344, 75, 25)

$TabExportar = GUICtrlCreateTabItem("Exportar")
$grpExp1 = GUICtrlCreateGroup("Origen", 39, 40, 537, 105)
$lblExp1 = GUICtrlCreateLabel("Archivo WIM", 55, 68, 66, 17)
$InExpFileSrc = GUICtrlCreateInput("", 135, 64, 321, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
$btnExpExamSrc = GUICtrlCreateButton("Examinar", 483, 64, 75, 25)
$btmExpSelIma = GUICtrlCreateButton("Seleccionar", 483, 104, 75, 25)
$inExpImIndex = GUICtrlCreateInput("", 135, 104, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY,$ES_NUMBER))
$lblExp2 = GUICtrlCreateLabel("Imagen", 56, 107, 39, 17)
$inExpImaName = GUICtrlCreateInput("", 177, 104, 281, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpExp2 = GUICtrlCreateGroup("Destino", 39, 168, 537, 105)
$lblExp3 = GUICtrlCreateLabel("Archivo WIM", 55, 200, 66, 17)
$inExpFileDst = GUICtrlCreateInput("", 135, 200, 321, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
$btnExpDst = GUICtrlCreateButton("Examinar", 483, 199, 75, 25)
$cmbExpCompx = GUICtrlCreateCombo("", 134, 235, 129, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData($cmbExpCompx, "Max|Fast", "Fast")
$lblExp4 = GUICtrlCreateLabel("Compresion", 55, 238, 59, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$btnExpExp = GUICtrlCreateButton("Exportar", 484, 321, 75, 25)
GUICtrlCreateTabItem("")
$editForm = GUICtrlCreateEdit("", 24, 408, 569, 153)
GUICtrlSetData(-1, "")


#EndRegion ### END Koda GUI section ###

Global $arControlesSelectImagen[3][4]

;~ aplicar
$arControlesSelectImagen[0][0] = $btnAplSelIma
$arControlesSelectImagen[0][1] = $inAplFileSrc
$arControlesSelectImagen[0][2] = $inAplIndexImage
$arControlesSelectImagen[0][3] = $inAplIageName
;~ Montar
$arControlesSelectImagen[1][0] = $btnMntSelIma
$arControlesSelectImagen[1][1] = $inMntFileSrc
$arControlesSelectImagen[1][2] = $inMntIndexIma
$arControlesSelectImagen[1][3] = $InMntNameImage
;~ Exportar
$arControlesSelectImagen[2][0] = $btmExpSelIma
$arControlesSelectImagen[2][1] = $InExpFileSrc
$arControlesSelectImagen[2][2] = $inExpImIndex
$arControlesSelectImagen[2][3] = $inExpImaName
