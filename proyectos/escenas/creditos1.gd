extends Node2D
onready var siguiente = $VBoxContainer2/siguiente
onready var cerrar = $VBoxContainer/cerrar

func _ready():
	siguiente.connect("pressed",self,"_on_siguiente_pressed")
	cerrar.connect("pressed",self,"_on_cerrar_pressed")
	
func _on_siguiente_pressed():
	get_tree().change_scene("res://proyectos/escenas/creditos2.tscn")

func _on_cerrar_pressed():
	get_tree().change_scene("res://proyectos/escenas/Main Menu/mainmenu.tscn")
