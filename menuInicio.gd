extends Node2D

signal iniciar
var player1
var player2

func _ready():
	pass # Replace with function body.

func _on_Button_pressed():
	player1=$TextEdit.text
	player2=$TextEdit2.text
	emit_signal("iniciar")

func mostrarGanador(var cad):
	$texGanador.text=cad
	$titulo.text="GANADOR:"
	$Label.hide()
	$Label2.hide()
	$TextEdit.hide()
	$TextEdit2.hide()
	$Button.hide()
	$Label3.hide()
	$Label4.hide()
	$Timer.start(3)

func mostrarMenu():
	$texGanador.text=""
	$titulo.text="PING PONG"
	$Label.show()
	$Label2.show()
	$TextEdit.show()
	$TextEdit2.show()
	$Button.show()
	$Label3.show()
	$Label4.show()

func _on_Timer_timeout():
	mostrarMenu()
