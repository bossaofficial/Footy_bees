extends CanvasLayer
onready var nimation_player = $Gol/nimationPlayer

func _ready():
	$Marcador/Label.text =  str(GolesAlmacenados.local) + "  ."
	$Marcador2/Label.text =  "  " + str(GolesAlmacenados.visita)
