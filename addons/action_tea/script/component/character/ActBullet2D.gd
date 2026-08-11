@icon("res://addons/action_tea/asset/icon/ActBullet.png")
class_name ActBullet2D extends HitBoxComponent

@export var from_role_data:ActRoleData

func _ready() -> void:
	hit.connect(_on_hit)


func set_damage(value:float):
	data.atk=value

func _on_hit(hurtbox: HurtboxComponent):
	pass
