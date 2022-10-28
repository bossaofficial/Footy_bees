extends MarginContainer

var goles1 = 0

onready var goles_1 = $Goles1 setget set_goles1

func set_goles1(value):
	goles_1.text = "%d" % value
	
