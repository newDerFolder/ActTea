@icon("res://vcder/ActTea/sc/BaseSkill.png")
@abstract
extends Node
class_name BaseSkill

enum SKILL_TAG{ATTACK,DEFEND,MOVE,OTHER}
@export var weight:float=1
@export var main_tag:SKILL_TAG=SKILL_TAG.OTHER
@export var Tags:Array[SKILL_TAG]=[]

@abstract func play()->void
