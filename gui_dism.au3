#Region ### START Koda GUI section ### Form=c:\users\w10\documents\git\dism gui\dism_gui_form.kxf
$gui_dism = GUICreate("Dism GUI", 615, 578, 192, 124)
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
$btnCapAddImagen = GUICtrlCreateButton("A�adir Imagen", 495, 290, 75, 25)
$btnCapCrearImagen = GUICtrlCreateButton("Crear Imagen", 396, 290, 75, 25)
$Aplicar = GUICtrlCreateTabItem("Aplicar")
$lblApl1 = GUICtrlCreateLabel("Archivo WIM", 42, 58, 66, 17)
$inAplFileSrc = GUICtrlCreateInput("", 127, 56, 337, 21)
$btnAplFileSrc = GUICtrlCreateButton("Examinar", 495, 56, 75, 25)
$lblApl2 = GUICtrlCreateLabel("Unidad Destino", 40, 104, 77, 17)
$inAplUnidadDst = GUICtrlCreateInput("", 127, 100, 337, 21)
$btnAplExaminarDst = GUICtrlCreateButton("Examinar", 495, 97, 75, 25)
$lblApl3 = GUICtrlCreateLabel("Imagen", 42, 148, 39, 17)
$inAplIndexImage = GUICtrlCreateInput("", 127, 144, 41, 21)
$btnAplSelIma = GUICtrlCreateButton("Seleccionar", 495, 141, 75, 25)
$inAplIageName = GUICtrlCreateInput("", 175, 144, 289, 21)
$btnaplAplicarIma = GUICtrlCreateButton("Aplicar", 495, 192, 75, 25)
$TabSheet3 = GUICtrlCreateTabItem("Montar")
$lblMnt1 = GUICtrlCreateLabel("Montaje en:", 47, 59, 60, 17)
$inMntMontajeEn = GUICtrlCreateInput("", 120, 56, 353, 21)
$btnMntMontajeEn = GUICtrlCreateButton("Examinar", 495, 53, 75, 25)
$lblMnt2 = GUICtrlCreateLabel("Archivo WIM", 47, 96, 66, 17)
$inMntFileSrc = GUICtrlCreateInput("", 120, 96, 353, 21)
$btnMntFileSrc = GUICtrlCreateButton("Examinar", 495, 93, 75, 25)
$lblMnt3 = GUICtrlCreateLabel("Imagen", 50, 143, 39, 17)
$inMntIndexIma = GUICtrlCreateInput("", 120, 139, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY,$ES_NUMBER))
$InMntNameImage = GUICtrlCreateInput("", 159, 139, 313, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
$btnMntSelIma = GUICtrlCreateButton("Seleccionar", 495, 136, 75, 25)
$ckbMntRW = GUICtrlCreateCheckbox("R/W", 51, 184, 97, 17)
$BtnMntMount = GUICtrlCreateButton("Montar", 497, 184, 75, 25)
$grpMnt = GUICtrlCreateGroup("Desmontar", 39, 224, 537, 105)
$lvMnt1 = GUICtrlCreateListView("R/W|Montaje en|Archivo Imagen|Imagen", 55, 245, 506, 70)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 40)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 200)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 100)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 3, 100)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($lvMnt1), 1, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($lvMnt1), 2, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($lvMnt1), 3, 2)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$ckbMntCommit = GUICtrlCreateCheckbox("Guardar Cambios", 47, 347, 97, 17)
$btnMntUpdateList = GUICtrlCreateButton("Actualizar", 391, 344, 75, 25)
$btnMntUnmount = GUICtrlCreateButton("Desmontar", 495, 344, 75, 25)
$btnMntAddDrivers = GUICtrlCreateButton("Add Drivers", 295, 344, 75, 25)
$btnMntExplorar = GUICtrlCreateButton("Explorar", 207, 344, 75, 25)
$TabExportar = GUICtrlCreateTabItem("Exportar")
$grpExp1 = GUICtrlCreateGroup("Origen", 39, 40, 537, 105)
$lblExp1 = GUICtrlCreateLabel("Archivo WIM", 55, 68, 66, 17)
$InExpFileSrc = GUICtrlCreateInput("", 135, 64, 321, 21)
$btnExpExamSrc = GUICtrlCreateButton("Examinar", 483, 64, 75, 25)
$btmExpSelIma = GUICtrlCreateButton("Seleccionar", 483, 104, 75, 25)
$inExpImIndex = GUICtrlCreateInput("", 135, 104, 33, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
$lblExp2 = GUICtrlCreateLabel("Imagen", 56, 107, 39, 17)
$inExpImaName = GUICtrlCreateInput("", 177, 104, 281, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpExp2 = GUICtrlCreateGroup("Destino", 39, 168, 537, 105)
$lblExp3 = GUICtrlCreateLabel("Archivo WIM", 55, 200, 66, 17)
$inExpFileDst = GUICtrlCreateInput("", 135, 200, 321, 21)
$btnExpDst = GUICtrlCreateButton("Examinar", 483, 199, 75, 25)
$cmbExpCompx = GUICtrlCreateCombo("", 134, 235, 129, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
$lblExp4 = GUICtrlCreateLabel("Compresion", 55, 238, 59, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$btnExpExp = GUICtrlCreateButton("Exportar", 484, 321, 75, 25)
GUICtrlCreateTabItem("")
$editForm = GUICtrlCreateEdit("", 24, 408, 569, 153)
GUICtrlSetData(-1, "")


#EndRegion ### END Koda GUI section ###