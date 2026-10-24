extends Node
@export var timer: Node
@onready var label: Label = $numeritos
@export var tiempo_en_segundos: float
@export var tiempo_en_minutos:float
@export var tiempo_en_horas:float
var tiempo_aux:float = 0
@export var tempo: Timer

func Tiempo_existir():
	var tiempo_restante = tempo.time_left
	var hora = floor(tiempo_restante/3600)
	var minuto = floor((tiempo_restante / 3600))
	var segundo = int(tiempo_restante)%60
	return [hora,minuto,segundo]
	
	
func _process(delta: float) -> void:
	if (tempo.time_left != 0): label.text = "%02d:%02d:%02d" % Tiempo_existir()
	
	
func convertir():
	var hora_converted = tiempo_en_horas * 3600
	var minuto_converted = tiempo_en_minutos*60
	
	var tiempo_converted = hora_converted + minuto_converted + tiempo_en_segundos
	return tiempo_converted
	
