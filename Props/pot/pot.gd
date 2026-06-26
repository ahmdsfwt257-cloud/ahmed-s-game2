class_name Pot extends Node2D

@export_category("Item Drops")
@export var drops: Array[DropData]

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	if animation_player:
		animation_player.animation_started.connect(_on_animation_started)

func _on_animation_started(anim_name: String) -> void:
	if anim_name == "destroy":
		drop_items()

func drop_items() -> void:
	if drops.size() == 0:
		return
	
	const PICKUP = preload("res://Items/item_pickup/item_pickup.tscn")
	for i in drops.size():
		if drops[i] == null or drops[i].item == null:
			continue
		var drop_count: int = drops[i].get_drop_count()
		for j in drop_count:
			var drop: Node2D = PICKUP.instantiate() as Node2D
			drop.item_data = drops[i].item
			get_parent().call_deferred("add_child", drop)
			drop.global_position = global_position
			drop.velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * 50 * randf_range(0.9, 1.5)
