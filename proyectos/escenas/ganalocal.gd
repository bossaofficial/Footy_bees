extends Node


onready var timer = $Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GolesAlmacenados.local=0
	GolesAlmacenados.visita=0
	timer.connect("timeout",self,"_cambiar_escena")
func _cambiar_escena():
	get_tree().change_scene("res://proyectos/escenas/Main Menu/mainmenu.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
