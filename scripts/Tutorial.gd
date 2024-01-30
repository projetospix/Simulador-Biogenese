extends Control

var etapas = [
	{
		"texto": "Bem vindo ao seu laboratório.\nVamos aprender a usar este simulador?\nAperte em avançar",
		"destacados": [],
	},
	{
		"texto": "Vamos começar adicionando um frasco.\nAperte no botão \"+\" na bancada\nQuando conseguir clique em \"avançar\"",
		"destacados": ["%Bancada"],
	}
]
var etapa_atual := 0
var todos_nos = []
var hipotese = ""
signal AtualizaHipotese(texto)

var parents = {}

func _ready():
	obterFilhos($".")
	defineEtapa(0)
	$Caderno.visible = false
	$Microscopio.visible = false
	$"Bancada/Add 2".visible = false
	$"Bancada/Add 3".visible = false
	TextoAcessivel(MenuAcessibilidade.texto_acessivel)
	
func defineEtapa(etapa: int):
	get_parent().move_child($Node2D,1)
	$Node2D/texto_do_tutorial.text = etapas[etapa].texto
	for node in etapas[etapa_atual].destacados:
		var no = get_node(node)
		no.queue_free()
		parents[no].add_child(no)
	for node in etapas[etapa].destacados:
		var no = get_node(node)
		parents[no] = no.get_parent()
		no.get_parent().remove_child(no)
		$Node2D/vemca.add_child(no)
	etapa_atual = etapa

func obterFilhos(ref):
	for node in ref.get_children():
		if node is Node2D:
			todos_nos.append(node)
		else:	
			if ref.get_child_count() > 0:	
				obterFilhos(node)
				
func _on_avancar() -> void:
	defineEtapa(etapa_atual + 1)
	if etapa_atual == len(etapas)-1:
		$Node2D/avancar.disabled = true


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

