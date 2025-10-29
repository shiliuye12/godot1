extends PanelContainer

signal selected

@onready var name_lable: Label = $MarginContainer/VBoxContainer/PanelContainer/NameLable
@onready var description_lable: Label = $MarginContainer/VBoxContainer/Description_Lable

var disabled = false

func set_ability_upgrade(upgrade: AbilityUpgrade):
	name_lable.text = upgrade.name
	description_lable.text = upgrade.description
	
func play_in(delay: float = 0):
	modulate = Color.TRANSPARENT
	await get_tree().create_timer(delay).timeout
	$AnimationPlayer.play("in")

func play_discard():
	$AnimationPlayer.play("discard")

func select_card():
	disabled = true
	$AnimationPlayer.play("selected")
	
	for other_card in get_tree().get_nodes_in_group("upgrade_card"):
		if other_card == self:
			continue
		other_card.play_discard()
	
	await $AnimationPlayer.animation_finished
	selected.emit()

func _on_gui_input(event: InputEvent) -> void:
	if disabled:
		return
	if event.is_action_pressed("left_click"):
		select_card()


func _on_mouse_entered() -> void:
	if disabled:
		return
	$HoverAnimationPlayer.play("hover")
