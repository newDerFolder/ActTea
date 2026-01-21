@icon("res://vcder/ActTea/sc/SkillGroup.png")
extends BaseSkill
class_name SkillGroup

func play():
	for i in get_children():
		i.play()
