extends KinematicBody2D


var speed = 200
var vel = Vector2()
var gravity = 1700
var jump_speed = 500
var fl = Vector2(0, -1)
var jumpcount = 0
		
func _physics_process(delta):
	if jumpcount !=0 and is_on_floor():
		jumpcount = 0
	if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		vel.x = speed
	elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		vel.x = -speed
	else:
		vel.x = 0
	if Input.is_action_pressed("up") and jumpcount < 10:
		jumpcount += 1
		vel.y = -jump_speed
	vel.y += gravity*delta
	vel = move_and_slide(vel, fl)
	

	
