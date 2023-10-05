extends Label

var logicaParaFrases = {
	"Conclusao1": "1f[^p]*2",
	"Conclusao2": "rp*f+2p+2"
}

var regex = RegEx.new()

func AcharFrase():
	for conclusao in logicaParaFrases:
		regex.compile(logicaParaFrases[conclusao])
		for frasco in Globais.Sequencia_Acao:
			var termoBusca = PoolStringArray(Globais.Sequencia_Acao[frasco]).join("")
			var resultadoBusca = regex.search(termoBusca)
			if resultadoBusca:
				AnimarFrase(conclusao)

func AnimarFrase(conclusao):
	var tween = create_tween()
	var node = $VBox.get_node(conclusao)
	tween.tween_property(node, "percent_visible", 1, 0.5)
	
