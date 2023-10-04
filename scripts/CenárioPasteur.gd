extends Control

var hipotese = ""
signal AtualizaHipotese(texto)

func _ready():
	$EscolhaHipotese.popup_centered()

func Biogenese():
	hipotese = $"%Bio".text
	$"%EscolhaHipotese".visible = false
	emit_signal("AtualizaHipotese", hipotese)
	
func Abiogenese():
	hipotese = $"%Abio".text
	$"%EscolhaHipotese".visible = false
	emit_signal("AtualizaHipotese", hipotese)
