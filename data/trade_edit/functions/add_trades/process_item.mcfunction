# trade_edit:add_trades/process_item
# called with:
# 	storage working_item
# declares:
# 	storage working_range

# set count
data modify storage trade_edit working_range set from storage trade_edit working_item.Count
function trade_edit:random/from_range
data modify storage trade_edit working_item.Count set from storage trade_edit working_range
data remove storage trade_edit working_range

# back up current working_pool and add enchantments

data modify storage trade_edit working_pool_stashed set from storage trade_edit working_pool
data remove storage trade_edit working_pool

data modify storage trade_edit working_pool set from storage trade_edit working_item.enchantments
data modify storage trade_edit working_range set from storage trade_edit working_pool.rolls
function trade_edit:random/from_range
execute store result score #enchant_rolls trade_edit run data get storage trade_edit working_range
data remove storage trade_edit working_range

execute if score #enchant_rolls trade_edit matches 1.. run function trade_edit:add_trades/process_item/apply_enchantments

scoreboard players reset #enchant_rolls trade_edit

data modify storage trade_edit working_pool set from storage trade_edit working_pool_stashed
data remove storage trade_edit working_pool_stashed
