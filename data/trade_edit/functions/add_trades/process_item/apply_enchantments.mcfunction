# trade_edit:add_trades/process_item/apply_enchantments
# called by (add_trades/process_item) with:
# 	storage working_item
# 	storage working_pool
# 	var #enchant_rolls

function trade_edit:random/from_pool

data modify storage trade_edit working_range set from storage trade_edit working_pool.pool[0].lvl
function trade_edit:random/from_range
data modify storage trade_edit working_pool.pool[0].lvl set from storage trade_edit working_range
data remove storage trade_edit working_range

data remove storage trade_edit working_pool.pool[0].weight

data modify storage trade_edit working_item.tag.Enchantments append from storage trade_edit working_pool.pool[0]

function trade_edit:random/from_pool/remove_head

scoreboard players remove #enchant_rolls trade_edit 1
execute if score #enchant_rolls trade_edit matches 1.. if data storage trade_edit working_pool.pool[0] run function trade_edit:add_trades/process_item/apply_enchantments
