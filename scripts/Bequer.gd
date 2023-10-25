extends Node2D

export var nome_frasco = 'Bequer'
var adicionar_frasco = load("res://cenas/AdicionarFrasco.tscn")

func _ready():
	$NovoFX.emitting = true
	$Etiqueta.text = nome_frasco
	Globais.Sequencia_Acao[nome_frasco] = []
	Globais.Microscopio[nome_frasco] = []
	Globais.Estado[nome_frasco] = false

func RemoverFrasco():
	var instancia_adicionar = adicionar_frasco.instance()
	instancia_adicionar.position = self.position
	instancia_adicionar.nome_frasco = self.nome_frasco
	instancia_adicionar.caminhoDaCena = "res://cenas/Bequer.tscn"
	self.get_parent().add_child(instancia_adicionar)
	Globais.Sequencia_Acao.erase(nome_frasco)
	Globais.Microscopio.erase(nome_frasco)
	#get_tree().call_group('MetodosNoCaderno', 'LimpaIconesFrasco', nome_frasco)
	#get_tree().call_group('ResultadosNoCaderno', 'LimpaIconesFrasco', nome_frasco)	
	queue_free()
	
