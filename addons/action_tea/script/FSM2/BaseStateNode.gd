class_name BaseStateNode extends Node

@export var active: bool = false
var character:BaseGameCharacter2D


signal state_entered(state: BaseStateNode)
signal state_exited(state: BaseStateNode)

func _physics_process(delta: float) -> void:
	if active:
		state_updata(delta)
		state_update(delta)

func state_updata(delta: float):
	pass
func state_update(delta: float):
	pass
func enter() -> void:
	active = true
	state_entered.emit(self)

func exit() -> void:
	active = false
	state_exited.emit(self)


func change_state_by_name(new_state_name:String):
	get_parent().change_state_by_name(new_state_name)
