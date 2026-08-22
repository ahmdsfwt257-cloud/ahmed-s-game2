class_name Quest extends Resource


@export var title : String
@export_multiline var description : String

@export var steps : Array[ String ]

@export var reward_xp : int
@export var reward_items : Array[ QuestRewardItem ] = []
@export var react_to_global_signal : bool = false

var is_activated : bool = false
