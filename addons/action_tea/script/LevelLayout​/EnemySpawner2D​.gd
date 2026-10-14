class_name EnemySpawner2D extends Node2D

@export var enemy: PackedScene
@export var interval: float = 5
@export var just_gen: bool = true
@export var max_count: int = 3
@export var min_count: int = 1

@export var rng_x_offic: float = 25
@export var rng_y_offic: float = 25

# 新增：最大波次和自动销毁
@export var max_waves: int = 5  # -1表示无限波次
@export var auto_free_after_done: bool = true  # 完成后是否自动销毁

var _timer: Timer
var _rng: RandomNumberGenerator
var _current_wave: int = 0

func _ready():
	# 初始化随机数生成器
	_rng = RandomNumberGenerator.new()
	_rng.randomize()
	
	# 创建计时器
	_timer = Timer.new()
	_timer.wait_time = interval
	_timer.autostart = just_gen
	_timer.one_shot = false
	add_child(_timer)
	_timer.timeout.connect(_on_spawn_timer_timeout)
	
	# 如果立即生成，延迟到下一帧执行
	if just_gen:
		_spawn_enemies.call_deferred()

func _on_spawn_timer_timeout():
	_spawn_enemies()

func _spawn_enemies():
	# 检查是否达到最大波次
	if max_waves > 0 and _current_wave >= max_waves:
		_finish_spawning()
		return
	
	if enemy == null:
		push_warning("EnemySpawner2D: 未设置敌人场景")
		return
	
	# 随机决定生成数量
	var count = _rng.randi_range(min_count, max_count)
	
	for i in count:
		_spawn_single_enemy()
	
	# 增加波次计数
	_current_wave += 1

func _spawn_single_enemy():
	var enemy_instance = enemy.instantiate()
	
	# 在生成器周围随机偏移位置
	var offset = Vector2(
		_rng.randf_range(-rng_x_offic, rng_x_offic),
		_rng.randf_range(-rng_y_offic, rng_y_offic)
	)
	
	enemy_instance.global_position = global_position + offset
	# 使用call_deferred避免在父节点初始化时添加子节点
	get_parent().add_child.call_deferred(enemy_instance)

func _finish_spawning():
	# 停止计时器
	_timer.stop()
	
	# 是否自动销毁
	if auto_free_after_done:
		queue_free()
	else:
		# 如果不销毁，可以在这里添加其他逻辑，比如发出信号
		print("EnemySpawner2D: 所有波次已完成，共生成 %d 波" % _current_wave)

# 可选：获取当前波次
func get_current_wave() -> int:
	return _current_wave

# 可选：重置生成器
func reset_spawner():
	_current_wave = 0
	_timer.start()
