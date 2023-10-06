extends Node2D

func _ready() -> void:
	resetar()
	
func resetar():
	self.visible = false
	modulate = Color.white
	$Label.modulate = Color.transparent
	$dim.modulate = Color.transparent
	$laranja.modulate = Color.transparent
	$laranja/bacterias.visible = false
	$Label.rect_position.y -= 60
	$Label.text = "Não tem seres vivos"
	$laranja/bacterias.modulate = Color.transparent

func VisaoMic(frasco) -> void:
	var contaminado = Globais.Estado[frasco]
	if contaminado:
		$Label.text = "Tem seres vivos!"
		$laranja/bacterias.visible = true
	visible = true
	var tween = create_tween()
	tween.tween_property($dim, "modulate", Color.white, 0.2)
	tween.parallel().tween_property($laranja, "modulate", Color.white, 0.8)
	tween.parallel().tween_property($laranja/bacterias, "modulate", Color.white, 1)
	tween.tween_property($Label,"modulate",Color.white, 0.5).set_delay(0.8)
	tween.parallel().tween_property($Label, "rect_position:y", $Label.rect_position.y + 60,1.5).set_trans(Tween.TRANS_BACK)
	tween.parallel().tween_property($Label, "rect_scale", Vector2(1.2,1.2),1.5).set_trans(Tween.TRANS_BACK)
	
	tween.tween_property(self, "modulate", Color.transparent, 0.5).set_delay(1.7)
	tween.parallel().tween_property($laranja/bacterias, "modulate", Color.transparent, 0.3).set_delay(1.7)
	tween.tween_callback(self, "resetar")
	tween.tween_callback(self, "escreverCaderno",[frasco])
	
	
func escreverCaderno(frasco):
	get_tree().call_group('MetodosNoCaderno', 'EscreverMetodo', frasco)
	get_tree().call_group('ResultadosNoCaderno', 'InstanciaResultado', frasco)
