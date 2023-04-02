extends KinematicBody2D

export var speed = 200
var velocity = Vector2()
var mouse_position = null
var direction

func _physics_process(delta):
	
	velocity = Vector2(0, 0)
	mouse_position = get_global_mouse_position()
	
	if Input.is_action_pressed("forward"):
		direction = (mouse_position - position).normalized()
		velocity = (direction * speed)
		
	if Input.is_action_just_pressed("forward"):
		direction = (mouse_position - position).normalized()
		velocity = (direction * speed) * 2
	
	move_and_slide(velocity)
	look_at(mouse_position)


func _on_Button_pressed():
	set_physics_process(not is_physics_processing()) # Replace with function body.

func _on_Timer_timeout():
	visible = not visible

func _ready():
	var timer = get_node("Timer")
	timer.connect("timeout", KinematicBody2D, "_on_Button_pressed")
	
