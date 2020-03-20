extends Node2D

var point1=0
var point2=0
var tiemp
var tipoObjeto
export (PackedScene) var ilusion
export (PackedScene) var items
export (PackedScene) var contador

func _ready():
	randomize()
	OS.center_window()
	juegoOff()

func _input(event):
	if Input.is_action_just_pressed("mi_pausa"):
		if get_tree().paused==false:
			get_tree().paused=true
		else:
			get_tree().paused=false


func juegoOff():
	point1=0
	point2=0
	$Label.text=str(point1)
	$Label2.text=str(point2)
	$barra.hide()
	$barra2.hide()
	$pelota.aumentarVelocidad(0)
	$Label.hide()
	$Label2.hide()
	$pelota.hide()
	$aparecerObjeto.stop()

func iniciarPartida():
	$barra.show()
	$barra2.show()
	$pelota.aumentarVelocidad(1)
	$Label.show()
	$Label2.show()
	tiempoObjeto()
	$aparecerObjeto.start(tiemp)
	$pelota.show()


func tiempoObjeto():
	tiemp=rand_range(20,40)


func _on_pared2_body_entered(body):
	if body.name=="pelota":
		body.reiniciar(-1)
		point1+=1
		$Label.text=str(point1)
		$Label2.text=str(point2)
		if point1>9:
			juegoOff()
			$Node2D.show()
			$Node2D.mostrarGanador($Node2D.player1)
	elif body.name=="barra" or body.name=="barra2":
		body.reiniciarPosicion()


func _on_pared_body_entered(body):
	if body.name=="pelota":
		body.reiniciar(1)
		point2+=1
		$Label.text=str(point1)
		$Label2.text=str(point2)
		if point2>9:
			juegoOff()
			$Node2D.show()
			$Node2D.mostrarGanador($Node2D.player2)
	elif body.name=="barra" or body.name=="barra2":
		body.reiniciarPosicion()
	

func instanciarPelIlu():
	var pel=ilusion.instance()
	
	pel.setValores($pelota.position,$pelota.x,$pelota.y,$pelota.velocidad)
	add_child(pel)
	
	$pelota.camDirY()
	

func _on_centro_body_entered(body):
	if body.name=="barra" or body.name=="barra2":
		body.reiniciarPosicion()


func _on_aparecerObjeto_timeout():
	
	$Path2D/PathFollow2D.set_offset(randi())
	var obje=items.instance()
	obje.connect("golpe",self,"_iniciarContador")
	
	add_child(obje)
	tipoObjeto=obje.tipoObjeto()
	obje.position=$Path2D/PathFollow2D.position
	

func _iniciarContador():
	if(tipoObjeto=="velocidad"):
		$pelota.aumentarVelocidad(2)
		
	elif(tipoObjeto=="duplicar"):
		instanciarPelIlu()
	
	tiempoObjeto()
	$aparecerObjeto.start(tiemp)


func _on_Node2D_iniciar():
	var ini=contador.instance()
	ini.connect("NodoEliminado",self,"iniciarPartida")
	add_child(ini)
	$Node2D.hide()
