class_name ActTeaAttributeTableResource extends Resource

@export var attribute_table:Dictionary[String,Variant]


func get_attribute_value_by_string(name:String):
	if not attribute_table.has(name):
		return null
	return attribute_table[name]
