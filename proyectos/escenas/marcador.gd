extends CanvasLayer

var local = 0
var visita = 0

func reset():
	local = 0
	visita = 0
	$Marcador/Label.text = "0  ."
	$Marcador2/Label.text = "  0"

func goal(index):
	if index == 1:
		local += 1
		$Marcador/Label.text =  str(local) + "  ."
	else: 
		visita += 1
		$Marcador2/Label.text =  "  " +str(visita)
