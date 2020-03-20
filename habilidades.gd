extends Area2D

signal golpe
var estado=["duplicar","velocidad"]
var pa

func _ready():
	randomize()
	pa=estado[randi()%estado.size()]
	$AnimatedSprite.animation=pa

func _on_Area2D_body_entered(body):
	if body.name=="pelota":
		emit_signal("golpe")
		queue_free()
		#hide()
		

func tipoObjeto():
	return pa
