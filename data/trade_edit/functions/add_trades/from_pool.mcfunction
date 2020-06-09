# trade_edit:add_trades/from_pool
# called by (add_trades) with:
# 	storage working_pool
# declares:
# 	var #wp_total_weight
# 	var #wp_weight

# get random number % total weight of pool
scoreboard players operation #rng_seed trade_edit *= #rng_mult trade_edit
scoreboard players operation #rng_seed trade_edit += #rng_inc trade_edit
scoreboard players operation #rng_seed trade_edit %= #rng_mod trade_edit
execute store result score #wp_total_weight trade_edit run data get storage trade_edit working_pool.total_weight
scoreboard players operation #wp_weight trade_edit = #rng_seed trade_edit
scoreboard players operation #wp_weight trade_edit %= #wp_total_weight trade_edit

# add trade at generated random weight
function trade_edit:add_trades/from_pool/iterate_trades
data modify entity @s Offers.Recipes append from storage trade_edit working_pool.pool[0]

scoreboard players reset #wp_weight trade_edit
scoreboard players reset #wp_total_weight trade_edit
