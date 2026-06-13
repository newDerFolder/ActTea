extends Node



func _ready() -> void:
	print_tree()
	if get_parent() is Button:
		print("true")
	else:
		print("false")
	pass


func _physics_process(delta: float) -> void:
	$CharacterBody2D.position.x-=100*delta
	if $HurtboxComponent/StateGroupNode.get_now_state_name()=="move":
		$HurtboxComponent.position.y+=50*delta

func _on_hit_box_component_hit(hurtbox: HurtboxComponent) -> void:
	print("打中了")


func _on_health_component_on_damaged(damage_amount: int) -> void:
	print("被打了")


func _on_enemy_radar_component_enemy_detected(area: HurtboxComponent) -> void:
	print("扫描到敌人了",area.global_position)
	if $HurtboxComponent/StateGroupNode.get_now_state_name()=="await":
		$HurtboxComponent/StateGroupNode/awaitt.transition_by_index(0)
