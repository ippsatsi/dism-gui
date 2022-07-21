#Region ### START Koda GUI section ### Form=d:\util\win_deploy\formselectimage.kxf
$FormSelectImage = GUICreate("Seleccionar Imagen", 613, 359, 192, 124, -1, -1, $gui_dism)
$ListImageSelect = GUICtrlCreateListView("#|Nombre                      |Descripcion                |Tamaño          ", 18, 16, 577, 281, BitOr($LVS_SHOWSELALWAYS, $LVS_SINGLESEL, $LVS_NOSORTHEADER))
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 20)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 150)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 350)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 3, 50)
$SelectImage = GUICtrlCreateButton("Selecccionar", 266, 320, 81, 25)

#EndRegion ### END Koda GUI section ###

