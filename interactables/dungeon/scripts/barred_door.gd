class_name BarredDoor extends Node2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var required_plates: int = 1
var activated_plates: int = 0
var is_open: bool = false

func _ready() -> void:
	# Automatically calculate required plates based on connected signals
	var count = 0
	for conn in get_incoming_connections():
		if conn["callable"].get_method() == "open_door":
			count += 1
	
	if count > 0:
		required_plates = count

func open_door() -> void:
	activated_plates += 1
	if activated_plates >= required_plates and not is_open:
		is_open = true
		animation_player.call_deferred("play", "open_door")

func close_door() -> void:
	activated_plates -= 1
	if activated_plates < required_plates and is_open:
		is_open = false
		animation_player.call_deferred("play", "close_door")
