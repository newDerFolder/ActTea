class_name HurtboxComponent extends Area2D

@export var health_component:HealthComponent

func _ready() -> void:
	#新版本0.3+改为由HitBox主动攻击
	#area_entered.connect(_on_area_entered)
	pass


func take_damage(hit_data):
	health_component.take_damage(hit_data)

#func _on_area_entered(area: Area2D):
	#if not area is HitBoxComponent:
		#return
	#var damage=(area as HitBoxComponent).damage
	#health_component.take_damage(damage)
	#area.hit.emit(self)
