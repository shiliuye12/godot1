extends Node

@export var items : Array[ItemResource]

func add_item(res: ItemResource):
	for i in items:
		if i.item_name == res.item_name:
			i.amount += res.amount
			return
	items.append(res.duplicate())
