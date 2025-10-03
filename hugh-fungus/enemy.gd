extends CharacterBody2D
var player_detected = false
var direction
var player
var SPEED = 150


enum state {
	IDLE,
	CHASE,
	WANDER,
	ATTACK,
	}
@onready var current_state = state.IDLE

func _physics_process(delta: float) -> void:
	match current_state:
		state.IDLE:
			handle_idle(delta)
		state.WANDER:
			handle_wander(delta)
		state.ATTACK:
			handle_attack(delta)
		state.CHASE:
			handle_chase(delta)

	
	
		
	
func handle_idle(_delta):
	velocity = Vector2.ZERO
	move_and_slide()

func handle_chase(_delta):
	if player_detected == true:
		direction =  (player.global_position - self.global_position).normalized()
		velocity = direction * SPEED
	move_and_slide()

func handle_wander(_delta):
	if player_detected == false:
		direction = (random_direction.global_position - self.global_position).normalized()



func randomize_direction():

func _on_player_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_detected = true
		player = body 
		
func _on_player_detection_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_detected = false
		player = null
