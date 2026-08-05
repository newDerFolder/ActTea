class_name DamageCalculator extends ActBaseCalculator

static func get_damage_by_role(atk_role:ActRoleData,def_role:ActRoleData)->float:
	var damage=atk_role.atk-def_role.def
	if damage<=0:
		damage=1
	return damage
