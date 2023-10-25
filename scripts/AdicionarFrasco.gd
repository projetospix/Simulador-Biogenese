extends Node2D

export var nome_frasco := 'Frasco'
export var caminhoDaCena = "res://cenas/Frasco.tscn"
var frasco := load(caminhoDaCena)

func _ready():
	frasco = load(caminhoDaCena)

func AdicionarFrasco():
	var instancia_frasco = frasco.instance()
	instancia_frasco.position = self.position
	instancia_frasco.nome_frasco = self.nome_frasco
	self.get_parent().add_child(instancia_frasco)
	queue_free()


func _on_Botao_Mais_mouse_entered() -> void:
	$Gradiente.self_modulate = Color.white


func _on_Botao_Mais_mouse_exited() -> void:
	$Gradiente.self_modulate = Color(1, 1, 1, 0.8)
