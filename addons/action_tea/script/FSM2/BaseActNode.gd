class_name BaseStateNode extends Node

@export var state_name:String="base state node"
@export var active: bool = false
@export var next_state_nodes: Array[BaseStateNode]

signal state_entered(state: BaseStateNode)
signal state_exited(state: BaseStateNode)


func enter() -> void:
	active = true
	state_entered.emit(self)

func exit() -> void:
	active = false
	state_exited.emit(self)


func transition_by_index(index: int) -> void:
	if index < 0 or index >= next_state_nodes.size():
		push_error("索引越界: %d" % index)
		return
	exit()
	next_state_nodes[index].enter()

func transition_by_state_node(new_state:BaseStateNode):
	if not next_state_nodes.has(new_state):
		push_error("没有该state node")
		return
	exit()
	new_state.enter()

func transition_by_state_name(new_state_name:String):
	for i in next_state_nodes:
		if i.state_name==new_state_name:
			exit()
			i.enter()
	push_error("没有该名称的state node")
