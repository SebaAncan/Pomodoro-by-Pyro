extends Node2D
@onready var temporizador = $Timer
@onready var timerset = $timersets
var total
func _ready() -> void:
	optener_sacro_tiempo()

func optener_sacro_tiempo():
	var horas = timerset.fixnumero(timerset.horero.text)
	var minutos = timerset.fixnumero(timerset.minutero.text)
	var segundos = timerset.fixnumero(timerset.secondero.text)
	var minuto_descanso = timerset.fixnumero(timerset.minuto_descanso.text)
	var minuto_des = timerset.fixnumero(timerset.minuto_estudio)
	print(horas)
	print(minutos)
	print(segundos)
	total = horas * 3600 + minutos * 60 + segundos
	temporizador.tempo.wait_time = total
	return total
	


func _on_inicio_pressed():
	optener_sacro_tiempo()
	print(total)
	temporizador.tempo.start()
