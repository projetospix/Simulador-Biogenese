extends Control

var etapas = [
	{
		"texto": "Bem vindo ao seu laboratório.\nVamos aprender a usar este simulador?\nAperte em avançar",
		"setaVisivel": false,
		"posicaoSeta": Vector2(-200, -200),
		"angulo": 0,
		"visiveis": []
	},
	{
		"texto": "Vamos começar adicionando um frasco.\nAperte no botão \"+\" na bancada",
		"setaVisivel": true,
		"posicaoSeta": Vector2(371, 522),
		"angulo": 180,
		"visiveis": ["%Bancada"]
	},
	{
		"texto": "Escolha a tampa com a gaze",
		"setaVisivel": true,
		"posicaoSeta": Vector2(108, 459),
		"angulo": 15,
		"visiveis": ["%Bancada/Bequer"]
	},
	{
		"texto": "Faça o tempo passar clicando no relógio",
		"setaVisivel": true,
		"posicaoSeta": Vector2(99, 231),
		"angulo": -33,
		"visiveis": []
	},
	{
		"texto": "Clique na lupa para visualizar o resultado",
		"setaVisivel": true,
		"posicaoSeta": Vector2(195, 195),
		"angulo": 129,
		"visiveis": ["%Microscopio"]
	},
	{
		"texto": "Mova o mouse para ver com a lupa e clique para sair do tutorial",
		"setaVisivel": true,
		"posicaoSeta": Vector2(-200, -200),
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
	
	$Node2D/Seta.position = essa_etapa["posicaoSeta"]
	$Node2D/Seta.rotation_degrees = essa_etapa["angulo"]
	
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
	$Node2D/avancar.visible = false


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
	
func _on_Botao_Mais_Falso_button_up():
	defineEtapa(etapa_atual + 1)
	$"Bancada/Add 1".visible = false


func _on_Tampar_button_up():
	defineEtapa(etapa_atual + 1)


func _on_Destampar_button_up():
	defineEtapa(2)


func _on_Adiantar_Tempo_button_up():
	if etapa_atual == 3:
		defineEtapa(etapa_atual + 1)


func _on_SpriteMicro_button_up():
	$"%Bancada".visible = false
	defineEtapa(etapa_atual + 1)
	$Node2D.z_index = 415
