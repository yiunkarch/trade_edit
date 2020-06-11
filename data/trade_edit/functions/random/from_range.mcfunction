# trade_edit:random/from_range
# called with:
# 	storage working_range
# declares:
# 	var #rng_min
# 	var #rng_max

execute if data storage trade_edit working_range.min store result score #rng_min trade_edit run data get storage trade_edit working_range.min
execute store result score #rng_max trade_edit run data get storage trade_edit working_range.max

execute if data storage trade_edit working_range.max if score #rng_min trade_edit <= #rng_max trade_edit run function trade_edit:random/from_range/calculate

scoreboard players reset #rng_min trade_edit
scoreboard players reset #rng_max trade_edit
