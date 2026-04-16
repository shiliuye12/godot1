extends Control

@onready var label: Label = $ColorRect/MarginContainer/HBoxContainer/ColorRect/MarginContainer/VBoxContainer/Label
@onready var label_2: Label = $ColorRect/MarginContainer/HBoxContainer/ColorRect/MarginContainer/VBoxContainer/Label2
@onready var label_3: Label = $ColorRect/MarginContainer/HBoxContainer/ColorRect/MarginContainer/VBoxContainer/Label3
@onready var player_data = preload("res://Resource/player_data.tres")
@onready var recipe_data = preload("res://Resource/recipe_data.tres")
@onready var frz_label: Label = $ColorRect/Label
@onready var frz_label_2: Label = $ColorRect/Label2

const INTRODUCTION_UI = preload("uid://h2nfqjnn1d4n")

var _can_js = false
var _tech_tree
var _recipes
var _need_frz = 0
var introduction = null

func _ready() -> void:
	frz_label.text = "当前繁荣值：" + str(PlayerFrz.frz)
	frz_label_2.text = "需要繁荣值：0"
	Global.tech_tree_button_on.connect(_tech_tree_button_on)

func _tech_tree_button_on(tech_tree: TechTree, can_js: bool, recipes: Array, need_frz: int):
	if can_js:
		label.text = "未解锁"
		label_2.text = "可解锁：\n"
		for i in recipes.size():
			label_2.text += recipes[i].outitem.name + "\n"
		label_3.text = "需要材料:\n" + tech_tree.item1 + "X" + str(tech_tree.itemCount1) + "\n"
		if tech_tree.itemCount2 != 0:
			label_3.text += tech_tree.item2 + "X" + str(tech_tree.itemCount2) + "\n"
		if tech_tree.itemCount3 != 0:
			label_3.text += tech_tree.item3 + "X" + str(tech_tree.itemCount3)
	else :
		label.text = "已解锁"
		label_2.text = ""
		label_3.text = ""
	frz_label_2.text = "需要繁荣值：" + str(need_frz)
	_need_frz = need_frz
	_can_js = can_js
	_tech_tree = tech_tree
	_recipes = recipes

func _on_button_pressed() -> void:
	if _can_js:
		if PlayerFrz.frz >= _need_frz:
			if _tech_tree.itemCount1 != 0 and _tech_tree.itemCount2 == 0 and _tech_tree.itemCount3 == 0:
				for i in player_data.Slots.size():
					if player_data.Slots[i].item:
						if player_data.Slots[i].item.name == _tech_tree.item1 and \
						player_data.Slots[i].number >= _tech_tree.itemCount1:
							player_data.Slots[i].number -= _tech_tree.itemCount1
							for j in recipe_data.recipes.size():
								if recipe_data.recipes[j] == null:
									for z in _recipes.size():
										recipe_data.recipes[j] = _recipes[z]
										j += 1
									save_data()
									save_recipe_data()
									updata_ui()
									Global.recipe_change.emit()
									return
	
			elif _tech_tree.itemCount1 != 0 and _tech_tree.itemCount2 != 0 and _tech_tree.itemCount3 == 0:
				var a = 0
				var player_data_wz1 = 0
				var player_data_wz2 = 0
				for i in player_data.Slots.size():
					if player_data.Slots[i].item:
						if player_data.Slots[i].item.name == _tech_tree.item1 and \
						player_data.Slots[i].number >= _tech_tree.itemCount1:
							a += 1
							player_data_wz1 = i
						if player_data.Slots[i].item.name == _tech_tree.item2 and \
						player_data.Slots[i].number >= _tech_tree.itemCount2:
							a += 1
							player_data_wz2 = i
				if a == 2:
					player_data.Slots[player_data_wz1].number -= _tech_tree.itemCount1
					player_data.Slots[player_data_wz2].number -= _tech_tree.itemCount2
					for j in recipe_data.recipes.size():
						if recipe_data.recipes[j] == null:
							for z in _recipes.size():
								recipe_data.recipes[j] = _recipes[z]
								j += 1
							save_data()
							save_recipe_data()
							updata_ui()
							Global.recipe_change.emit()
							return
		
			elif _tech_tree.itemCount1 != 0 and _tech_tree.itemCount2 != 0 and _tech_tree.itemCount3 != 0:
				var a = 0
				var player_data_wz1 = 0
				var player_data_wz2 = 0
				var player_data_wz3 = 0
				for i in player_data.Slots.size():
					if player_data.Slots[i].item:
						if player_data.Slots[i].item.name == _tech_tree.item1 and \
						player_data.Slots[i].number >= _tech_tree.itemCount1:
							a += 1
							player_data_wz1 = i
						if player_data.Slots[i].item.name == _tech_tree.item2 and \
						player_data.Slots[i].number >= _tech_tree.itemCount2:
							a += 1
							player_data_wz2 = i
						if player_data.Slots[i].item.name == _tech_tree.item3 and \
						player_data.Slots[i].number >= _tech_tree.itemCount3:
							a += 1
							player_data_wz3 = i
				if a == 3:
					player_data.Slots[player_data_wz1].number -= _tech_tree.itemCount1
					player_data.Slots[player_data_wz2].number -= _tech_tree.itemCount2
					player_data.Slots[player_data_wz3].number -= _tech_tree.itemCount3
					if _tech_tree.itemCount1 == 1 and _tech_tree.itemCount2 == 1 and _tech_tree.itemCount3 == 1:
						if introduction == null:
							introduction = INTRODUCTION_UI.instantiate()
							add_child(introduction)
					for j in recipe_data.recipes.size():
						if recipe_data.recipes[j] == null:
							for z in _recipes.size():
								recipe_data.recipes[j] = _recipes[z]
								j += 1
							save_data()
							save_recipe_data()
							updata_ui()
							Global.recipe_change.emit()
							return

func updata_ui():
	label.text = "已解锁"
	label_2.text = ""
	label_3.text = ""

func save_data():
	ResourceSaver.save(player_data,"res://Resource/player_data.tres")

func save_recipe_data():
	pass
	ResourceSaver.save(recipe_data,"res://Resource/recipe_data.tres")
