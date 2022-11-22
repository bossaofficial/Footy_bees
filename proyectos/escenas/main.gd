extends Node2D
onready var balong = $Balong
onready var abeja1 = $Abeja1
onready var abeja2 = $Abeja2
onready var abeja3 = $Abeja3
onready var abeja4 = $Abeja4
onready var marcador = $Marcador


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	marcador.connect("goal_animation",self,"on_goal_animation")
	$Arco1.connect("goal", self, "goal")
	$Arco2.connect("goal", self, "goal")
	if GolesAlmacenados.local==5:
		get_tree().change_scene("res://proyectos/escenas/ganavisita.tscn")
	if GolesAlmacenados.visita==5:
		get_tree().change_scene("res://proyectos/escenas/ganalocal.tscn")

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

func goal(index):
	if index==1:
		GolesAlmacenados.local+=1
		get_tree().change_scene("res://proyectos/escenas/goalscene.tscn")
	if index==2:
		GolesAlmacenados.visita+=1
		get_tree().change_scene("res://proyectos/escenas/goalscene.tscn")
	
	

func on_goal_animation():
	reset(0)

func reset(_index):
	get_tree().paused = true
	marcador.nimation_player.play("fade_out")
	abeja1.position = Vector2(985,517)
	abeja3.position = Vector2(985,187)
	abeja2.position = Vector2(305,517)
	abeja4.position = Vector2(305,187)
#	balong.enable_collision(false)
	balong.set_deferred("mode", RigidBody2D.MODE_KINEMATIC)
	balong.set_deferred("global_position", Vector2(659,397))
	balong.set_deferred("mode", RigidBody2D.MODE_RIGID)
#	balong.global_position = Vector2(659,397)
	yield(get_tree(), "physics_frame")
#	balong.mode = RigidBody2D.MODE_RIGID
#	balong.enable_collision(true)
	balong.linear_velocity= Vector2(0,500)
	yield(marcador.nimation_player, "animation_finished")
	get_tree().paused = false
	
	
