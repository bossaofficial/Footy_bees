extends KinematicBody2D
onready var pivot = $Pivot
onready var sprite = $Sprite
onready var anim_player = $AnimationPlayer

var velocity = Vector2()
var GRAVITY = 100
var SPEED = 600
var SPEEDY = 600
export (int, 0, 200) var push = 100

export (int) var input_index = 1

func _physics_process(delta):
	var move_input = Input.get_axis("move_left" + str(input_index),"move_right" + str(input_index))
	var move_input1 = Input.get_axis("move_up" + str(input_index),"move_down" + str(input_index))
	velocity.x = move_input * SPEED
	velocity.y = move_input1 * SPEEDY
	velocity = move_and_slide(velocity,Vector2.ZERO, false, 4, PI/4,true)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * velocity.length() * 10000)

	if move_input > 0 or move_input1 > 0:
		anim_player.play("idle")

# Animaciones


func _ready():
	pass # Replace with function body.



