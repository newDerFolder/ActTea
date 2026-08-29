class_name ActRole2D extends CharacterBody2D

## ActTea中的2D角色组件
@export var data:ActRoleData

@export var auto_duplicate_role=true


func _ready() -> void:
	if data==null:
		push_error(name,"(ActRoleData)角色未挂载data")
		return
	if auto_duplicate_role:
		data=data.duplicate(true)
