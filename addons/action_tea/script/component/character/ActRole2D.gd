class_name ActRole2D extends CharacterBody2D

## ActTea中的2D角色组件
@export var data:ActRoleData


func _ready() -> void:
	if data==null:
		push_error(name,"(ActRoleData)角色未挂载data")
		return
