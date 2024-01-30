extends Control

var etapas = [
	{
		"texto": "Bem vindo ao seu laboratório.\nVamos aprender a usar este simulador?\nAperte em avançar",
		"setaVisivel": false,
		"posicaoSeta": Vector2.ZERO,
		"angulo": 0,
		"visiveis": []
	},
	{
		"texto": "Vamos começar adicionando um frasco.\nAperte no botão \"+\" na bancada\nQuando conseguir clique em \"avançar\"",
		"setaVisivel": true,
		"posicaoSeta": Vector2(200, 200),
		"angulo": 180,
		"visiveis": ["%Bancada"]
	},
	{
		"texto": "Blablabla",
		"setaVisivel": true,
		"posicaoSeta": Vector2.ZERO,
		"angulo": 0,
		"visiveis": []
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
	$"%Bancada".visible = false
	TextoAcessivel(MenuAcessibilidade.texto_acessivel)
	
func defineEtapa(etapa: int):
	var essa_etapa = etapas[etapa]
	$Node2D/texto_do_tutorial.text = essa_etapa.texto
	for node in essa_etapa.visiveis:
		var no = get_node(node)
		no.visible = true
	
	$Node2D/Seta.rect_position = essa_etapa["posicaoSeta"]
	$Node2D/Seta.rect_rotation = essa_etapa["angulo"]
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

