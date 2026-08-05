class_name DamageCalculator extends ActBaseCalculator

static func get_damage_by_role(atk_role:ActRoleData,def_role:ActRoleData)->float:
	var damage=atk_role.atk-def_role.def
	if damage<=0:
		damage=1
	return damage

static func get_damage_by_hit_and_role(hit_data:ActHitData,def_role:ActRoleData)->float:
	var damage=hit_data.atk-def_role.def
	if damage<=0:
		damage=1
	return damage
