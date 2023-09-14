extends Node2D

export var nome_frasco = 'Frasco'

var Estado_Atual = {
	'tampado': 'destampado',
	'contaminado': 'contaminado'
}

var adicionar_frasco = load("res://cenas/AdicionarFrasco.tscn")

func _ready():
	$NovoFX.emitting = true
	Globais.Sequencia_Acao[nome_frasco] = []
	Globais.Estado[nome_frasco] = true
	$Sprites/Rolha.visible = false
	$Sprites/SpriteFrasco.visible = true
	$Sprites/SpriteFrascoCisne.visible = false
	$Sprites/SpriteFrascoQuebrado.visible = false
	$"%Bolhas".emitting = false
	$"%Fogo".emitting = false
	$"%VaporFrascoAberto".emitting = false
	$"%VaporFrascoAberto".visible = true
	$"%VaporCisne".emitting = false
	$"%VaporFrascoQuebrado".emitting = false
	$Etiqueta.text = nome_frasco
	$Popup.visible = false
	$Destampar.visible = false
	$Quebrar.visible = false


func Ferver():
	get_tree().call_group('Botoes', 'travar')		
	$AnimationPlayer.play("ferver")
	if Estado_Atual.tampado == 'destampado' or Estado_Atual.tampado == 'quebrado':
		Estado_Atual.contaminado = 'pré contaminado'
	else:
		Estado_Atual.contaminado = 'estéril'
	Globais.Sequencia_Acao[nome_frasco].append('Ferveu')
	Globais.Estado[nome_frasco] = false


func Passar_Tempo():
	if Estado_Atual.contaminado == 'pré contaminado':
		Estado_Atual.contaminado = 'contaminado'
		Globais.Estado[nome_frasco] = true
	if Estado_Atual.contaminado == 'estéril' and Estado_Atual.tampado == 'rolha':
		Estado_Atual.contaminado = 'contaminado'
		Globais.Estado[nome_frasco] = true
	Globais.Sequencia_Acao[nome_frasco].append('Passou o Tempo')
	

func Mostrar_PopUp():
	$Popup.visible = true
	get_tree().call_group('Botoes', 'travar')		
	
func Rolha():
	$Popup.visible = false
	Estado_Atual.tampado = 'Rolha'
	$Sprites/Rolha.visible = true
	$"%VaporFrascoAberto".visible = false
	get_tree().call_group('Botoes', 'destravar')		
	#$Sprites/SpriteFrasco.visible = false		
	Globais.Sequencia_Acao[nome_frasco].append('Tampou com Rolha')
	$Destampar.visible = true
	$Tampar.visible = false

func Cisne():
	$Sprites/SpriteFrasco.visible = false
	$Sprites/SpriteFrascoCisne.visible = true
	$Popup.visible = false
	get_tree().call_group('Botoes', 'destravar')
	Estado_Atual.tampado = 'Cisne'
	Globais.Sequencia_Acao[nome_frasco].append('Tampou com Cisne')
	$Quebrar.visible = true
	$Tampar.visible = false

func _on_animation_finished(_anim_name: String) -> void:
	get_tree().call_group('Botoes', 'destravar')


func RemoverFrasco():
	var instancia_adicionar = adicionar_frasco.instance()
	instancia_adicionar.position = self.position
	instancia_adicionar.nome_frasco = self.nome_frasco
	self.get_parent().add_child(instancia_adicionar)
	Globais.Sequencia_Acao.erase(nome_frasco)
	queue_free()
	


func Destampar():
	Estado_Atual.tampado = 'destampado'
	$Sprites/Rolha.visible = false
	$"%VaporFrascoAberto".visible = true
	Globais.Sequencia_Acao[nome_frasco].append('Destampou')
	$Destampar.visible = false
	$Tampar.visible = true
	if Estado_Atual.contaminado != 'contaminado':
		Estado_Atual.contaminado = 'pré contaminado'
	

func Quebrar():
	Estado_Atual.tampado = 'quebrado'
	$"%VaporFrascoAberto".visible = true
	Globais.Sequencia_Acao[nome_frasco].append('Quebrou')
	$Quebrar.visible = false
	$Sprites/SpriteFrascoQuebrado.visible = true
	$Sprites/SpriteFrascoCisne.visible = false
	if Estado_Atual.contaminado != 'contaminado':
		Estado_Atual.contaminado = 'pré contaminado'
