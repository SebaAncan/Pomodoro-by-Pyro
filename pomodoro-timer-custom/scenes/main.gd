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
	var minuto_estudio = timerset.fixnumero(timerset.minuto_estudio.text)
	print(horas)
	print(minutos)
	print(segundos)
	print(minuto_descanso)
	print(minuto_estudio)
	total = horas * 3600 + minutos * 60 + segundos
	temporizador.tempo.wait_time = total
	return total
	

func fix_time():
	return ((int(timerset.minuto_estudio.text)) * 60)
	
func _on_inicio_pressed():
	optener_sacro_tiempo()
	temporizador.tiempo_aux = fix_time()
	temporizador.mostrar_total = false
	temporizador.tempo.start()
	temporizador.tiempo_descanso = ((int(timerset.minuto_descanso.text)) * 60)
