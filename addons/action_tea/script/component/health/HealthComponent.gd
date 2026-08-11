class_name HealthComponent extends Node2D

## ActTea中负责处理角色生命值的组件,应当作为ActRole2D下的子节点挂载

var role:ActRole2D
var data:ActRoleData
var is_dead := false

signal health_changed(hp:int,max_hp:int)
signal damaged(damage_amount:int)
signal died()


func _ready() -> void:
	if not get_parent() is ActRole2D:
		push_error(name,"(HealthComponent),parent not is ActRole2D")
		return
	else:
		role=get_parent()
		data=role.data



func take_damage(hit_data:ActHitData):
	if role==null:
		push_error(name,"(HealthComponent),role is null")
		return
	var damage=DamageCalculator.get_damage_by_hit_and_role(hit_data,role.data)
	data.cur_hp-=damage
	damaged.emit(damage)
	health_changed.emit(data.cur_hp,data.max_hp)
	if data.cur_hp<=0:
		die()

func die():
	if is_dead:
		return
	is_dead = true
	died.emit()
