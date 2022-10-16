class_name Ball
extends RigidBody2D
export var altura_minima = 844
export var altura_maxima = -70
var v_max = 500
onready var initial_y = global_position.y
func _physics_process(delta):
	if linear_velocity.y*linear_velocity.y + linear_velocity.x*linear_velocity.x > v_max*v_max:
		linear_velocity.y = (linear_velocity.y)*v_max/sqrt(linear_velocity.y*linear_velocity.y + linear_velocity.x*linear_velocity.x)
		linear_velocity.x = (linear_velocity.x)*v_max/sqrt(linear_velocity.y*linear_velocity.y + linear_velocity.x*linear_velocity.x)
	if global_position.y > altura_minima:
		global_position.y = altura_maxima + 1
	elif global_position.y < altura_maxima:
		global_position.y = altura_minima - 1
	var aguijonear_input1 = Input.is_action_pressed("aguijonear1")
	var aguijonear_input2 = Input.is_action_pressed("aguijonear2")


