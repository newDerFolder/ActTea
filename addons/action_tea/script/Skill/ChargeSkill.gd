class_name ChargeSkill extends ActSkill

@export var max_charges = 5
@export var cur_charges = 5
@export var recharge_on_empty = false
@export var min_use_interval: float = 0.0  # 最小使用间隔，0表示无限制

var _interval_timer := Timer.new()

func _ready() -> void:
	super._ready()
	
	# 设置最小使用间隔计时器
	_interval_timer.one_shot = true
	_interval_timer.wait_time = min_use_interval
	_interval_timer.timeout.connect(_on_interval_timeout)
	add_child(_interval_timer)
	
	# 充能恢复逻辑
	if recharge_on_empty:
		pass
	else:
		timer.one_shot = false
		timer.start(cooldown_time)

func use_skill() -> void:
	if not can_use():
		return
	if not _can_use_with_interval():
		return
	
	cur_charges -= 1
	
	# 如果设置了最小使用间隔，启动间隔计时器
	if min_use_interval > 0:
		_interval_timer.start()
	
	# 空充能且开启自动恢复时，启动冷却计时器
	if recharge_on_empty and cur_charges <= 0:
		timer.start(cooldown_time)
	
	_execute_skill()

func can_use() -> bool:
	return cur_charges > 0

func _can_use_with_interval() -> bool:
	# 如果未设置间隔或计时器已停止，可以使用
	if min_use_interval <= 0 or _interval_timer.is_stopped():
		return true
	return false

func _on_interval_timeout() -> void:
	# 间隔计时器超时，可以再次使用技能
	pass

func _on_time_timeout() -> void:
	super._on_time_timeout()
	if cur_charges < max_charges:
		cur_charges += 1
	if recharge_on_empty:
		cur_charges = max_charges
