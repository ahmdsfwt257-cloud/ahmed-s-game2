class_name State_Lift extends State

@export var lift_audio : AudioStream

@onready var carry: Node = $"../Carry"





## what happens when the player enters this state?
func Enter() -> void:
	player.update_animation( "lift" )
	player.animation_player.animation_finished.connect( state_complete )
	player.audio.stream = lift_audio
	player.audio.play()
	pass



## what happens when the player exits this state?
func Exit() -> void:
	pass


##what happens during the _process update in this state?
func process(_delta: float) -> State:
	player.velocity = Vector2.ZERO
	return null


##what happens with input events in this state?
func physics(_delta: float) -> State:
	return null


##what happens with input events in this state?
func Handleinput(_event: InputEvent) -> State:
	return null


func state_complete( _a : String ) -> void:
	player.animation_player.animation_finished.disconnect( state_complete )
	state_machine.change_state( carry )
	pass
