class_name ActSkill extends Node


@export var cooldown_time:float=1.0

var timer:=Timer.new()



func use_skill() -> void:
	if not can_use():
		return
	else:
		timer.start(cooldown_time)
		_execute_skill()

func _execute_skill():
	pass

func _ready() -> void:
	add_child(timer)
	timer.one_shot=true
	timer.timeout.connect(_on_time_timeout)

func _on_time_timeout():
	pass



func get_cooldown_remaining()->float:
	return timer.time_left

func can_use()->bool:
	if timer.time_left<=0:
		return true
	else:
		return false
