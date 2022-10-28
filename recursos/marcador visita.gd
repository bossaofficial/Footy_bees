extends MarginContainer

var goles2 = 0


onready var goles_2 = $Goles2  setget set_goles2

func set_goles2(value):
		goles_2.text = "%d" % value
