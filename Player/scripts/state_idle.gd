class_name State_Idle  extends State

@onready var walk: State_walk = $"../Walk"
@onready var attack: State_Attack = $"../Attack"


## what happens when the player enters this state?
func Enter() -> void:
	player.UpdateAnimation("idle")
	pass


## what happens when the player exits this state?
func Exit() -> void:
	pass



##what happens during the _process update in this state?
func process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null


##what happens with input events in this state?
func physics(_delta: float) -> State:
	return null


##what happens with input events in this state?
func Handleinput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	if _event.is_action_pressed("interact"):
		PlayerManager.interact_pressed.emit() 
	return null
