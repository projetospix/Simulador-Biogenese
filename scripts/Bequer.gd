extends Node2D

export var nome_frasco = 'Bequer'
var adicionar_frasco = load("res://cenas/AdicionarFrasco.tscn")

export var Estado_Atual := 'destampado'

export var tutorial := false


func _ready():
	$NovoFX.emitting = true
	$Etiqueta.text = nome_frasco
	Globais.Sequencia_Acao[nome_frasco] = []
	Globais.Microscopio[nome_frasco] = []
	Globais.Estado[nome_frasco] = 5
	$"%Bequer".visible = true
	$"%Bequer Gaze".visible = false
	$"%Bequer Rolha".visible = false
	$Destampar.visible = false
	$"Tampar Gaze".visible = true
	if not tutorial:
		$"Tampar Rolha".visible = true
	get_tree().call_group('MetodosNoCaderno', 'AparecerFrasco', nome_frasco)
	Globais.Tampas[nome_frasco] = Estado_Atual



func Passar_Tempo(): 
	if Estado_Atual == 'destampado' :
		Globais.Estado[nome_frasco] = 3 #3 seria mosca na carne
	if Estado_Atual == 'Gaze' and Globais.Estado[nome_frasco] != 3:
		Globais.Estado[nome_frasco] = 4 #4 seria mosca na gaze
	if Estado_Atual == 'Rolha' and Globais.Estado[nome_frasco] != 3:
		Globais.Estado[nome_frasco] = 5 #5 = sem mosca
	Globais.Sequencia_Acao[nome_frasco].append('p')
	get_tree().call_group('MetodosNoCaderno', 'EscreverMetodo', nome_frasco)



func RemoverFrasco():
	var instancia_adicionar = adicionar_frasco.instance()
	instancia_adicionar.position = self.position
	instancia_adicionar.nome_frasco = self.nome_frasco
	instancia_adicionar.caminhoDaCena = "res://cenas/Bequer.tscn"
	self.get_parent().add_child(instancia_adicionar)
	Globais.Sequencia_Acao.erase(nome_frasco)
	Globais.Microscopio.erase(nome_frasco)
	get_tree().call_group('MetodosNoCaderno', 'LimpaIconesFrasco', nome_frasco)
	get_tree().call_group('ResultadosNoCaderno', 'LimpaIconesFrasco', nome_frasco)	
	queue_free()
	


func TamparComGaze():
	$"%Bequer".visible = false
	$"%Bequer Gaze".visible = true
	$"%Bequer Rolha".visible = false
	$"Tampar Gaze".visible = false
	$"Tampar Rolha".visible = false
	if not tutorial:
		$Destampar.visible = true
	Estado_Atual = 'Gaze'
	Globais.Sequencia_Acao[nome_frasco].append('G')
	get_tree().call_group('MetodosNoCaderno', 'EscreverMetodo', nome_frasco)
	Globais.Tampas[nome_frasco] = Estado_Atual
	


func TamparComRolha():
	$"%Bequer".visible = false
	$"%Bequer Gaze".visible = false
	$"%Bequer Rolha".visible = true
	$"Tampar Gaze".visible = false
	$"Tampar Rolha".visible = false
	if not tutorial:
		$Destampar.visible = true
	Estado_Atual = 'Rolha'
	Globais.Sequencia_Acao[nome_frasco].append('R')
	get_tree().call_group('MetodosNoCaderno', 'EscreverMetodo', nome_frasco)
	Globais.Tampas[nome_frasco] = Estado_Atual
	


func Destampar():
	$"%Bequer".visible = true
	$"%Bequer Gaze".visible = false
	$"%Bequer Rolha".visible = false
	$"Tampar Gaze".visible = true
	$"Tampar Rolha".visible = true
	$Destampar.visible = false
	Estado_Atual = 'destampado'
	Globais.Sequencia_Acao[nome_frasco].append('D')
	get_tree().call_group('MetodosNoCaderno', 'EscreverMetodo', nome_frasco)
	Globais.Tampas[nome_frasco] = Estado_Atual
	


func _on_Tampar_Rolha_button_up():
	pass # Replace with function body.
