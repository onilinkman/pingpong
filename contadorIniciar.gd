extends Node2D

var sw=true
signal NodoEliminado

func _ready():
	$Timer.start(3)

func _process(delta):
	if sw:
		var tim=$Timer.time_left
		$Label.text=str(int(tim+1))
	else:
		modulate.a -= 0.5 * delta	#VUELVE TRANSPARENTE TODA LA ESCENA
		emit_signal("NodoEliminado")
		if modulate.a<0:
			queue_free()
			

func _on_Timer_timeout():
	sw=false
	$Label.text="COMIENCEN"
