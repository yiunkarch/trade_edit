# trade_edit:add_trades
# recursively add trades in list trade_edit.to_add

data modify entity @s Offers.Recipes append from storage trade_edit to_add[0]

data remove storage trade_edit to_add[0]
execute if data storage trade_edit to_add[0] run function trade_edit:add_trades
