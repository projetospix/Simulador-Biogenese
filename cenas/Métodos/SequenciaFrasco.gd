extends HBoxContainer

export var frasco = "Frasco 1"

var metodo_ferver = preload("res://cenas/Métodos/MétodoFerver.tscn")
var metodo_t_rolha = preload("res://cenas/Métodos/MétodoTampouComRolha.tscn")
var metodo_t_cisne = preload("res://cenas/Métodos/MétodoTampouComCisne.tscn")
var metodo_destampou = preload("res://cenas/Métodos/MétodoDestampou.tscn")
var metodo_quebrou = preload("res://cenas/Métodos/MétodoQuebrou.tscn")
var metodo_passou_o_tempo= preload("res://cenas/Métodos/MétodoPassouOTempo.tscn")

func EscreverMetodo(nome_frasco):
	if nome_frasco == frasco:
		print(Globais.Sequencia_Acao[frasco][-1])
		match Globais.Sequencia_Acao[frasco][-1]:
			"Ferveu":
				var instancia_ferveu = metodo_ferver.instance()
				add_child(instancia_ferveu)
			"Tampou com Rolha":
				var instancia_t_rolha = metodo_t_rolha.instance()
				add_child(instancia_t_rolha)
			"Tampou com Cisne":
				var instancia_t_cisne = metodo_t_cisne.instance()
				add_child(instancia_t_cisne)
			"Destampou":
				var instancia_destampou = metodo_destampou.instance()
				add_child(instancia_destampou)
			"Quebrou":
				var instancia_quebrou = metodo_quebrou.instance()
				add_child(instancia_quebrou)
			"Passou o Tempo":
				var instancia_tempo = metodo_passou_o_tempo.instance()
				add_child(instancia_tempo)
