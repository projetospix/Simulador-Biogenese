extends Control

func _ready():
	TextoAcessivel(MenuAcessibilidade.texto_acessivel)
	Globais.Sequencia_Acao = {}
	Globais.Estado = {}
	Globais.Tampas = {}
	Globais.Microscopio = {}
	

func MudarCenaPasteur():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://cenas/CenárioPasteur.tscn")

func MenuAcessibilidade():
	MenuAcessibilidade.Abrir()

func TextoAcessivel(b):
	if b:
		self.theme = load("res://fontes-e-temas/Acessivel.tres")
	else:
		self.theme = load("res://fontes-e-temas/renascença.tres")
		


func MudarCenaRedi():
	get_tree().change_scene("res://cenas/CenárioRedi.tscn")


func MudarCenaTutorial() -> void:
	get_tree().change_scene("res://cenas/Tutorial.tscn")
