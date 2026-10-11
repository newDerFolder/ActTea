class_name ChargeSkill extends ActSkill

@export var max_charges=5
@export var cur_charges=5
@export var recharge_on_empty=false

func _ready() -> void:
	super._ready()
	if recharge_on_empty:
		pass
	else:
		timer.one_shot=false
		timer.start(cooldown_time)

func use_skill() -> void:
	if not can_use():
		return
	else:
		cur_charges-=1
		if recharge_on_empty and cur_charges<=0:
			timer.start(cooldown_time)

func can_use()->bool:
	if cur_charges>0:
		return true
	else:
		return false


func _on_time_timeout():
	super._on_time_timeout()
	if cur_charges<max_charges:
		cur_charges+=1
	if recharge_on_empty:
		cur_charges=max_charges
