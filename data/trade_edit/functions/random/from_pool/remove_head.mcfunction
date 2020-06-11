# trade_edit:random/from_pool/remove_head
# remove top element and modify pool total_weight
# called with:
# 	storage working_pool

execute store result score #wp_total_weight trade_edit run data get storage trade_edit working_pool.total_weight
execute store result score #wp_st_weight trade_edit run data get storage trade_edit working_pool.pool[0].weight

scoreboard players operation #wp_total_weight trade_edit -= #wp_st_weight trade_edit

execute store result storage trade_edit working_pool.total_weight int 1 run scoreboard players get #wp_total_weight trade_edit

data remove storage trade_edit working_pool.pool[0]

scoreboard players reset #wp_total_weight trade_edit
scoreboard players reset #wp_st_weight trade_edit
