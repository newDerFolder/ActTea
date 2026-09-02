## ActTea中的通用控制器,使用它来让角色可控制吧
class_name ControllerComponent extends Node


@export var use_default_key_bindings=true
@export var move_up_action="move_up"
@export var move_down_action="move_down"
@export var move_left_action="move_left"
@export var move_right_action="move_right"

var role:ActRole2D

func _ready() -> void:
	if not get_parent() is ActRole2D:
		push_error(name,"(ControllerComponent),parent not is ActRole2D")
		return
	else:
		role=get_parent()
		

func _physics_process(delta: float) -> void:
	var speed=role.data.speed
	role.velocity=Vector2(0,0)
	if use_default_key_bindings:
		if Input.is_physical_key_pressed(Key.KEY_W):
			role.velocity+=Vector2(0,-speed)
		if Input.is_physical_key_pressed(Key.KEY_S):
			role.velocity+=Vector2(0,speed)
		if Input.is_physical_key_pressed(Key.KEY_A):
			role.velocity+=Vector2(-speed,0)
		if Input.is_physical_key_pressed(Key.KEY_D):
			role.velocity+=Vector2(speed,0)
		role.move_and_slide()
	else:
		if Input.is_action_pressed(move_up_action):
			role.velocity+=Vector2(0,-speed)
		if Input.is_action_pressed(move_down_action):
			role.velocity+=Vector2(0,speed)
		if Input.is_action_pressed(move_left_action):
			role.velocity+=Vector2(-speed,0)
		if Input.is_action_pressed(move_right_action):
			role.velocity+=Vector2(speed,0)
		role.move_and_slide()
