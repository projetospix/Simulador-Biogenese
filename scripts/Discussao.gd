extends Label

var logicaParaFrases = {
	"Conclusao1": "1f[^p]*2", #Frasco fervido fica descontaminado
	"Conclusao2": "r[^d]*2+p+2" #Frasco permanece descontaminado se estiver tampado
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
	tween.tween_property(node, "percent_visible", 1.0, 0.5).set_delay(1)
	
