extends Sprite


func travar():
	var tween := create_tween()
# warning-ignore:return_value_discarded
	tween.tween_property(self, "modulate", Color.transparent, 0.3)

func destravar():
	var tween := create_tween()	
# warning-ignore:return_value_discarded
	tween.tween_property(self, "modulate", Color.white, 0.7)
