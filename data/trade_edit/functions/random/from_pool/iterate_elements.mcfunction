# trade_edit:random/from_pool/iterate_elements
# called by (random/from_pool) with:
# 	storage working_pool
# 	var #we_weight
# declares:

# subtract current element's weight from total weight
execute store result score #we_weight trade_edit run data get storage trade_edit working_pool.pool[0].weight
scoreboard players operation #wp_weight trade_edit -= #we_weight trade_edit

scoreboard players reset #we_weight trade_edit

# move element to end of list
execute if score #wp_weight trade_edit matches 0.. run data modify storage trade_edit working_pool.pool append from storage trade_edit working_pool.pool[0]
execute if score #wp_weight trade_edit matches 0.. run data remove storage trade_edit working_pool.pool[0]

execute if score #wp_weight trade_edit matches 0.. if data storage trade_edit working_pool.pool[0] run function trade_edit:random/from_pool/iterate_elements
