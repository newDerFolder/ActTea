class_name StateGroup
extends Node

func get_all_state() -> Array[StateNode]:
	var arr: Array[StateNode] = []
	for child in get_children():
		if child is StateNode:
			arr.append(child)
		elif child is StateGroup:
			arr.append_array(child.get_all_state())
	return arr
