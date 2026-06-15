class_name BaseGameCharacter2D extends CharacterBody2D


@export_group("team")
@export var team_member_component:TeamMemberComponent

func _ready() -> void:
	pass


func set_team(team:TeamMemberComponent.Team):
	for i in get_children():
		if i is TeamMemberComponent:
			i.team=team
