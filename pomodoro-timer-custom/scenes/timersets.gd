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
@onready var minuto_estudio: LineEdit = $Teclados/minuto_estudio
@onready var minuto_descanso: LineEdit = $Teclados/minuto_descanso

signal cambio

func fixnumero(texto: String) -> int:
	if texto == "" or texto == null:
		return 0
	return int(texto)

func ajustar(line: LineEdit, cambio_val: int) -> void:
	var valor = fixnumero(line.text)
	valor += cambio_val
	if valor < 0: valor = 0
	line.text = str(valor)

func caja_get_number(input: LineEdit) -> int:
	if input.text == "" or input.text == null:
		return 0
	return int(input.text)

func _on_mas_segundo_pressed() -> void:
	ajustar(secondero, 1)

func _on_mas_minuto_pressed() -> void:
	ajustar(minutero, 1)

func _on_mas_hora_pressed() -> void:
	ajustar(horero, 1)

func _on_menos_segundo_pressed() -> void:
	ajustar(secondero, -1)

func _on_menos_minuto_pressed() -> void:
	ajustar(minutero, -1)

func _on_menos_hora_pressed() -> void:
	ajustar(horero, -1)
