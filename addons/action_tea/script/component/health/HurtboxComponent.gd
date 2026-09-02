class_name HurtboxComponent extends Area2D

@export var health_component:HealthComponent

func _ready() -> void:
	if get_parent() is HealthComponent:
		health_component=get_parent()
	if health_component==null:
		push_error("health_component为null")


func take_damage(hit_data):
	health_component.take_damage(hit_data)

#func _on_area_entered(area: Area2D):
	#if not area is HitBoxComponent:
		#return
	#var damage=(area as HitBoxComponent).damage
	#health_component.take_damage(damage)
	#area.hit.emit(self)
