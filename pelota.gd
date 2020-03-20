extends KinematicBody2D

var posInicial
var x=1
var y=0
var velocidad=200
var velOriginal=200
var sw=false
var multi=1

signal punto

export (PackedScene) var ilusion

func _physics_process(delta):
	var posicion=Vector2()
	posicion+=Vector2(x,y)
	move_and_slide(posicion*velocidad*multi,Vector2(0,-1))
	if is_on_wall():
		cambiarDirX()
		velocidad+=velocidad*0.3
		velocidad=clamp(velocidad,0,850)
		$AudioStreamPlayer.play()
		
	if is_on_ceiling() or is_on_floor():
		camDirY()
		$AudioStreamPlayer.play()
	

func cambiarDirX():
	var dir=rand_range(3*PI/4,5*PI/4)
	x=cos(dir)
	y=sin(dir)
	if sw:
		x=-1*x
	sw=!sw
	

func getPosicion():
	return position

func aumentarVelocidad(var ve):
	multi=ve

func camDirY():
	y=-1*y

func _ready():
	posInicial=position
	randomize()
	

func reiniciar(var xi):
	velocidad=velOriginal
	sw=false
	x=xi
	y=0
	position=posInicial
	multi=1
