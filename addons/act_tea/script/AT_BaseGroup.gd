class_name AT_BaseGroup extends ActTeaNode


func get_base_kind()->AT_Enum.BaseKind:
	return AT_Enum.BaseKind.GROUP


func get_all_child() -> Array[ActTeaNode]:
	var arr: Array[ActTeaNode] = []
	var found_nodes = find_children("*", "ActTeaNode", true)
	
	for node in found_nodes:
		if node is ActTeaNode:
			arr.append(node)
	return arr
	
