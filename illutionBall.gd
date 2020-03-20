extends Area2D

var posInicial
var x=1
var y=0
var velocidad=200
var velOriginal=200
var sw=false
var posicion

func _ready():
	pass 

func _process(delta):
	posicion=Vector2()
	posicion+=Vector2(x,y)
	posicion=posicion.normalized()
	
	position+=posicion*velocidad*delta


func setValores(var pos,var x1,var y1,var vel):
	position=pos
	var dir=rand_range(3*PI/4,5*PI/4)
	x=x1
	y=y1

	velocidad=vel


func _on_illutionBall_body_entered(body):
	print(body.name)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
