extends Node2D

func _ready():
	$"%TextoHipotese".percent_visible = 0.0


func AtualizaHipotese(texto):
	$"%TextoHipotese".text = texto
	var tween = create_tween()
	tween.tween_property($"%TextoHipotese", "percent_visible", 1.0, 0.5)
