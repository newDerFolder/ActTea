class_name RadarV1 extends BaseRadar

@export var scan_groups:Array[StringName]=[] 


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area:Area2D):
	if area is HurtboxComponent:
		for i in scan_groups:
			if area.is_in_group(i):
				enemy_spotted.emit(area)
				break
