
extends Area2D

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
