extends CanvasLayer


func Fechar():
	$Popup.visible = false


func MudarFonte(button_pressed):
	if button_pressed:
		get_tree().call_group("Acessiveis", "TextoAcessivel", true)
	else:
		get_tree().call_group("Acessiveis", "TextoAcessivel", false)
		

func Abrir():
	$Popup.popup_centered()
