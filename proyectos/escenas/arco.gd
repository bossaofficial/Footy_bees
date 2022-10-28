extends Area2D

onready var marcador_visita = $"CanvasLayer/marcador visita"
onready var marcador_local = $"CanvasLayer/marcador local"


export var frequency = 1
export var amplitude = 100
export (int) var input_index = 1
var delta_acc = 0

onready var initial_y = global_position.y

func _ready():
	var tween = get_tree().create_tween().set_loops()
	
	tween.tween_property(self, "frequency", 10, 5).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self, "frequency", 2, 2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)

	#yield(tween, "finished")
	
func _physics_process(delta):
	delta_acc += delta * frequency
	global_position.y = initial_y + amplitude * sin(delta_acc)


func _on_StaticBody2D_body_entered(body):
	if input_index == 1:
		marcador_local.goles1 += 1
		print("A") # Replace with function body.
	if input_index == 2:
		marcador_visita.goles2 += 1
		print("B")
