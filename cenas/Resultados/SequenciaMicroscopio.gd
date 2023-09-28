extends HBoxContainer

export var frasco = "Frasco 1"

var metodo_microscopio= preload("res://cenas/Métodos/MetodoMicroscopio.tscn")
var resultado = preload("res://cenas/Resultados/Resultado.tscn")

func InstanciaResultado(nome_frasco):
	if nome_frasco == frasco:
		var instancia = resultado.instance()
		$Icones.add_child(instancia)

func _ready():
	$"%Label".text = frasco
	#$"%Label".percent_visible = 0.0


func LimpaIconesFrasco(nome_frasco):
	if nome_frasco == frasco:
		for icone in $Icones.get_children():
			var tween = create_tween()
			tween.tween_property(icone, "modulate", Color.transparent, 0.3)
			tween.tween_callback(icone, "queue_free")
		var tween = create_tween()
		tween.tween_property($"%Label","percent_visible",0.0,0.3).set_delay(0.4)

func AparecerFrasco(nome_frasco):
	if nome_frasco == frasco:		
		var tween = create_tween()		
		tween.tween_property($"%Label","percent_visible",1.0,0.3).set_delay(0.3)
		

