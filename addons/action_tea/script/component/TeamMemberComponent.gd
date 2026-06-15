class_name TeamMemberComponent extends Node

enum Team{
	red,blue,yellow,green,white,black
}

@export var team:Team

func _ready() -> void:
	if not get_parent() is BaseGameCharacter2D:
		push_error("TeamMemberComponent的parent不是BaseGameCharacter2D")
		return
