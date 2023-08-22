extends Node2D

var texto1 = ''
var texto2 = ''
export var nome_frasco = 'Frasco'

var Estado_Atual = {
	'tampado': false,
	'contaminado': true
}

func _ready():
	Globais.Sequencia_Acao[nome_frasco] = []

func _process(delta):
	if Estado_Atual.tampado == false:
		texto1 = 'destampado'
	else:
		texto1 = 'tampado'
	if Estado_Atual.contaminado == false:
		texto2 = 'estéril'
	else:
		texto2 = 'contaminado'	

	$"%Estado Atual".text = texto1 + ' e ' + texto2


func Ferver():
	Estado_Atual.contaminado = false
	Globais.Sequencia_Acao[nome_frasco].append('Ferveu')


func Passar_Tempo():
	if Estado_Atual.tampado == false:
		Estado_Atual.contaminado = true
	Globais.Sequencia_Acao[nome_frasco].append('Passou o Tempo')


func Tampar_Destampar(button_pressed):
	if button_pressed:
		Estado_Atual.tampado = true
	else:
		Estado_Atual.tampado = false
		Estado_Atual.contaminado = true
