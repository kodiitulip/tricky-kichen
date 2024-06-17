extends CharacterBody2D
class_name Character

@export var animation_tree: AnimationTree

@export var cur_dir: Vector2 = Vector2.ZERO
@export var max_speed: float = 150.0
@export var min_speed: float = 100.0
var cur_speed: float

func _ready() -> void:
	cur_speed = min_speed


func _physics_process(_delta: float) -> void:
	update_velocity(cur_dir)
	update_sprite_anim(cur_dir)
	
	move_and_slide()


func update_velocity(dir: Vector2) -> void:
	velocity = dir * cur_speed


func update_sprite_anim(dir: Vector2) -> void:
	if not animation_tree:
		return
	
	if not dir or dir.is_zero_approx():
		animation_tree.set("parameters/conditions/is_walking", false)
		animation_tree.set("parameters/conditions/is_idle", true)
		return
	
	
	animation_tree.set("parameters/conditions/is_idle", false)
	animation_tree.set("parameters/conditions/is_walking", true)
	
	animation_tree.set("parameters/Idle/blend_position", dir.normalized())
	animation_tree.set("parameters/Walk/blend_position", dir.normalized())
