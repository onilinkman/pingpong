extends KinematicBody2D

var velocidad=340
var posOrg

func _ready():
	posOrg=position

#Ok
func _physics_process(delta):
	var posicion=Vector2()
	var nombre=name
	var boolArriba=Input.is_action_pressed(name+"Up")
	var boolAbajo=Input.is_action_pressed(name+"Down")
	var boolPot=Input.is_action_pressed(name+"Pot")
	if boolArriba:
		posicion+=Vector2(0,-1)
	if boolAbajo:
		posicion+=Vector2(0,1)
	if boolPot:
		velocidad=340*2
	else:
		velocidad=340
	
	move_and_slide(posicion*velocidad,Vector2(0,-1))

func reiniciarPosicion():
	position=posOrg


