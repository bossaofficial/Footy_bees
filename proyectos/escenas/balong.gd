class_name Ball
extends RigidBody2D
export var altura_minima = 844
export var altura_maxima = -70
var v_max = 900
onready var initial_y = global_position.y
onready var collision_shape_2d = $CollisionShape2D


func _physics_process(delta):
	if linear_velocity.length() > v_max*v_max:
		linear_velocity.y = (linear_velocity.y)*v_max/linear_velocity.length()
		linear_velocity.x = (linear_velocity.x)*v_max/linear_velocity.length()
	if global_position.y > altura_minima:
		global_position.y = altura_maxima + 1
	elif global_position.y < altura_maxima:
		global_position.y = altura_minima - 1
	var aguijonear_input1 = Input.is_action_pressed("aguijonear1")
	var aguijonear_input2 = Input.is_action_pressed("aguijonear2")
	#Contacto del balong
	if get_collision_layer_bit(8):
		print("a")
	if get_collision_layer_bit(4):
		print("a")

func enable_collision(value):
	collision_shape_2d.disabled = not value
	
