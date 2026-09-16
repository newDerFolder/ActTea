## @deprecated
class_name StateGroupNode extends Node

@export var character:BaseGameCharacter2D

func _ready() -> void:
	if character==null:
		push_error("StateGroupNode的character为null")
		return
	var had_a_num=0
	for i in get_children():
		if not i is BaseStateNode:
			push_error("StateGroupNode的子节点中含有非BaseStateNode")
			return
		else:
			i as BaseStateNode
			i.character=character
			if i.active:
				had_a_num+=1
	if had_a_num>1:
		push_error("StateGroupNode的子节点中活跃状态有多个，请确保其只有一个默认活跃")
	elif had_a_num<=0:
		push_error("StateGroupNode的子节点中没有一个是活跃状态")
func get_state_node_by_name(name:String)->BaseStateNode:
	for i in get_children():
		if i.name==name:
			return i
	return null
func change_state_by_name(name:String):
	var state_node=get_state_node_by_name(name)
	if state_node==null:
		return
	get_now_state_node().exit()
	state_node.enter()
	

func get_now_state_node()->BaseStateNode:
	for i:BaseStateNode in get_children():
		if i.active:
			return i
	return null

func get_now_state_name()->String:
	return get_now_state_node().state_name
