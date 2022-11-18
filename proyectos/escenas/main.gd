extends Node2D
onready var balong = $Balong
onready var abeja1 = $Abeja1
onready var abeja2 = $Abeja2
onready var abeja3 = $Abeja3
onready var abeja4 = $Abeja4


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Arco1.connect("goal", $Marcador, "goal")
	$Arco1.connect("goal", self, "reset")
	$Arco2.connect("goal", $Marcador, "goal")
	$Arco2.connect("goal", self, "reset")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var aguijonear_input1 = Input.is_action_pressed("aguijonear1")
	var aguijonear_input2 = Input.is_action_pressed("aguijonear2")
	var aguijonear_input3 = Input.is_action_pressed("aguijonear3")
	var aguijonear_input4 = Input.is_action_pressed("aguijonear4")
	if (abeja1.global_position+Vector2(0,-100)-balong.global_position).length() < 100 and aguijonear_input1:
		balong.global_position = abeja1.global_position + Vector2(0,-150)
		balong.linear_velocity = abeja1.velocity*2
		abeja1.velocity.length() <= 100
	if (abeja2.global_position+Vector2(0,-100)-balong.global_position).length() < 100 and aguijonear_input2:
		balong.global_position = abeja2.global_position + Vector2(0,-150)
		balong.linear_velocity = abeja2.velocity*2
	if (abeja3.global_position+Vector2(0,-100)-balong.global_position).length() < 100 and aguijonear_input3:
		balong.linear_velocity = abeja3.velocity*2
		balong.global_position = abeja3.global_position + Vector2(0,-150)
	if (abeja4.global_position+Vector2(0,-100)-balong.global_position).length() < 100 and aguijonear_input4:
		balong.global_position = abeja4.global_position + Vector2(0,-150)
		balong.linear_velocity = abeja4.velocity*2
	pass

func reset(_index):
	abeja1.position = Vector2(985,517)
	abeja3.position = Vector2(985,187)
	abeja2.position = Vector2(305,517)
	abeja4.position = Vector2(305,187)
	balong.set_deferred("global_position", Vector2(659,397))
	balong.set_deferred("linear_velocity", Vector2(0,500))
