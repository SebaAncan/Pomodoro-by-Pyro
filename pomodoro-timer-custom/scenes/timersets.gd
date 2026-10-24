extends Node
@export var horero: LineEdit
@export var minutero: LineEdit
@export var secondero: LineEdit
@export var timersets: Node
@onready var mas_segundo: Button = $Botones/more/mas_segundo
@onready var mas_minuto: Button = $Botones/more/mas_minuto
@onready var mas_hora: Button = $Botones/more/mas_hora
@onready var menos_minuto: Button = $Botones/minus/menos_minuto
@onready var menos_hora: Button = $Botones/minus/menos_hora
signal cambio

func _ready():
	pass

func process():
	pass

func fixnumero(texto:String):
	if(texto == "" or texto == null):
		return 0
	return int(texto)

func ajustar(line:LineEdit,cambio):
	var valor = fixnumero(line.text)
	valor += cambio
	line.text = str(valor)


func caja_get_number(input:LineEdit):
	var texto = int(input.text)
	return texto
	

func _on_mas_segundo_pressed() -> void:
	var texto = caja_get_number(secondero)
	if(texto>=0):
		ajustar(secondero,+1)
	


func _on_mas_minuto_pressed() -> void:
	var texto = caja_get_number(minutero)
	if(texto >= 0):
		ajustar(minutero,+1)


func _on_mas_hora_pressed() -> void:
	var texto = caja_get_number(horero)
	if(texto>=0):ajustar(horero,+1)


func _on_menos_segundo_pressed() -> void:
	var texto = caja_get_number(secondero)
	if(texto > 0):ajustar(secondero,-1)
	


func _on_menos_minuto_pressed() -> void:
	var texto = caja_get_number(minutero)
	if(texto>0):
		ajustar(minutero,-1)


func _on_menos_hora_pressed() -> void:
	var texto = caja_get_number(horero)
	if(texto>0):
		ajustar(horero,-1)
