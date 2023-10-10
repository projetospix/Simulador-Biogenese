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


func VoltarMenu():
	$"%ConfirmationDialog".popup_centered()
	

func ConfirmouEscolha():
	get_tree().change_scene("res://cenas/Menu Inicial.tscn")


func MenuAcessibilidade():
	MenuAcessibilidade.Abrir()
	
func TextoAcessivel(b):
	if b:
		self.add_font_override("Lexicon", load("res://fontes-e-temas/fonteLexend20.tres"))
