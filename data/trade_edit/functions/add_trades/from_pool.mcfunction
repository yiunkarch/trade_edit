# trade_edit:add_trades/from_pool
# called by (add_trades) with:
# 	storage working_pool
#	var #wp_rolls
# declares:
# 	var #wp_total_weight
# 	var #wp_weight
# 	var #wp_st_weight

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

# remove selected trade from list and modify pool total_weight so it is not selected again
execute store result score #wp_st_weight trade_edit run data get storage trade_edit working_pool.pool[0].weight
scoreboard players operation #wp_total_weight trade_edit -= #wp_st_weight trade_edit
execute store result storage trade_edit working_pool.total_weight int 1 run scoreboard players get #wp_total_weight trade_edit
data remove storage trade_edit working_pool.pool[0]

scoreboard players reset #wp_st_weight trade_edit
scoreboard players reset #wp_weight trade_edit
scoreboard players reset #wp_total_weight trade_edit

# repeat if more rolls remain
scoreboard players remove #wp_rolls trade_edit 1
execute if score #wp_rolls trade_edit matches 1.. if data storage trade_edit working_pool.pool[0] run function trade_edit:add_trades/from_pool
