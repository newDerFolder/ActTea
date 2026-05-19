class_name ActTeaNode extends Node


func get_base_kind()->AT_Enum.BaseKind:
	return AT_Enum.BaseKind.NONE

func get_all_child()->Array[ActTeaNode]:
	var arr:Array[ActTeaNode]=[]
	for i in get_all_child():
		if not i is ActTeaNode:
			push_error("ActTeaNode中有非ActTea的子节点")
		i.get_all_child()
	return arr
