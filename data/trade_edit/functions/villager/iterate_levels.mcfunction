# trade_edit:villager/iterate_levels
# called by (villager/by_profession) with:
# 	var #wv_level
# 	storage to_add[]
# declares:

data remove storage trade_edit to_add[0]

scoreboard players remove #wv_level trade_edit 1
execute if score #wv_level trade_edit matches 1.. run function trade_edit:villager/iterate_levels
