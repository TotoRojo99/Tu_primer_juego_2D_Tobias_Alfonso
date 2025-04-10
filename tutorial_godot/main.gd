extends Node

@export var mob_scene : PackedScene
var score

func _ready():
	New_Game()

func Game_Over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
func New_Game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	
func _on_start_timer_timeout():
	$ScoreTimer.start()
	$MobTimer.start()
	

func _on_score_timer_timeout():
	score += 1
	
func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()
	
	mob.position = mob_spawn_location.position
	var direction = mob_spawn_location.rotation + PI /2
	
	direction += randf_range(-PI/4, PI/4)
	mob.rotation = direction
	
	var velocity = Vector2(randf_range(150.0,250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
