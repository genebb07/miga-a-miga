extends CharacterBody2D

@export var speed = 150
var moveDirection = Vector2.ZERO

@onready var animationTree = $AnimationTree

func _ready():
	animationTree.active = true
	
func validateInput():
	moveDirection = Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	velocity = moveDirection * speed
	
func animationPlayer():
	if velocity.length() == 0:
		animationTree["parameters/conditions/Descansar"] = true
		animationTree["parameters/conditions/Caminar"] = false
	else:
		animationTree["parameters/Caminando/blend_position"] = moveDirection
		animationTree["parameters/Descansando/blend_position"] = moveDirection
		animationTree["parameters/conditions/Descansar"] = false
		animationTree["parameters/conditions/Caminar"] = true
		
func _physics_process(_delta):
	validateInput()
	animationPlayer()
	move_and_slide()
