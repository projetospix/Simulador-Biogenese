extends Node2D

func _ready():
	$"%TextoHipotese".percent_visible = 0.0
	TextoAcessivel(MenuAcessibilidade.texto_acessivel)


func AtualizaHipotese(texto):
	$"%TextoHipotese".text = texto
	var tween = create_tween()
	tween.tween_property($"%TextoHipotese", "percent_visible", 1.0, 0.5)

func TextoAcessivel(b):
	if b:
		$Control.rect_position = Vector2(-74,-6)
		$Control.rect_size = Vector2(403,490)
		$"%VBox".rect_position = Vector2(-6, 30)
	else:
		$Control.rect_position = Vector2(-2,-6)
		$Control.rect_size = Vector2(331,490)
		$"%VBox".rect_position = Vector2(9, 30)
