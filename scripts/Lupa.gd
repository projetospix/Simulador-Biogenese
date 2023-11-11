extends Node2D

var cenaLupa = preload("res://cenas/Observando Redi.tscn")

var observando = false #para poder dispensar mic com esc
signal VisaoMic(contaminado)

func _ready():
	$Selecione.visible = false
	$"Frasco 1".visible = false
	$"Frasco 2".visible = false
	$"Frasco 3".visible = false
	$dim.visible = false

func ObservarFrasco():
	if not observando: #evitar ação duplicada
		# NÃO PRECISA SELECIONAR O FRASCO SE SÓ HOUVER UM FRASCO, NÃO É MESMO?
		if Globais.Sequencia_Acao.size() == 1:
			for nome_frasco in Globais.Sequencia_Acao:
				MostrarResultado(nome_frasco)
		else:	
			get_tree().call_group('Botoes', 'travar')
			$dim.modulate = Color.transparent
			$dim.visible = true
			$Selecione.visible = true
			var tween = create_tween()
			tween.tween_property($Selecione,"rect_position",Vector2(246,50),0.2)
			tween.parallel().tween_property($dim,"modulate",Color.white,0.2)
			if Globais.Sequencia_Acao.has("Frasco A"):
				$"Frasco 1".rect_position.y -= 20
				$"Frasco 1".visible = true
				tween.parallel().tween_property($"Frasco 1","rect_position:y", $"Frasco 1".rect_position.y+20 ,0.2)	
			if Globais.Sequencia_Acao.has("Frasco B"):
				$"Frasco 2".rect_position.y -= 20
				$"Frasco 2".visible = true
				tween.parallel().tween_property($"Frasco 2","rect_position:y", $"Frasco 2".rect_position.y+20 ,0.2)
			if Globais.Sequencia_Acao.has("Frasco C"):
				$"Frasco 3".rect_position.y -= 20
				$"Frasco 3".visible = true
				tween.parallel().tween_property($"Frasco 3","rect_position:y", $"Frasco 3".rect_position.y+20 ,0.2)
				

func _process(_delta):
	if Globais.Sequencia_Acao.empty():
		$"Botao Micro".visible = false
		$"SpriteMicro".disabled = true
		
	else:
		$"SpriteMicro".disabled = false
		$"Botao Micro".visible = true
		

func DesistirMicro():
	get_tree().call_group('Botoes', 'destravar')
	$Selecione.visible = false
	$Selecione.rect_position.y = 42	
	$"Frasco 1".visible = false
	$"Frasco 2".visible = false
	$"Frasco 3".visible = false
	$dim.visible = false

func MostrarResultado(frasco):
	var lupa = cenaLupa.instance()
	
	lupa.tampa = Globais.Tampas[frasco]
	
	Globais.Microscopio[frasco].append(Globais.Estado[frasco])
	
	if Globais.Estado[frasco] == 3: #mosca na carne
		Globais.Sequencia_Acao[frasco].append('3')
		lupa.moscaCarne = true
	elif Globais.Estado[frasco] == 4: # mosca na gaze
		Globais.Sequencia_Acao[frasco].append('4')
		lupa.moscaTampa = true
	else: # sem mosca
		Globais.Sequencia_Acao[frasco].append('5')
		
	lupa.frasco = frasco
	add_child(lupa)
	DesistirMicro()


