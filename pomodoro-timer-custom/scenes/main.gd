extends Node2D
@onready var temporizador = $Timer
@onready var timerset = $timersets
var total = 0
func _ready() -> void:
	optener_sacro_tiempo()

func optener_sacro_tiempo():
	var horas = timerset.fixnumero(timerset.horero.text)
	var minutos = timerset.fixnumero(timerset.minutero.text)
	var segundos = timerset.fixnumero(timerset.secondero.text)
	
	total = horas * 3600 + minutos * 60 + segundos
	temporizador.tempo.wait_time = total
	return total
	

func fix_time():
	return ((int(timerset.minuto_estudio.text)) * 60)
	
func fix_tiempo_estudio() -> float:
	return float(timerset.fixnumero(timerset.minuto_estudio.text) * 60)

func fix_tiempo_descanso() -> float:
	return float(timerset.fixnumero(timerset.minuto_descanso.text) * 60)

func _on_inicio_pressed() -> void:
	optener_sacro_tiempo()
	temporizador.tiempo_aux = float(total)
	temporizador.tiempo_estudio = fix_tiempo_estudio()
	temporizador.tiempo_descanso = fix_tiempo_descanso()
	if !cambio:
		temporizador.modo_actual = temporizador.modo.TOTAL
		temporizador.tempo.wait_time = temporizador.tiempo_aux
	else:
		temporizador.modo_actual = temporizador.modo.ESTUDIO
		temporizador.tempo.wait_time = temporizador.tiempo_estudio
	temporizador.iniciar()
	#funciona carajo
var cambio:bool = true
func _on_check_button_pressed() -> void:
	cambio = !cambio
	
