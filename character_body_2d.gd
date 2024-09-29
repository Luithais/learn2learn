extends CharacterBody2D

@onready var animatedSprite = $AnimatedSprite2D

var speed = 3000.0
var tileSize = 32

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _physics_process(delta: float) -> void:
	
	var moveDir:Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	if moveDir.x != 0 && moveDir.y != 0:
		position += moveDir * (tileSize / 2)
		wait(0.5)
		
	#velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * speed * delta
	#move_and_slide()
	
	
	#Animation
	match [moveDir.x == -1, moveDir.x > -1 && moveDir.x < 0, moveDir.x == 0, moveDir.x > 0 && moveDir.x < 1,
	 moveDir.x == 1, moveDir.y == -1, moveDir.y > 1 && moveDir.y < 0, moveDir.y == 0, moveDir.y > 0 && moveDir.y < 1,
	 moveDir.y ==1]:
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
