class_name State_Carry extends State

@export var move_speed : float = 100.0
@export var throw_audio : AudioStream

var walking : bool = false
var throwable : Throwable

@onready var idle: State_Idle = $"../Idle"
@onready var stun: State_Stun = $"../Stun"



## what happens when we initialize this state?
func init() -> void:
	pass


## what happens when the player enters this state?
func Enter() -> void:
	player.update_animation( "carry" )
	walking = false
	pass


## what happens when the player exits this state?
func Exit() -> void:
	if throwable:
		if player.direction == Vector2.ZERO:
			throwable.throw_direction = player.cardinal_direction
		else:
			throwable.throw_direction = player.direction
		
		if state_machine.next_state == stun:
			throwable.throw_direction = throwable.throw_direction.rotated( PI )
			throwable.drop()
			pass
		else:
			player.audio.stream = throw_audio
			player.audio.play()
			throwable.throw()
			pass
		
		pass
	pass


##what happens during the _process update in this state?
func process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		walking = false
		player.update_animation( "carry" )
	elif player.setDirection() or walking == false:
		player.update_animation( "carry_walk" )
		walking = true
	
	player.velocity = player.direction * move_speed
	return null


##what happens with input events in this state?
func physics(_delta: float) -> State:
	return null


##what happens with input events in this state?
func Handleinput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack") or _event.is_action_pressed("interact"):
		return idle
	return null
