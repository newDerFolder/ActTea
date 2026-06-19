class_name AttributeOverrideComponent extends Node

@export var attribute_table:ActTeaAttributeTableResource
@export var override_attribute_arr:Dictionary[String,Node]


func apply_attribute():
	if attribute_table == null:
		push_error("没有连接到一张属性表")
		return

	for key in override_attribute_arr:
		var node = override_attribute_arr[key]
		if not attribute_table.get_attribute_value_by_string(key):
			push_error("访问的ActTeaAttributeTableResource不存在此属性")
			return
		if node != null and key in node:
			node.set(key, attribute_table.get_attribute_value_by_string(key))
