extends Node2D

export var nome_frasco = 'Frasco'
var frasco = preload("res://cenas/Frasco.tscn")

func AdicionarFrasco():
	var instancia_frasco = frasco.instance()
	instancia_frasco.position = self.position
	instancia_frasco.nome_frasco = self.nome_frasco
	self.get_parent().add_child(instancia_frasco)
	queue_free()
