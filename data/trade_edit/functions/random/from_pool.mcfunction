# trade_edit:random/from_pool
# called with:
# 	storage working_pool
# declares:

execute store result score #rng_max trade_edit run data get storage trade_edit working_pool.total_weight
function trade_edit:random/next_random
scoreboard players operation #wp_weight trade_edit = #rng_val trade_edit
scoreboard players reset #rng_max trade_edit

function trade_edit:random/from_pool/iterate_elements
