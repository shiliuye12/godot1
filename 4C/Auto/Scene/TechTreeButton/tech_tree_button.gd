extends Button

@export var recipes: Array[Recipe]
@export var tech_tree: TechTree
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var label: Label = $Label
@onready var recipe_data = preload("res://Resource/recipe_data.tres")
@export var ms = ""
var asset_number = 0
var can_js = true
var need_frz = 0

func _ready() -> void:
	label.text = ""
	if recipes:
		sprite_2d.texture = tech_tree.recipe.outitem.texture
	if tech_tree.itemCount1 != 0:
		asset_number += 1
	if tech_tree.itemCount2 != 0:
		asset_number += 1
	if tech_tree.itemCount3 != 0:
		asset_number += 1
	
	for i in recipe_data.recipes.size():
		if recipes:
			if recipe_data.recipes[i] == recipes[0]:
				can_js = false
	for i in recipes.size():
		if recipes:
			if recipes[i].outitem.name == "民居1":
				need_frz = 100
			if recipes[i].outitem.name == "官府1":
				need_frz = 1000
			if recipes[i].outitem.name == "皇宫":
				need_frz = 10000
			if recipes[i].outitem.name == "桥梁1":
				need_frz = 5000

func _on_pressed() -> void:
	for i in recipe_data.recipes.size():
		if recipes:
			if recipe_data.recipes[i] == recipes[0]:
				can_js = false
	Global.tech_tree_button_on.emit(tech_tree, can_js, recipes, need_frz)

func _on_mouse_entered() -> void:
	if recipes:
		label.text = ms

func _on_mouse_exited() -> void:
	if recipes:
		label.text = ""
