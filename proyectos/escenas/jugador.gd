extends KinematicBody2D
onready var pivot = $Pivot
onready var sprite = $Pivot/Sprite
onready var anim_player = $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")
onready var tiempo_balong = $Tiempo_balong
onready var cooldown = $Cooldown
onready var tween = $Tween


var balon


var velocity = Vector2()
var GRAVITY = 100
var SPEED = 600
var SPEEDY = 600
var KICK_IMPULSE = 10
var max_height = 54
var min_height = 716
export (int, 0, 200) var push = 100

export (int) var input_index = 1

var has_balong = false
var has_cooldown = false

func _physics_process(delta):
	if global_position.y < max_height:
		global_position.y = max_height
	if global_position.y > min_height:
		global_position.y = min_height
	var move_input = Input.get_axis("move_left" + str(input_index),"move_right" + str(input_index))
	var move_input1 = Input.get_axis("move_up" + str(input_index),"move_down" + str(input_index))
	velocity.x = move_input * SPEED
	velocity.y = move_input1 * SPEEDY
	velocity = move_and_slide(velocity,Vector2.ZERO, false, 4, PI/4,false)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * velocity.length() * 10000)
	# Animaciones
	anim_tree.active = true
	var aguijonear_input = Input.is_action_pressed("aguijonear"+str(input_index))
	if (global_position+Vector2(0,-100)-balon.global_position).length() < 100 and aguijonear_input and not has_cooldown:
		if not has_balong:
			has_balong = true
			tiempo_balong.start()
		balon.global_position = global_position + Vector2(0,-150)
		balon.linear_velocity = velocity*2
		playback.travel("tomar_pelota")
	else:
		if has_balong:
			tiempo_balong.stop()
			_on_tiempo_balong_timeout()
		playback.travel("idle")
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		var ball:= collision.collider as Ball
		if ball:
			ball.apply_impulse((-collision.normal)*(velocity.length()+10)*KICK_IMPULSE/1000,(ball.position-global_position)/(ball.position-global_position).length())
#Color abejita
func _ready():
	balon = get_tree().get_nodes_in_group("Balon")[0]
	var sprite=$Pivot/Sprite
	if input_index==1 or input_index==3:
		sprite.modulate= Color.pink
	tiempo_balong.connect("timeout", self, "_on_tiempo_balong_timeout")
	cooldown.connect("timeout", self, "_on_cooldown_timeout")

func _on_tiempo_balong_timeout():
	has_balong = false
	has_cooldown = true
	cooldown.start()
	tween.interpolate_property(sprite, "modulate", Color(0.5,0.5,0.5), sprite.modulate, cooldown.wait_time)
	tween.start()

func _on_cooldown_timeout():
	has_cooldown = false
