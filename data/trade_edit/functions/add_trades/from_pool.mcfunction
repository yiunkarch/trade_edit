# trade_edit:add_trades/from_pool
# called by (add_trades) with:
# 	storage working_pool
#	var #wp_rolls
# declares:
# 	storage working_item

function trade_edit:random/from_pool

# apply functions on trade items

data modify storage trade_edit working_item set from storage trade_edit working_pool.pool[0].buy
function trade_edit:add_trades/process_item
data modify storage trade_edit working_pool.pool[0].buy set from storage trade_edit working_item
data remove storage trade_edit working_item
data modify storage trade_edit working_item set from storage trade_edit working_pool.pool[0].buyB
function trade_edit:add_trades/process_item
data modify storage trade_edit working_pool.pool[0].buyB set from storage trade_edit working_item
data remove storage trade_edit working_item
data modify storage trade_edit working_item set from storage trade_edit working_pool.pool[0].sell
function trade_edit:add_trades/process_item
data modify storage trade_edit working_pool.pool[0].sell set from storage trade_edit working_item
data remove storage trade_edit working_item

data modify entity @s Offers.Recipes append from storage trade_edit working_pool.pool[0]

function trade_edit:random/from_pool/remove_head

# repeat if more rolls remain
scoreboard players remove #wp_rolls trade_edit 1
execute if score #wp_rolls trade_edit matches 1.. if data storage trade_edit working_pool.pool[0] run function trade_edit:add_trades/from_pool
