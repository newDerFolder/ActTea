class_name TeamCollisionOverrideComponent extends Node


func apply_team_collision(character:BaseGameCharacter2D,team:TeamMemberComponent.Team):
	for i in character.collision_layer_array:
		i.collision_layer=get_team_collision_layer(team)
		i.collision_mask=get_team_collision_mask(team)

func get_team_collision_layer(team:TeamMemberComponent.Team)->int:
	match team:
		TeamMemberComponent.Team.red:
			return 1
		TeamMemberComponent.Team.blue:
			return 2
		TeamMemberComponent.Team.yellow:
			return 3
		
	push_warning("get_team_collision_layer not find team")
	return 1


func get_team_collision_mask(team:TeamMemberComponent.Team)->int:
	match team:
		TeamMemberComponent.Team.red:
			return 1
		TeamMemberComponent.Team.blue:
			return 2
		TeamMemberComponent.Team.yellow:
			return 3
		
	push_warning("get_team_collision_layer not find team")
	return 1
