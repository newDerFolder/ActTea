class_name TeamMemberComponent extends Node




enum Team{
	red,blue,yellow
}

@export var team:Team

func _ready() -> void:
	if not get_parent() is BaseGameCharacter2D:
		push_error("TeamMemberComponent的parent不是BaseGameCharacter2D")
		return
	for i in get_children():
		if i is TeamColorOverrideComponent:
			i.character=get_parent()
			i.team=team
			i.apply_team_color()
