class_name StateMachine
extends Node

@export var cur_state: StateNode
var role: ActRole2D

func _ready() -> void:
	var parent = get_parent()
	if parent is ActRole2D:
		role = parent
	else:
		push_error("StateMachine的父节点不是ActRole2D")
		return
	link_state_nodes()
	if cur_state:
		cur_state.enter_state()

func transition_to(state: StateNode) -> void:
	if state == null:
		push_error("不能切换到 null 状态")
		return
	if cur_state == state:
		return
	if cur_state:
		cur_state.exit_state()
	cur_state = state
	state.enter_state()

func link_state_nodes() -> void:
	for child in get_children():
		if child is StateNode:
			child.state_machine = self
		elif child is StateGroup:
			for s in child.get_all_state():
				s.state_machine = self
		else:
			push_error("StateMachine之下的子节点含有非StateNode或StateGroup,请移除")
