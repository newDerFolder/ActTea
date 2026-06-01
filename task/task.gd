extends Node



func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	$HitBoxComponent.position.x-=100*delta


func _on_hit_box_component_hit(hurtbox: HurtboxComponent) -> void:
	print("打中了")


func _on_health_component_on_damaged(damage_amount: int) -> void:
	print("被打了")
