# trade_edit:wandering_trader
# called by (loop) with:
# declares:
# 	storage to_add

data modify storage trade_edit to_add set from storage trade_edit wandering_trader

function trade_edit:add_trades

scoreboard players add @s trade_edit 1

data remove storage trade_edit to_add
