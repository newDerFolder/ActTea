class_name RadarComponent extends Area2D

@export var enable:bool=true
@export var scan_interval: float=1
@export var single_scan_time:float=1
@export var scan_rotation_speed: float = 300

var scan_interval_timer:=Timer.new()
var single_scan_timer:=Timer.new()


signal enemy_detected(area:HurtboxComponent)

func _on_area_entered(area:Area2D):
	if not area is HurtboxComponent:
		return
	else:
		enemy_detected.emit(area)
func _ready() -> void:
	add_child(scan_interval_timer)
	add_child(single_scan_timer)
	
	scan_interval_timer.timeout.connect(_on_scan_interval_timer_timeout)
	scan_interval_timer.one_shot=true
	single_scan_timer.timeout.connect(_on_single_scan_timer_timeout)
	scan_interval_timer.start(scan_interval)
	single_scan_timer.one_shot=true
	
	area_entered.connect(_on_area_entered)



func _physics_process(delta: float) -> void:
	if not enable:
		monitoring=false
		return
	else:
		monitoring=true
	if single_scan_timer.time_left<=0 and scan_interval>=0.0:
		return
	rotation_degrees+=scan_rotation_speed*delta



func _on_single_scan_timer_timeout():
	scan_interval_timer.start(scan_interval)

func _on_scan_interval_timer_timeout():
	single_scan_timer.start(single_scan_time) 
