extends Node2D

export var nome_frasco = 'Frasco'

var Estado_Atual = {
	'tampado': false,
	'contaminado': 'contaminado'
}

func _ready():
	Globais.Sequencia_Acao[nome_frasco] = []
	$SpriteFrasco/Rolha.visible = false
	$"%Bolhas".emitting = false
	$"%Fogo".emitting = false


func Ferver():
	get_tree().call_group('Botoes', 'travar')
	$AnimationPlayer.play("ferver")
	Estado_Atual.contaminado = 'estéril'
	Globais.Sequencia_Acao[nome_frasco].append('Ferveu')


func Passar_Tempo():
	if Estado_Atual.contaminado == 'pré contaminado':
		Estado_Atual.contaminado = 'contaminado'
	if Estado_Atual.contaminado == 'estéril' and Estado_Atual.tampado == false:
		Estado_Atual.contaminado = 'contaminado'
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


func _on_animation_finished(anim_name: String) -> void:
	get_tree().call_group('Botoes', 'destravar') # Replace with function body.
