extends Node2D

var direcao:Vector2 = Vector2.ZERO
var intensidade:float = 0
var speed:int = 600
onready var alvo = global_position

#Variáveis para definir qual configuração carregar
export var tampa := 'destampado'
export var moscaTampa := false
export var moscaCarne := false

export var frasco = 'Frasco 1'

func _ready() -> void:
	$Frasco/Base.visible = true
	$Frasco2/Base.visible = true
	$MoscaGaze.visible = moscaTampa
	$MoscaCarne.visible = moscaCarne
	$Frasco/Aberto.visible = false
	$Frasco/Gaze.visible = false
	$Frasco/Rolha.visible = false
	$Frasco2/Aberto.visible = false
	$Frasco2/Gaze.visible = false
	$Frasco2/Rolha.visible = false
	$Label.percent_visible = 0.0
	$Label2.percent_visible = 0.0
	match tampa:
		'Rolha':
			 $Frasco/Rolha.visible = true
			 $Frasco2/Rolha.visible = true
		'Gaze':
			$Frasco/Gaze.visible = true
			$Frasco2/Gaze.visible = true
		_:
			$Frasco/Aberto.visible = true
			$Frasco2/Aberto.visible = true

func _physics_process(_delta: float) -> void:
	alvo = get_global_mouse_position()
	direcao = $lupa.position.direction_to(alvo)
	intensidade = $lupa.position.distance_to(alvo)
	if intensidade > 0.1:
		$lupa.move_and_slide(direcao*intensidade*speed/100)


func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel") or Input.is_action_pressed("clique_mouse"):
		get_tree().call_group('MetodosNoCaderno', 'EscreverMetodo', frasco)
		get_tree().call_group('ResultadosNoCaderno', 'InstanciaResultado', frasco)
		queue_free()


func _on_DetectarMoscaGaze(_area: Area2D) -> void:
	if moscaTampa:
		$Label.text = 'Tem moscas e larvas na gaze!'
	else:
		$Label.text = 'Não há moscas sobre o frasco'		
	var tween = create_tween()
	tween.tween_property($Label,"percent_visible",1.0, 0.5).set_delay(0.2)
	
func _on_DetectarMoscaCarne(_area: Area2D) -> void:
	if moscaCarne:
		$Label2.text = 'Tem moscas e larvas na carne!'
	else:
		$Label2.text = 'Não há moscas na carne'		
	var tween = create_tween()
	tween.tween_property($Label2,"percent_visible",1.0, 0.5).set_delay(0.2)
