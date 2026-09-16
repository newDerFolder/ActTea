@icon("res://addons/action_tea/asset/icon/state_node.png")
class_name StateNode
extends Node

var state_machine: StateMachine

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if state_machine and state_machine.cur_state == self:
		state_update(delta)

func transition_to(state: StateNode) -> void:
	if state_machine:
		state_machine.transition_to(state)

func state_update(delta: float) -> void:
	pass

func enter_state() -> void:
	pass

func exit_state() -> void:
	pass
