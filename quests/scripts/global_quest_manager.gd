## Quest Manager - GLOBAL SCRIPT
extends Node

signal quest_updated( q )

const QUEST_DATA_LOCATION : String = "res://quests/"

var quests : Array[ Quest ]
var current_quests : Array = [
	{ title = "Recover Lost Magical Flute", is_complete = false, completed_steps = [''] },
	{ title = "Long quest", is_complete = false, completed_steps = [''] }
]


func _ready() -> void:
	#gather all quests
	gather_quest_data()
	pass



func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("test"):
		#print( find_quest(load("res://quests/recover_lost_flute.tres") as Quest ) )
		#print( find_quest_by_title( "Short Quest" ) )
		#print( "get_quest_index_by_title():", get_quest_index_by_title("Recover Lost Magical Flute") )
		#print( "get_quest_index_by_title():", get_quest_index_by_title("Short quest") )
		
		print( "before: ", current_quests )
		#update_quest( "Short quest" )
		#update_quest( "Recover Lost Magical Flute", "Find the magical flute" )
		update_quest( "long quest", "", true  )
		print( "after: ", current_quests )
		print("==============================")
		pass
	pass



func gather_quest_data() -> void:
	#gather all quest resources and add to quest array
	var quest_files : PackedStringArray = DirAccess.get_files_at( QUEST_DATA_LOCATION )
	quests.clear()
	for q in quest_files:
		quests.append( load( QUEST_DATA_LOCATION + "/" + q ) as Quest )
		pass
	print( "quest count:", quests.size() )
	pass



#Update the status of a quest
func update_quest( _title : String, _completed_step : String = "", _is_complete : bool = false ) -> void:
	var quest_index : int = get_quest_index_by_title( _title )
	if quest_index == -1:
		# Quest was not found - add in to the current quests array
		var new_quest : Dictionary = {
				 title = _title,
				_is_complete = _completed_step,
				_completed_step = []
		 }
		
		if _completed_step != "":
			new_quest.completed_step.append( _completed_step )
		
		current_quests.append( new_quest )
		quest_updated.emit( new_quest )
		
		# Display a notification that quest was added
		pass
	else:
		# Quest was found, update it
		var q = current_quests[ quest_index ]
		if _completed_step != "" and q.completed_steps.has( _completed_step ) == false:
			q.completed_steps.append( _completed_step )
			pass
		q.is_complete = _is_complete
		
		quest_updated.emit( q )
		
		# Display a notification that quests was updated OR completed
	pass



func disperse_quest_rewards() -> void:
	# give XP and item rewards to player
	pass



# Provide a quest and return the current quest associated with it
func find_quest( _quest : Quest ) -> Dictionary:
	for q in current_quests:
		if q.title.to_lower() == _quest.title.to_lower():
			return q
	return { title = " not found ", is_complete = false, completed_steps = [''] }



# Take title and find associated quest resource
func find_quest_by_title( _title : String ) -> Quest:
	for q in quests:
		if q.title.to_lower() == _title.to_lower():
			return q
	return null



# Find quest by title name, and return index in current quest array
func get_quest_index_by_title( _title : String ) -> int:
	for i in current_quests.size():
		if current_quests[ i ].title.to_lower() == _title.to_lower():
			return i 
	# Return a -1 if we didn't find a quest with
	# a matching title in our array
	return -1



func sort_quests() -> void:
	pass
