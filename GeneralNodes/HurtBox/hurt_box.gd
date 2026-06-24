class_name HurtBox extends Area2D

signal  did_damaged

@export var damage : int = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect( AreaEntered )
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process( _delta ):
	pass


func AreaEntered( a : Area2D ) -> void:
	if a is HitBox:
		did_damaged.emit()
		a.TakeDamage( self )
	pass
