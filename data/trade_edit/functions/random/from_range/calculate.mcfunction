# trade_edit:random/from_range/calculate
# called by (random/from_range) with:
# 	var #rng_min
# 	var #rng_max

# adjust max to take min into account
scoreboard players operation #rng_max trade_edit -= #rng_min trade_edit
scoreboard players add #rng_max trade_edit 1

function trade_edit:random/next_random
scoreboard players operation #rng_val trade_edit += #rng_min trade_edit

execute store result storage trade_edit working_range int 1 run scoreboard players get #rng_val trade_edit
