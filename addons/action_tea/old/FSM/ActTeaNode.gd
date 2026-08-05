class_name ActTeaNode extends Node

var active:bool=false 

func get_base_kind()->AT_Enum.BaseKind:
	return AT_Enum.BaseKind.NONE

func get_all_children() -> Array[ActTeaNode]:
	var arr: Array[ActTeaNode] = []
	for child in get_children():
		if child is ActTeaNode:
			arr.append(child as ActTeaNode)
			arr.append_array(child.get_all_children()) 
		else:
			push_error("ActTeaNode 中包含非 ActTeaNode 的子节点：" + child.name)
	return arr
