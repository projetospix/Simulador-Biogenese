extends Control



func Adiantar_Tempo():
	get_tree().call_group('Botoes', 'travar')
	get_tree().call_group('Frascos', 'Passar_Tempo')
	$AnimationPlayer.play("Passagem_Tempo")


func Terminou_Animacao(_anim_name):
	get_tree().call_group('Botoes', 'destravar')
