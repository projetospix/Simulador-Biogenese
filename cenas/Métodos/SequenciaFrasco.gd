extends HBoxContainer

export var frasco = "Frasco 1"

func EscreverMetodo(nome_frasco):
	if nome_frasco == frasco:
		print (Globais.Sequencia_Acao[frasco][-1])
