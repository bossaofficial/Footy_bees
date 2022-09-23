extends MarginContainer

onready var jugar = $VBoxContainer/JUGAR
onready var creditos = $VBoxContainer/CREDITOS
onready var salir = $VBoxContainer/SALIR

func _ready():
	jugar.connect("pressed",self,"_on_jugar_pressed")
	creditos.connect("pressed",self,"_on_creditos_pressed")
	salir.connect("pressed",self,"_on_salir_pressed")


func _on_salir_pressed():
	get_tree().quit()

func _on_creditos_pressed():
	print(":o")

func _on_jugar_pressed():
	get_tree().change_scene("res://proyectos/escenas/main.tscn")
