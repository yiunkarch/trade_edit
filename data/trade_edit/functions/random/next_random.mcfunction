# trade_edit:next_random
# generate random with LCG system and store in var #rng_val
# called with:
# 	var #rng_max
# declares:
# 	var #rng_val

scoreboard players operation #rng_seed trade_edit *= #rng_mult trade_edit
scoreboard players operation #rng_seed trade_edit += #rng_inc trade_edit
scoreboard players operation #rng_seed trade_edit %= #rng_mod trade_edit

scoreboard players reset #rng_val trade_edit
scoreboard players operation #rng_val trade_edit = #rng_seed trade_edit
scoreboard players operation #rng_val trade_edit %= #rng_max trade_edit
