class_name HealthComponent extends Node2D

@export var max_hp:int=100:
	set(value):
		max_hp=value
		on_health_changed.emit(hp,max_hp)
@export var hp:int=100:
	set(value):
		hp=value
		on_health_changed.emit(hp,max_hp)
@export var is_alive:bool=true

signal on_health_changed(hp:int,max_hp:int)
signal on_damaged(damage_amount:int)
signal on_died()


func _ready() -> void:
	hp=max_hp
	on_health_changed.emit(hp,max_hp)

func take_damage(damage_amount:int):
	hp-=damage_amount
	on_damaged.emit(damage_amount)
	if hp<=0:
		die()
func die():
	if is_alive:
		is_alive=false
		on_died.emit()
	else:
		pass
