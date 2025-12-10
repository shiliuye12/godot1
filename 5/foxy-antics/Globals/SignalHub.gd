extends Node

signal on_create_bullet(pos: Vector2, dir: Vector2, speed: float, ob_type: Constants.ObjectType)
signal on_create_object(pos: Vector2, ob_ject: Constants.ObjectType)
signal on_scored(points: int)
signal on_boss_killed
signal on_player_hit(lives: int, shake: bool)
signal on_level_complete(complete: bool)
