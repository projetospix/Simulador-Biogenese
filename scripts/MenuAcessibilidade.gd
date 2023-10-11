extends CanvasLayer

var texto_acessivel = false

func Fechar():
	$Popup.visible = false


func MudarFonte(button_pressed):
	if button_pressed:
		get_tree().call_group("Acessiveis", "TextoAcessivel", true)
		texto_acessivel = true
	else:
		get_tree().call_group("Acessiveis", "TextoAcessivel", false)
		var texto_acessivel = false
		
		

func Abrir():
	$Popup.popup_centered()
