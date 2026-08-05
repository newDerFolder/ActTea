class_name ActRole2D extends CharacterBody2D

@export var data:ActRoleData


func _ready() -> void:
	if data==null:
		push_error(name,"角色未挂载data:ActRoleData")
		return
