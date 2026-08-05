class_name HealthComponent extends Node2D


@export var role:ActRole2D
var data:ActRoleData
var is_dead := false

signal on_health_changed(hp:int,max_hp:int)
signal on_damaged(damage_amount:int)
signal on_died()


func _ready() -> void:
	if role==null:
		push_error(name,"(HealthComponent),role is null")
		return


func take_damage(hit_data:ActHitData):
	if role==null:
		push_error(name,"(HealthComponent),role is null")
		return
	var damage=DamageCalculator.get_damage_by_hit_and_role(hit_data,role.data)
	data.cur_hp-=damage
	on_damaged.emit(damage)
	on_health_changed.emit(data.cur_hp,data.max_hp)
	if data.cur_hp<=0:
		die()

func die():
	if is_dead:
		return
	is_dead = true
	on_died.emit()
