extends MarginContainer
# variables
onready var continuar = $VBoxContainer/Continuar
onready var configuracion = $VBoxContainer/Configuracion
onready var abandonar = $VBoxContainer/Abandonar
# funcion empezar
func _ready():
	continuar.connect("pressed",self,"_on_continuar_pressed")
	configuracion.connect("pressed",self,"_on_configuracion_pressed")
	abandonar.connect("pressed",self,"_on_abandonar_pressed")
# Se definen las funciones llamadas anteriormente
func _on_continuar_pressed():
	visible = false
	get_tree().paused = visible
func _on_configuracion_pressed():
	get_tree().change_scene("res://proyectos/escenas/Main Menu/mainmenu.tscn")
	get_tree().paused = false
func _on_abandonar_pressed():
	get_tree().quit()
 
func _input(event):
	if event.is_action_pressed("pausa"):
		visible =! visible
		get_tree().paused = visible
		
func _on_resume_pressed():
	get_tree().paused = false
	visible = not true

