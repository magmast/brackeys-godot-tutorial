extends Node2D


const SPEED := 60.0
const GRAVITY := 100.0


@onready var sprite := $AnimatedSprite2D
@onready var ray_cast_right := $RayCastRight
@onready var ray_cast_left := $RayCastLeft
@onready var ray_cast_top := $RayCastTop
@onready var kill_zone := $KillZone


var direction := 1.0
var dying := false


func _process(delta: float) -> void:
	if dying:
		position.y += delta * GRAVITY
		if position.y > 500:
			queue_free()
		return
	
	if ray_cast_top.is_colliding():
		dying = true
		sprite.play('die')
		kill_zone.queue_free()
		return
	
	if ray_cast_right.is_colliding():
		direction = -1
		sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		sprite.flip_h = false

	position.x += SPEED * delta * direction
