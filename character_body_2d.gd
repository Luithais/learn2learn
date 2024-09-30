extends CharacterBody2D

@onready var animatedSprite = $AnimatedSprite2D
@onready var timer = $MovementPause

var tileSize = 512
var newPos = 0

func _ready():
	position = position.snapped(Vector2.ONE * tileSize)
	position += Vector2.ONE * tileSize/2

func _on_movement_pause_timeout() -> void:
	get_tree().paused = false

func move():
	position = newPos
	get_tree().paused = true
	timer.start()

func _physics_process(delta: float) -> void:
		
	var moveDir:Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	newPos = position + moveDir * tileSize / 2
	
	
	match [moveDir.x == 0, moveDir.y == 0]:
		[false, false]:
			move()
		[true, false]:
			move()
		[false, true]:
			move()
			
	#Animation
	match [moveDir.x == -1, moveDir.x > -1 && moveDir.x < 0, moveDir.x == 0, moveDir.x > 0 && moveDir.x < 1,
	 moveDir.x == 1, moveDir.y == -1, moveDir.y > -1 && moveDir.y < 0, moveDir.y == 0, moveDir.y > 0 && moveDir.y < 1, moveDir.y ==1]:
		[false, false, true, false, false, true, false, false, false, false]:
			animatedSprite.animation = "runN"
		[false, false, false, true, false, false, true, false, false, false]:
			animatedSprite.animation = "runNE"
		[false, false, false, false, true, false, false, true, false, false]:
			animatedSprite.animation = "runE"
		[false, false, false, true, false, false, false, false, true, false]:
			animatedSprite.animation = "runSE"
		[false, false, true, false, false, false, false, false, false, true]:
			animatedSprite.animation = "runS"
		[false, true, false, false, false, false, false, false, true, false]:
			animatedSprite.animation = "runSW"
		[true, false, false, false, false, false, false, true, false, false]:
			animatedSprite.animation = "runW"
		[false, true, false, false, false, false, true, false, false, false]:
			animatedSprite.animation = "runNW"
	
	#N = 0,-1
	#NE = .7, -.7
	#E = 1, 0
	#SE = .7,.7
	#S = 0,1,
	#SW = -.7,.7
	#W = -1, 0
	#NW = -.7, -.7	
