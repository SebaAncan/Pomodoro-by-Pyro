extends Node

@onready var label: Label = $numeritos
@export var tiempo_en_segundos: float
@export var tiempo_en_minutos:float
@export var tiempo_en_horas:float
var tiempo_aux:float = 0
var mostrar_total:bool = true
var tiempo_aux1 = int(tiempo_aux)
var tiempo_descanso
@onready var tempo: Timer = $tiempo

func Tiempo_existir() -> Array:
	var tiempo_restante = int(tempo.time_left)
	var hora = floor(tiempo_restante / 3600)
	var minuto = (tiempo_restante % 3600) / 60
	var segundo = tiempo_restante % 60
	return [hora, minuto, segundo]
	
func estudio() -> Array:
	var transcurrido = tempo.wait_time - tempo.time_left
	var tiempo_restante_estudio = max(0, tiempo_aux - transcurrido)
	var hora = floor(tiempo_restante_estudio / 3600)
	var minuto = (int(tiempo_restante_estudio) % 3600) / 60
	var segundo = int(tiempo_restante_estudio) % 60
	return [hora, minuto, segundo]

func descanso() -> Array: #copie la misma de nuevo xd
	var transcurrido = tempo.wait_time - tempo.time_left
	var tiempo_restante_estudio = max(0, tiempo_aux - transcurrido)
	var hora = floor(tiempo_restante_estudio / 3600)
	var minuto = (int(tiempo_restante_estudio) % 3600) / 60
	var segundo = int(tiempo_restante_estudio) % 60
	return [hora, minuto, segundo]

func _process(delta: float) -> void:
	if (mostrar_total):
		if (tempo.time_left != 0): label.text = "%02d:%02d:%02d" % Tiempo_existir()
	else:
		if (tempo.time_left != 0): label.text = "%02d:%02d:%02d" % estudio()
	
func convertir():
	var hora_converted = tiempo_en_horas * 3600
	var minuto_converted = tiempo_en_minutos*60
	
	var tiempo_converted = hora_converted + minuto_converted + tiempo_en_segundos
	return tiempo_converted
	
