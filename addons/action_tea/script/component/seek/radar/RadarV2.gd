## 第二代雷达控件,相较于初代,若有敌人存在它会每隔一秒发射信号enemy_exists
class_name RadarV2 extends BaseRadar

@export var scan_groups: Array[StringName] = []
@export var enemys: Array[HurtboxComponent] = []

var timer: Timer

signal enemy_exists(enemy: HurtboxComponent)

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	
	timer = Timer.new()
	timer.wait_time = 1.0
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)

func _on_area_entered(area: Area2D) -> void:
	if area is HurtboxComponent:
		for group in scan_groups:
			if area.is_in_group(group):
				if not area in enemys:
					enemys.append(area)
					enemy_exists.emit(area)
				break

func _on_timer_timeout() -> void:
	enemys = enemys.filter(func(e): return is_instance_valid(e))
	
	if enemys.size() > 0:
		var target = enemys[0]
		enemy_exists.emit(target)
