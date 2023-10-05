extends HBoxContainer

export var frasco = "Frasco 1"

var metodo_ferver = preload("res://cenas/Métodos/MétodoFerver.tscn")
var metodo_t_rolha = preload("res://cenas/Métodos/MétodoTampouComRolha.tscn")
var metodo_t_cisne = preload("res://cenas/Métodos/MétodoTampouComCisne.tscn")
var metodo_destampou = preload("res://cenas/Métodos/MétodoDestampou.tscn")
var metodo_quebrou = preload("res://cenas/Métodos/MétodoQuebrou.tscn")
var metodo_passou_o_tempo= preload("res://cenas/Métodos/MétodoPassouOTempo.tscn")
var metodo_contaminado= preload("res://cenas/Métodos/MétodoContaminado.tscn")
var metodo_descontaminado = preload("res://cenas/Métodos/MétodoDescontaminado.tscn")

func _ready():
	$"%Label".text = frasco
	$"%Label".percent_visible = 0.0


func EscreverMetodo(nome_frasco):
	if nome_frasco == frasco and len(Globais.Sequencia_Acao[frasco]) < 9:
		var instancia = null
		match Globais.Sequencia_Acao[frasco][-1]:
			"f":
				instancia = metodo_ferver.instance()
				$Icones.add_child(instancia)
			"r":
				instancia = metodo_t_rolha.instance()
				$Icones.add_child(instancia)
			"c":
				instancia = metodo_t_cisne.instance()
				$Icones.add_child(instancia)
			"d":
				instancia = metodo_destampou.instance()
				$Icones.add_child(instancia)
			"q":
				instancia = metodo_quebrou.instance()
				$Icones.add_child(instancia)
			"p":
				instancia = metodo_passou_o_tempo.instance()
				$Icones.add_child(instancia)
			"1":
				instancia = metodo_contaminado.instance()
				$Icones.add_child(instancia)
			"2":
				instancia = metodo_descontaminado.instance()
				$Icones.add_child(instancia)	
		var tween = create_tween()
		tween.tween_property(instancia, "modulate", Color.white, 0.3).set_delay(0.2)

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
		
