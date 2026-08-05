class_name ActGameCharacter2D extends CharacterBody2D

@export var data:ActGameCharacterData


func _ready() -> void:
	if data==null:
		push_error(name,"角色未挂载data:ActGameCharacterData")
		return
