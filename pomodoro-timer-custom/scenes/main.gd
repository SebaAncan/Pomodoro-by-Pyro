extends Node2D
@onready var temporizador = $Timer
@onready var timerset = $timersets

func _ready() -> void:
	optener_sacro_tiempo()

func optener_sacro_tiempo():
	var horas = timerset.fixnumero(timerset.horero.text)
	var minutos = timerset.fixnumero(timerset.minutero.text)
	var segundos = timerset.fixnumero(timerset.secondero.text)
	print(horas)
	print(minutos)
	print(segundos)
	var total = horas * 3600 + minutos * 60 + segundos
	temporizador.tempo.wait_time = total
	return total
	


func _on_inicio_pressed():
	temporizador.tempo.start()
