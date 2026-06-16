class_name TeamCollisionOverrideComponent extends Node


var team_layers := {
	TeamMemberComponent.Team.red: [1, 2],    
	TeamMemberComponent.Team.blue: [1,3],      
	TeamMemberComponent.Team.yellow: [1,4] 
}

var team_masks := {
	TeamMemberComponent.Team.red: [3, 4], 
	TeamMemberComponent.Team.blue: [2, 4],  
	TeamMemberComponent.Team.yellow: [2, 3] 
}

func apply_team_collision(character: BaseGameCharacter2D, team: TeamMemberComponent.Team):
	var layer_value = _array_to_layer(team_layers.get(team, [1]))
	var mask_value = _array_to_layer(team_masks.get(team, [1]))
	
	for i in character.collision_layer_array:
		i.collision_layer = layer_value
		i.collision_mask = mask_value

func _array_to_layer(layers: Array) -> int:
	var result = 0
	for layer in layers:
		result |= (1 << (layer - 1))  
	return result
