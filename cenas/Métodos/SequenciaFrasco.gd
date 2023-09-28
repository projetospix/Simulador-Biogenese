extends HBoxContainer

export var frasco = "Frasco 1"

var metodo_ferver = preload("res://cenas/Métodos/MétodoFerver.tscn")
var metodo_t_rolha = preload("res://cenas/Métodos/MétodoTampouComRolha.tscn")
var metodo_t_cisne = preload("res://cenas/Métodos/MétodoTampouComCisne.tscn")
var metodo_destampou = preload("res://cenas/Métodos/MétodoDestampou.tscn")
var metodo_quebrou = preload("res://cenas/Métodos/MétodoQuebrou.tscn")
var metodo_passou_o_tempo= preload("res://cenas/Métodos/MétodoPassouOTempo.tscn")

func _ready():
	$"%Label".text = frasco
	$"%Label".percent_visible = 0.0
#	self.visible = false


func EscreverMetodo(nome_frasco):
	if nome_frasco == frasco and len(Globais.Sequencia_Acao[frasco]) < 8:
		var instancia = null
		match Globais.Sequencia_Acao[frasco][-1]:
			"Ferveu":
				instancia = metodo_ferver.instance()
				$Icones.add_child(instancia)
			"Tampou com Rolha":
				instancia = metodo_t_rolha.instance()
				$Icones.add_child(instancia)
			"Tampou com Cisne":
				instancia = metodo_t_cisne.instance()
				$Icones.add_child(instancia)
			"Destampou":
				instancia = metodo_destampou.instance()
				$Icones.add_child(instancia)
			"Quebrou":
				instancia = metodo_quebrou.instance()
				$Icones.add_child(instancia)
			"Passou o Tempo":
				instancia = metodo_passou_o_tempo.instance()
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
		tween.tween_property($"%Label","percent_visible",0.0,0.3)
		#self.visible = false

func AparecerFrasco(nome_frasco):
	if nome_frasco == frasco:		
		#self.visible = true
		var tween = create_tween()		
		tween.tween_property($"%Label","percent_visible",1.0,0.3)
		
