extends Node

const POKE_BALLS = preload("uid://bsy8sqes432ii")
const POKE_BALLS_2 = preload("uid://4m8p8i0rkd3e")
const GREAT_BALL = preload("uid://convy5ecx6ied")
const GREAT_BALL_2 = preload("uid://bjpa2att5j86i")
const ULTRA_BALL = preload("uid://ckp1l7gb5f3q0")
const ULTRA_BALL_2 = preload("uid://bqs48ljnns083")
const MASTER_BALL = preload("uid://kxqru0bfknou")
const MASTER_BALL_2 = preload("uid://cgoinpu6laldd")

const HYPER_POTION = preload("uid://cnbt75mj8px8l")
const MAX_POTION = preload("uid://bj5stqh3stsxi")
const POTION = preload("uid://csm8gisrn5nb6")
const SUPER_POTION = preload("uid://bjmf3y7ke3igd")

class poke_ball:
	var name = "精灵球"
	var text = "收服宝可梦的基础道具"
	var bzl: float = 1.0
	var tp = POKE_BALLS
	var tp2 = POKE_BALLS_2

class great_ball:
	var name = "超级球"
	var text = "捕获率更高的精灵球"
	var bzl: float= 1.5
	var tp = GREAT_BALL
	var tp2 = GREAT_BALL_2

class ultra_ball:
	var name = "高级球"
	var text = "捕获率超高的强力精灵球"
	var bzl: float= 2
	var tp = ULTRA_BALL
	var tp2 = ULTRA_BALL_2

class master_ball:
	var name = "大师球"
	var text = "传说中的精灵球，必定捕捉\n成功"
	var bzl: float= 9999
	var tp = MASTER_BALL
	var tp2 = MASTER_BALL_2

class potion:
	var name = "伤药"
	var text = "恢复20HP"
	var hf = 20
	var tp = POTION

class super_potion:
	var name = "好伤药"
	var text = "恢复50HP"
	var hf = 50
	var tp = SUPER_POTION

class hyper_potion:
	var name = "厉害伤药"
	var text = "恢复100HP"
	var hf = 100
	var tp = HYPER_POTION

class max_potion:
	var name = "全满药"
	var text = "恢复全部HP"
	var hf = 99999
	var tp = MAX_POTION

var ball_arr: Array = [poke_ball, great_ball, ultra_ball, master_ball]
var dj_arr: Array = [potion, super_potion, hyper_potion, max_potion]
