extends Label

func _ready() -> void:
	if get_node('../..').cenario == 'Redi':
		$VBox.get_node("Conclusao1").queue_free()
		$VBox.get_node("Conclusao2").queue_free()
		$VBox.get_node("Conclusao3").queue_free()
		$VBox.get_node("Conclusao7").queue_free()
		$VBox.get_node("Conclusao8").queue_free()

var logicaParaFrases = {
	"Conclusao1": "1f[^p]*2", #Frasco fervido fica descontaminado
	"Conclusao2": "r[^d]*2+p+2", #Frasco permanece descontaminado se estiver tampado
	"Conclusao3": "2+p+1", #Frasco destampado contamina com o tempo
	"Conclusao7": "c[^q]*2+p+2", #Frasco permanece descontaminado se estiver com cisne
	"Conclusao8": "2.*q2*p+1", #Frasco quebrado contamina com o tempo
	"Conclusao4": "5p3", #Moscas aparecem na carne quando frasco fica aberto
	"Conclusao5": "5p4", #Com a gaze, moscas não aparecem na carne
	"Conclusao6": "p5" #Com a rolha, moscas não são avistadas
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
	
