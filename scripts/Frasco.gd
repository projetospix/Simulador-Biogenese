extends Node2D

var texto1 = ''
var texto2 = ''
export var nome_frasco = 'Frasco'

var Estado_Atual = {
	'tampado': false,
	'contaminado': 'contaminado'
}

func _ready():
	Globais.Sequencia_Acao[nome_frasco] = []
	$"%Nome do frasco".text = nome_frasco

# warning-ignore:unused_argument
func _process(delta):
	if Estado_Atual.tampado == false:
		texto1 = 'destampado'
	else:
		texto1 = 'tampado'

	$"%Estado Atual".text = texto1 + ' e ' + Estado_Atual.contaminado


func Ferver():
	Estado_Atual.contaminado = 'estéril'
	Globais.Sequencia_Acao[nome_frasco].append('Ferveu')


func Passar_Tempo():
	if Estado_Atual.contaminado == 'pré contaminado':
		Estado_Atual.contaminado = 'contaminado'
	Globais.Sequencia_Acao[nome_frasco].append('Passou o Tempo')


func Tampar_Destampar(button_pressed):
	if button_pressed:
		Estado_Atual.tampado = true
		Globais.Sequencia_Acao[nome_frasco].append('Tampou')
	else:
		Estado_Atual.tampado = false
		Globais.Sequencia_Acao[nome_frasco].append('Destampou')
		if Estado_Atual.contaminado != 'contaminado':
			Estado_Atual.contaminado = 'pré contaminado'
