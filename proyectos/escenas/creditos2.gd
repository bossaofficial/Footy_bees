extends Node2D

onready var cerrar = $VBoxContainer2/cerrar

func _ready():
	cerrar.connect("pressed",self,"_on_cerrar_pressed")
	
func _on_cerrar_pressed():
	get_tree().change_scene("res://proyectos/escenas/Main Menu/mainmenu.tscn")
