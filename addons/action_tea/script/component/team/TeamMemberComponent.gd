class_name TeamMemberComponent extends Node


var character:BaseGameCharacter2D

enum Team{
	red,blue,yellow
}


func _ready() -> void:
	if not get_parent() is BaseGameCharacter2D:
		push_error("TeamMemberComponent的parent必须是BaseGameCharacter2D")
	else:
		character=get_parent()


func apply_team():
	for i in get_children():
		if i is TeamColorOverrideComponent:
			i.apply_team_color(character,character.team)
