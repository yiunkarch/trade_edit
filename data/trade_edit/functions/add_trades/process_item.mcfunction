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
