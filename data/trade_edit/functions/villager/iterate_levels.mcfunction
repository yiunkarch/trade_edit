# trade_edit:villager/iterate_levels

data remove storage trade_edit to_add[0]

scoreboard players remove #wv_level trade_edit 1
execute if score #wv_level trade_edit matches 1.. run function trade_edit:villager/iterate_levels
