# trade_edit:add_trades/from_pool/iterate_trades
# called by (add_trades/from_pool) with:
# 	storage working_pool
# 	var #wp_weight
# declares:
# 	var #wp_wt_weight

# subtract current trade's weight from total weight
execute store result score #wp_wt_weight trade_edit run data get storage trade_edit working_pool.pool[0].weight
scoreboard players operation #wp_weight trade_edit -= #wp_wt_weight trade_edit

scoreboard players reset #wp_wt_weight trade_edit

# remove data, recurse if not selected
execute if score #wp_weight trade_edit matches 0.. run data remove storage trade_edit working_pool.pool[0]
execute if score #wp_weight trade_edit matches 0.. if data storage trade_edit working_pool.pool[0] run function trade_edit:add_trades/from_pool/iterate_trades
