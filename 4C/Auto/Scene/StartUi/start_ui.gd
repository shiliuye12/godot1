extends Control

var number = 1

@onready var label: Label = $ColorRect/MarginContainer/ColorRect/MarginContainer/VBoxContainer/Label
@onready var label_2: Label = $ColorRect/MarginContainer/ColorRect/MarginContainer/VBoxContainer/Label2
@onready var button_label: Label = $ColorRect/MarginContainer/ColorRect/MarginContainer/VBoxContainer/Button/Label

func _on_button_pressed() -> void:
	label.text = "按键说明"
	label_2.text = "向上移动： W                       一键整理： Q\n向下移动： S                        旋转物体： R\n向左移动： A                        打开背包： E\n向右移动： D                        关闭页面： Esc\n视角缩放： 鼠标滚轮           暂停游戏： F"
	button_label.text = "开始游戏"
	if number == 1:
		number += 1
	else:
		ChangeScence.to_main()
