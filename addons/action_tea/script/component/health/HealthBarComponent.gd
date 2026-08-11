class_name HealthBarComponent extends ProgressBar


@export var health_component:HealthComponent

func _ready() -> void:
	if health_component==null:
		push_error("HealthBarComponent没有绑定HealthComponent")
		return
	else:
		health_component.health_changed.connect(_on_health_component_health_changed)
		max_value=health_component.max_hp
	value=health_component.hp

func _on_health_component_health_changed(hp:int,max_hp:int):
	max_value=max_hp
	value=hp
