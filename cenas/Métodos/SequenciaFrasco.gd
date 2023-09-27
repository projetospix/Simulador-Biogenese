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
	self.visible = false


func EscreverMetodo(nome_frasco):
	if nome_frasco == frasco and len(Globais.Sequencia_Acao[frasco]) < 8:
		match Globais.Sequencia_Acao[frasco][-1]:
			"Ferveu":
				var instancia_ferveu = metodo_ferver.instance()
				$Icones.add_child(instancia_ferveu)
			"Tampou com Rolha":
				var instancia_t_rolha = metodo_t_rolha.instance()
				$Icones.add_child(instancia_t_rolha)
			"Tampou com Cisne":
				var instancia_t_cisne = metodo_t_cisne.instance()
				$Icones.add_child(instancia_t_cisne)
			"Destampou":
				var instancia_destampou = metodo_destampou.instance()
				$Icones.add_child(instancia_destampou)
			"Quebrou":
				var instancia_quebrou = metodo_quebrou.instance()
				$Icones.add_child(instancia_quebrou)
			"Passou o Tempo":
				var instancia_tempo = metodo_passou_o_tempo.instance()
				$Icones.add_child(instancia_tempo)

func LimpaIconesFrasco(nome_frasco):
	if nome_frasco == frasco:
		for icone in $Icones.get_children():
			icone.queue_free()
		self.visible = false
		
func AparecerFrasco(nome_frasco):
	if nome_frasco == frasco:
		self.visible = true
