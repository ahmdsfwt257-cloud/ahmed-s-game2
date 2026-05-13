class_name EnemyState extends Node


## Stores a reference to the enemy that this stete belongs to
var enemy : Enemy
var state_machine : EnemyStateMachine


##what happens when initialize this statea
func _initialize() -> void:
	pass


## what happens when enemy enters this state?
func enter() -> void:
	pass


## what happens when the enemy exits this State?
func exit() -> void:
	pass


## what happens during the _process update in this State?
func process( _delta: float) -> EnemyState:
	return null


## what happens durnig _physics_process update in this state?
func physics(_delta: float) -> EnemyState:
	return null
