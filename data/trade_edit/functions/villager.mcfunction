# trade_edit:villager
# called by (loop) with:
# declares:
# 	var #wv_level

execute store result score #wv_level trade_edit run data get entity @s VillagerData.level
execute unless score @s trade_edit >= #wv_level trade_edit run function trade_edit:villager/by_profession

scoreboard players reset #wv_level trade_edit
