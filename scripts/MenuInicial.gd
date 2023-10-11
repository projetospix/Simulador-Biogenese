extends Control

func _ready():
	TextoAcessivel(MenuAcessibilidade.texto_acessivel)

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
		
