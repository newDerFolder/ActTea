class_name BaseStateNode extends Node

@export var active=false
@export var next_state_nodes:Array[BaseStateNode]

signal exited_state(state:BaseStateNode)
signal entered_state(state:BaseStateNode)



func change_from_index(index:int):
	if index>next_state_nodes.size()-1:
		push_error("BaseActNode的next_act_nodes:超出索引")
		return
	active=false
