class_name TeamColorOverrideComponent extends Node



func apply_team_color(character:BaseGameCharacter2D,team:TeamMemberComponent.Team):
	character.modulate=get_team_color(team)

func get_team_color(team:TeamMemberComponent.Team)->Color:
	match team:
		TeamMemberComponent.Team.red:
			return Color.RED
		TeamMemberComponent.Team.blue:
			return Color.BLUE
		TeamMemberComponent.Team.yellow:
			return Color.YELLOW
		
	push_warning("get_team_color not find team")
	return Color.BLACK
	
