extends Control

var hipotese = ""
signal AtualizaHipotese(texto)

func _ready():
	$"%EscolhaHipotese".popup_centered()
	TextoAcessivel(MenuAcessibilidade.texto_acessivel)

func Biogenese():
	hipotese = $"%Bio".text
	$"%EscolhaHipotese".visible = false
	emit_signal("AtualizaHipotese", hipotese)
	
func Abiogenese():
	hipotese = $"%Abio".text
	$"%EscolhaHipotese".visible = false
	emit_signal("AtualizaHipotese", hipotese)


func VoltarMenu():
	$"%ConfirmationDialog".popup_centered()
	

func ConfirmouEscolha():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://cenas/Menu Inicial.tscn")


func MenuAcessibilidade():
	MenuAcessibilidade.Abrir()
	
func TextoAcessivel(b):
	if b:
		self.theme = load("res://fontes-e-temas/Acessivel.tres")
		$"%Popups".theme = load("res://fontes-e-temas/Acessivel.tres")
		$Caderno.rotation_degrees = 0
	else:
		self.theme = load("res://fontes-e-temas/renascença.tres")
		$"%Popups".theme = load("res://fontes-e-temas/renascença.tres")
		$Caderno.rotation_degrees = -0.8
		
		
