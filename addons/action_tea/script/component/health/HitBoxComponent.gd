class_name HitBoxComponent extends Area2D

#@export var damage: float = 10
@export var data:=ActHitData.new()


signal hit(hurtbox: HurtboxComponent)


func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area:Area2D):
	if area is HurtboxComponent:
		for i in get_groups():
			if area.is_in_group(i):
				
				area.take_damage(data)
