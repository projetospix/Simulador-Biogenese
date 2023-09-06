extends Node2D


func _ready():
	$Selecione.visible = false
	$"Frasco 1".visible = false
	$"Frasco 2".visible = false
	$"Frasco 3".visible = false

func ObservarFrasco():
	# NÃO PRECISA SELECIONAR O FRASCO SE SÓ HOUVER UM FRASCO, NÃO É MESMO?
	if Globais.Sequencia_Acao.size() == 1:
		for nome_frasco in Globais.Sequencia_Acao:
			print(Globais.Estado[nome_frasco])
	else:	
		# TODO: CONFERIR SE ESTÁ CONTAMINADO APÓS APERTAR O BOTÃO
		$Selecione.visible = true
		if Globais.Sequencia_Acao.has("Frasco 1"):
			$"Frasco 1".visible = true
		if Globais.Sequencia_Acao.has("Frasco 2"):
			$"Frasco 2".visible = true
		if Globais.Sequencia_Acao.has("Frasco 3"):
			$"Frasco 3".visible = true

func _process(delta):
	if Globais.Sequencia_Acao.empty():
		$"Botao Micro".visible = false
	else:
		$"Botao Micro".visible = true
