extends Button


func Adiantar_Tempo():
	get_tree().call_group('Frascos', 'Passar_Tempo')
