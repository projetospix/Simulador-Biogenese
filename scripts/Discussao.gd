extends Label

var logicaParaFrases = {
	"Conclusao1": "1f[^p]*2", #Frasco fervido fica descontaminado
	"Conclusao2": "r[^d]*2+p+2", #Frasco permanece descontaminado se estiver tampado
	"Conclusao3": "2+p+1" #Frasco destampado contamina com o tempo
	
}

var conclusoesQueJaForam = []

var regex = RegEx.new()

func AcharFrase():
	for conclusao in logicaParaFrases:
		if not conclusao in conclusoesQueJaForam:
			regex.compile(logicaParaFrases[conclusao])
			for frasco in Globais.Sequencia_Acao:
				var termoBusca = PoolStringArray(Globais.Sequencia_Acao[frasco]).join("")
				var resultadoBusca = regex.search(termoBusca)
				if resultadoBusca:
					conclusoesQueJaForam.append(conclusao)
					AnimarFrase(conclusao)

func AnimarFrase(conclusao):
	var tween = create_tween()
	var node = $VBox.get_node(conclusao)
	tween.tween_property(node, "percent_visible", 1.0, 0.5).set_delay(1)
	
