class_name BaseGameCharacter2D extends CharacterBody2D


@export_group("team")
@export var team:TeamMemberComponent.Team

func _ready() -> void:
	if team!=null:
		set_team(team)


func set_team(team:TeamMemberComponent.Team):
	for i in get_children():
		if i is TeamMemberComponent:
			i.team=team
			i.apply_team()
