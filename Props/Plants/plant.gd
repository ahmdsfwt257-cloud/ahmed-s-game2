class_name Plant extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hit_box: HitBox = $HitBox


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hit_box.Damaged.connect( TakeDamage )
	pass


func TakeDamage( _damage : HurtBox ) -> void:
	animation_player.play( "destroy" )
	await animation_player.animation_finished
	queue_free()
	pass
