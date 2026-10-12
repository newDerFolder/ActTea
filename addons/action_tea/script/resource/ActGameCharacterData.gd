class_name ActRoleData extends ActBaseData

@export var max_hp:float=100
@export var cur_hp:float=100
@export var atk:float=10
@export var def:float=5
@export var level:int=1
@export var exp:int=0
@export var speed:float=200


func level_up():
	if exp>=LevelUpCalculator.exp_needed_for_level(level+1):
		exp-=LevelUpCalculator.exp_needed_for_level(level+1)
		level+=1
