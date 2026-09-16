## ActTea中的状态机节点,配合ActRole2D使用
class_name StateNode extends Node


func _physics_process(delta: float) -> void:
	state_update(delta)

## 重写此方法为该状态添加逻辑
func state_update(delta:float)->void:
	pass
