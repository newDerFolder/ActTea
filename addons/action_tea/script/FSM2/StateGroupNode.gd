class_name StateGroupNode extends Node


func _ready() -> void:
	var had_a_num=0
	for i in get_children():
		if not i is BaseStateNode:
			push_error("StateGroupNode的子节点中含有非BaseStateNode")
			return
		else:
			i as BaseStateNode
			if i.active:
				had_a_num+=1
	if had_a_num>1:
		push_error("StateGroupNode的子节点中活跃状态有多个，请确保其只有一个默认活跃")
	elif had_a_num<=0:
		push_error("StateGroupNode的子节点中没有一个是活跃状态")

func get_now_state_node()->BaseStateNode:
	for i:BaseStateNode in get_children():
		if i.active:
			return i
	return null

func get_now_state_name()->String:
	return get_now_state_node().state_name
