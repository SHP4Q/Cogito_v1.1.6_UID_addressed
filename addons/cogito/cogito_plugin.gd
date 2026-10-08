@tool
extends EditorPlugin
const cogito_plugin_icon : Texture2D = preload("uid://dmsvte7we1qau")#("./Cogito.svg")
const cogito_default_settings = preload("uid://ds73ojp51jrk0")#("./CogitoSettings.tres")

var cog_settings : CogitoSettings

var parser_plugin: EditorTranslationParserPlugin

func _enter_tree():
	add_autoload_singleton("CogitoGlobals", "uid://d0q71mnw6am11")
	add_autoload_singleton("CogitoSceneManager", "uid://dwd61hyssfy55")
	add_autoload_singleton("CogitoQuestManager", "uid://c33l80dv3c6c5")
	add_autoload_singleton("MenuTemplateManager", "uid://dru131jwwih1y")
	
	#add_autoload_singleton("CogitoGlobals", "/cogito_globals.gd")
	#add_autoload_singleton("CogitoSceneManager", "/SceneManagement/cogito_scene_manager.gd")
	#add_autoload_singleton("CogitoQuestManager", "/QuestSystem/cogito_quest_manager.gd")
	#add_autoload_singleton("MenuTemplateManager", "/EasyMenus/Nodes/menu_template_manager.tscn")
	
	# Initialization of the plugin goes here.
	parser_plugin = load("uid://di7obh0omp56y").new()#("res://addons/cogito/Localization/scripts/loc_resource_parser.gd").new()
	add_translation_parser_plugin(parser_plugin)
	
	cog_settings = cogito_default_settings
	

func _exit_tree():
	remove_autoload_singleton("CogitoQuestManager")
	remove_autoload_singleton("MenuTemplateManager")
	remove_autoload_singleton("CogitoSceneManager")
	remove_autoload_singleton("CogitoGlobals")
	
	remove_translation_parser_plugin(parser_plugin)



func _get_plugin_name():
	return "Cogito"


func _get_plugin_icon():
	return cogito_plugin_icon
