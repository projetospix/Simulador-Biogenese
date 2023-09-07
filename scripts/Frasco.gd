extends Node2D

export var nome_frasco = 'Frasco'

var Estado_Atual = {
	'tampado': false,
	'contaminado': 'contaminado'
}

var adicionar_frasco = load("res://cenas/AdicionarFrasco.tscn")

func _ready():
	Globais.Sequencia_Acao[nome_frasco] = []
	Globais.Estado[nome_frasco] = true
	$SpriteFrasco/Rolha.visible = false
	$"%Bolhas".emitting = false
	$"%Fogo".emitting = false
	$Etiqueta.text = nome_frasco


func Ferver():
	get_tree().call_group('Botoes', 'travar')
	$AnimationPlayer.play("ferver")
	Estado_Atual.contaminado = 'estéril'
	Globais.Sequencia_Acao[nome_frasco].append('Ferveu')
	Globais.Estado[nome_frasco] = false


func Passar_Tempo():
	if Estado_Atual.contaminado == 'pré contaminado':
		Estado_Atual.contaminado = 'contaminado'
		Globais.Estado[nome_frasco] = true
	if Estado_Atual.contaminado == 'estéril' and Estado_Atual.tampado == false:
		Estado_Atual.contaminado = 'contaminado'
		Globais.Estado[nome_frasco] = true
	Globais.Sequencia_Acao[nome_frasco].append('Passou o Tempo')
	


func Tampar_Destampar(button_pressed):
	if button_pressed:
		Estado_Atual.tampado = true
		$SpriteFrasco/Rolha.visible = true
		Globais.Sequencia_Acao[nome_frasco].append('Tampou')
	else:
		Estado_Atual.tampado = false
		$SpriteFrasco/Rolha.visible = false
		Globais.Sequencia_Acao[nome_frasco].append('Destampou')
		if Estado_Atual.contaminado != 'contaminado':
			Estado_Atual.contaminado = 'pré contaminado'


func _on_animation_finished(_anim_name: String) -> void:
	get_tree().call_group('Botoes', 'destravar')


func RemoverFrasco():
	var instancia_adicionar = adicionar_frasco.instance()
	instancia_adicionar.position = self.position
	self.get_parent().add_child(instancia_adicionar)
	Globais.Sequencia_Acao.erase(nome_frasco)
	queue_free()
