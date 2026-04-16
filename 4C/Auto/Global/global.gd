extends Node

signal button_on
signal button_off
signal items_change(items_data: Dictionary)
signal ui_items_change(slot: Slot)
signal item_on(item:item)
signal tech_tree_button_on(tech_tree: TechTree, can_js: bool, recipes: Array, need_frz: int)
signal recipe_change()
