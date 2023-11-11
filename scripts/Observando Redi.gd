extends Node2D

var direcao:Vector2 = Vector2.ZERO
var intensidade:float = 0
onready var alvo = global_position
export var speed:int = 800


func _physics_process(delta: float) -> void:
	alvo = get_global_mouse_position()
	direcao = $lupa.position.direction_to(alvo)
	intensidade = $lupa.position.distance_to(alvo)
	if intensidade > 0.1:
		$lupa.move_and_slide(direcao*intensidade*speed/100)

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel") or Input.is_action_pressed("clique_mouse"):
		queue_free()
