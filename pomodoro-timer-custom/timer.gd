extends Node

@onready var label: Label = $numeritos
@export var tiempo_en_segundos: float
@export var tiempo_en_minutos:float
@export var tiempo_en_horas:float
@onready var tempo: Timer = $tiempo
var tiempo_aux:float = 0
var mostrar_total:bool = true
var tiempo_aux1 = 0.0
var tiempo_descanso = 0.0
enum modo{DESCANSO,ESTUDIO,TOTAL}
var modo_actual = modo.TOTAL
var mostrar_todito:bool = false

func Tiempo_existir() -> Array:
	var tiempo_restante = int(tempo.time_left)
	var hora = floor(tiempo_restante / 3600)
	var minuto = (tiempo_restante % 3600) / 60
	var segundo = tiempo_restante % 60
	return [hora, minuto, segundo]
	
func iniciar():
	if modo_actual == modo.ESTUDIO:
		tempo.wait_time = tiempo_aux
	elif modo_actual == modo.DESCANSO:
		tempo.wait_time = tiempo_descanso
	tempo.start()
	

		
func _on_tiempo_timeout() -> void:
	if mostrar_todito:
		modo_actual = modo.TOTAL
		return
	if modo_actual == modo.ESTUDIO:
		modo_actual = modo.DESCANSO
		tempo.wait_time = tiempo_descanso
		tempo.start()
	elif modo_actual == modo.DESCANSO:
		modo_actual = modo.ESTUDIO
		tempo.wait_time = tiempo_aux
		tempo.start()


func format_tiempo() -> Array:
	var pasado = tempo.wait_time - tempo.time_left
	var objetivo = 0.0
	if modo_actual == modo.ESTUDIO:
		objetivo = max(0, tiempo_aux - pasado)
	elif modo_actual == modo.DESCANSO:
		objetivo = max(0, tiempo_descanso -pasado)
	else:
		objetivo = float(int(tempo.time_left))
	var t_int = int(objetivo)
	var hora = floor(t_int / 3600)
	var minuto = (t_int % 3600) / 60
	var segundo = t_int % 60
	return [hora, minuto, segundo]


func _process(_delta: float) -> void:
	
	if tempo.time_left > 0:
		label.text = "%02d:%02d:%02d" % format_tiempo()
	else:
		label.text = "00:00:00"
		
