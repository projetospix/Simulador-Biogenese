extends Sprite


func travar():
	var tween := create_tween()
	tween.tween_property(self, "modulate", Color.transparent, 0.3)

func destravar():
	var tween := create_tween()	
	tween.tween_property(self, "modulate", Color.white, 0.7)
