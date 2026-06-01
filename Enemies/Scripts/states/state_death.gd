class_name State_Death extends State

@export var exhaust_audio : AudioStream
@onready var audio : AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"



## what happens when we initialize this state?
func init() -> void:
	pass


## what happens when the player enters this state?
func Enter() -> void:
	player.animation_player.play("death")
	audio.stream = exhaust_audio
	audio.play()
	PlayerHud.show_game_over_screen()
	AudioManager.play_music( null )
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
