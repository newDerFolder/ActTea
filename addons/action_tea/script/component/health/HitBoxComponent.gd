class_name HitBoxComponent extends Area2D


@export var data:=ActHitData.new()

enum Mode{
	Default,
	Group
}
@export var mode:Mode=Mode.Group

@export var hit_group:Array[StringName]

signal hit(hurtbox: HurtboxComponent)


func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area:Area2D):
	if area is HurtboxComponent:
		if mode==Mode.Default:
			area.take_damage(data)
			hit.emit(area)
			return
		elif mode==Mode.Group:
			for i in hit_group:
				if area.is_in_group(i):
					area.take_damage(data)
					hit.emit(area)
					break
			#push_warning("HitBox hit a Hurtbox that doesn't belong to any target group")
