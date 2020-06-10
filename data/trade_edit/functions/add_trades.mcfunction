# trade_edit:add_trades
# called by (villager, wandering_trader) with:
# 	storage to_add
# declares:
# 	storage working_pool
#	var #wp_rolls

# set working_pool to first item in list, and add trades from there
data modify storage trade_edit working_pool set from storage trade_edit to_add[0]
execute store result score #wp_rolls trade_edit run data get storage trade_edit working_pool.rolls
execute if score #wp_rolls trade_edit matches 1.. run function trade_edit:add_trades/from_pool
scoreboard players reset #wp_rolls trade_edit

data remove storage trade_edit to_add[0]
execute if data storage trade_edit to_add[0] run function trade_edit:add_trades

data remove storage trade_edit working_pool
