extends Node

func typekz(player_type: String, enemy_type: String):
	if enemy_type == "无":
		return 1
	if player_type == "一般":
		if enemy_type == "岩石" or enemy_type == "钢":
			return 0.5
		elif enemy_type == "幽灵":
			return 0
		else:
			return 1
	if player_type == "火":
		if enemy_type == "火" or enemy_type == "水" or enemy_type == "岩石" or enemy_type == "龙":
			return 0.5
		elif enemy_type == "草" or enemy_type == "冰" or enemy_type == "虫" or enemy_type == "钢":
			return 2
		else:
			return 1
	if player_type == "水":
		if enemy_type == "水" or enemy_type == "草" or enemy_type == "龙":
			return 0.5
		elif enemy_type == "火" or enemy_type == "地面" or enemy_type == "岩石":
			return 2
		else:
			return 1
	if player_type == "电":
		if enemy_type == "电" or enemy_type == "草" or enemy_type == "龙":
			return 0.5
		elif enemy_type == "水" or enemy_type == "飞行":
			return 2
		elif enemy_type == "地面":
			return 0
		else:
			return 1
	if player_type == "草":
		if enemy_type == "火" or enemy_type == "草" or enemy_type == "飞行" or enemy_type == "虫" or enemy_type == "龙" or enemy_type == "钢":
			return 0.5
		elif enemy_type == "水" or enemy_type == "地面" or enemy_type == "岩石":
			return 2
		else:
			return 1
	if player_type == "冰":
		if enemy_type == "火" or enemy_type == "水" or enemy_type == "冰" or enemy_type == "钢":
			return 0.5
		elif enemy_type == "草" or enemy_type == "地面" or enemy_type == "飞行" or enemy_type == "龙":
			return 2
		else:
			return 1
	if player_type == "格斗":
		if enemy_type == "一般" or enemy_type == "冰" or enemy_type == "岩石" or enemy_type == "恶" or enemy_type == "钢":
			return 2
		elif enemy_type == "毒" or enemy_type == "飞行" or enemy_type == "超能" or enemy_type == "虫" or enemy_type == "妖精":
			return 0.5
		elif enemy_type == "幽灵":
			return 0
		else:
			return 1
	if player_type == "毒":
		if enemy_type == "草" or enemy_type == "妖精":
			return 2
		elif enemy_type == "毒" or enemy_type == "地面" or enemy_type == "岩石" or enemy_type == "幽灵":
			return 0.5
		elif  enemy_type == "钢":
			return 0
		else:
			return 1
	if player_type == "地面":
		if enemy_type == "火" or enemy_type == "电" or enemy_type == "毒" or enemy_type == "岩石" or enemy_type == "钢":
			return 2
		elif enemy_type == "草" or enemy_type == "虫":
			return 0.5
		elif enemy_type == "飞行":
			return 0
		else:
			return 1
	if player_type == "飞行":
		if enemy_type == "草" or enemy_type == "格斗" or enemy_type == "虫":
			return 2
		elif enemy_type == "电" or enemy_type == "岩石" or enemy_type == "钢":
			return 0.5
		else:
			return 1
	if player_type == "超能":
		if enemy_type == "格斗" or enemy_type == "毒":
			return 2
		elif enemy_type == "超能" or enemy_type == "钢":
			return 0.5
		elif enemy_type == "恶":
			return 0
		else:
			return 1
	if player_type == "虫":
		if enemy_type == "草" or enemy_type == "超能" or enemy_type == "恶":
			return 2
		elif enemy_type == "火" or enemy_type == "格斗" or enemy_type == "飞行" or enemy_type == "毒" or enemy_type == "幽灵" or enemy_type == "钢" or enemy_type == "妖精":
			return 0.5
		else:
			return 1
	if player_type == "岩石":
		if enemy_type == "火" or enemy_type == "冰" or enemy_type == "飞行" or enemy_type == "虫":
			return 2
		elif enemy_type == "格斗" or enemy_type == "地面" or enemy_type == "钢":
			return 0.5
		else:
			return 1
	if player_type == "幽灵":
		if enemy_type == "超能" or enemy_type == "幽灵":
			return 2
		elif enemy_type == "恶":
			return 0.5
		elif enemy_type == "一般":
			return 0
		else:
			return 1
	if player_type == "龙":
		if enemy_type == "龙":
			return 2
		elif enemy_type == "钢":
			return 0.5
		elif enemy_type == "妖精":
			return 0
		else:
			return 1
	if player_type == "恶":
		if enemy_type == "超能" or enemy_type == "幽灵":
			return 2
		elif enemy_type == "格斗" or enemy_type == "恶" or enemy_type == "妖精":
			return 0.5
		else:
			return 1
	if player_type == "钢":
		if enemy_type == "火" or enemy_type == "水" or enemy_type == "电" or enemy_type == "钢":
			return 0.5
		elif enemy_type == "冰" or enemy_type == "岩石" or enemy_type == "妖精":
			return 2
		else:
			return 1
	if player_type == "妖精":
		if enemy_type == "火" or enemy_type == "毒" or enemy_type == "钢":
			return 0.5
		elif enemy_type == "格斗" or enemy_type == "龙" or enemy_type == "恶":
			return 2
		else:
			return 1

func sj_dot(move: String, fy_pokemon: Node2D):
	var dot_num = 0
	if move == "寄生种子" and fy_pokemon.type != "草" and fy_pokemon.type_2 != "草" and fy_pokemon.dq_dot != "寄生种子":
		fy_pokemon.dq_dot = move
		fy_pokemon.dq_dot_hh = 999
		dot_num = 1
	if move == "毒粉" and fy_pokemon.type != "毒" and fy_pokemon.type_2 != "毒" and fy_pokemon.dq_dot != "毒粉":
		fy_pokemon.dq_dot = move
		fy_pokemon.dq_dot_hh = 999
		dot_num = 1
	
	return dot_num

func jc_dot(gj_pokemon: Node2D, fy_pokemon: Node2D):
	if fy_pokemon.dq_dot == "寄生种子" and fy_pokemon.dq_dot_hh > 0:
		fy_pokemon.dq_dot_hh -= 1
		var a = fy_pokemon.max_hp / 8
		fy_pokemon.hp -= a
		gj_pokemon.hp += a
		if fy_pokemon.hp <= 0 :
			fy_pokemon.hp = 0
		if gj_pokemon.hp > gj_pokemon.max_hp:
			gj_pokemon.hp = gj_pokemon.max_hp
		return "寄生状态"
	if fy_pokemon.dq_dot == "毒粉" and fy_pokemon.dq_dot_hh > 0:
		fy_pokemon.dq_dot_hh -= 1
		var a = fy_pokemon.max_hp / 8
		fy_pokemon.hp -= a
		if fy_pokemon.hp <= 0 :
			fy_pokemon.hp = 0
		return "中毒状态"

#region
class zhua:
	var name = "抓"
	var type = "一般"
	var pp = 35
	var power = 40
	var accuracy = 100

class huohua:
	var name = "火花"
	var type = "火"
	var pp = 25
	var power = 40
	var accuracy = 100

class longxi:
	var name = "龙息"
	var type = "龙"
	var pp = 20
	var power = 60
	var accuracy = 100

class  zhuangji:
	var name = "撞击"
	var type = "一般"
	var pp = 35
	var power = 40
	var accuracy = 100

class tengbian:
	var name = "藤鞭"
	var type = "草"
	var pp = 25
	var power = 45
	var accuracy = 100

class shuiqiang:
	var name = "水枪"
	var type = "水"
	var pp = 25
	var power = 40
	var accuracy = 100

class gaosuxuanzhuan:
	var name = "高速旋转"
	var type = "水"
	var pp = 40
	var power = 50
	var accuracy = 100

class feiyekuaidao:
	var name = "飞叶快刀"
	var type = "草"
	var pp = 25
	var power = 55
	var accuracy = 95

#endregion

#region

class jiaosheng:
	var name = "叫声"
	var type = "一般"
	var pp = 40
	var power = 0
	var accuracy = 100
	var lx = "降低"
	var lx_sx = "防御"
	var lx_sx_lv = 0.1

class yanwu:
	var name = "烟雾"
	var type = "一般"
	var pp = 20
	var power = 0
	var accuracy = 100
	var lx = "降低"
	var lx_sx = "速度"
	var lx_sx_lv = 0.1

class shengzhang:
	var name = "生长"
	var type = "一般"
	var pp = 20
	var power = 0
	var accuracy = 200
	var lx = "提升"
	var lx_sx = "攻击"
	var lx_sx_lv = 0.1

class jishengzhongzi:
	var name = "寄生种子"
	var type = "草"
	var pp = 10
	var power = 0
	var accuracy = 90
	var lx = "dot"
	var lx_sx = "寄生种子"
	var lx_sx_lv = 1

class yaoweiba:
	var name = "摇尾巴"
	var type = "一般"
	var pp = 30
	var power = 0
	var accuracy = 100
	var lx = "降低"
	var lx_sx = "防御"
	var lx_sx_lv = 0.1

class suorukezhong:
	var name = "缩入壳中"
	var type = "一般"
	var pp = 40
	var power = 0
	var accuracy = 100
	var lx = "提升"
	var lx_sx = "防御"
	var lx_sx_lv = 0.1

class dufen:
	var name = "毒粉"
	var type = "毒"
	var pp = 35
	var power = 0
	var accuracy = 75
	var lx = "dot"
	var lx_sx = "毒"
	var lx_sx_lv = 1

#endregion

var charmander_movelist: Array = [zhua, jiaosheng, huohua, yanwu, longxi]
var bulbasaur_movelist: Array = [zhuangji, jiaosheng, tengbian, shengzhang, jishengzhongzi, feiyekuaidao, dufen]
var squirtle_movelist: Array = [zhuangji, yaoweiba, shuiqiang, suorukezhong, gaosuxuanzhuan]
