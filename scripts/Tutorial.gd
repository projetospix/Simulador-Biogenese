extends Control

var etapas = [
	{
		"texto": "Bem vindo, filho da puta!",
		"destacados": ["%Bancada"],
	}
]
var etapa_atual := 0
var todos_nos = []
var hipotese = ""
signal AtualizaHipotese(texto)

func _ready():
	obterFilhos($".")
	defineEtapa(0)
	$Caderno.visible = false
	$Microscopio.visible = false
	$"Bancada/Add 2".visible = false
	$"Bancada/Add 3".visible = false
	TextoAcessivel(MenuAcessibilidade.texto_acessivel)
	
func defineEtapa(etapa: int):
	$Node2D/Label.text = etapas[etapa].texto
	for item in todos_nos:
		item.z_index = 10
	for node in etapas[etapa].destacados:
		get_node(node).z_index = 601

func obterFilhos(ref):
	for node in ref.get_children():
		if node is Node2D:
			todos_nos.append(node)
		else:	
			if ref.get_child_count() > 0:	
				obterFilhos(node)


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
		
		
