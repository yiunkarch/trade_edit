# trade_edit:loop

execute as @e[type=wandering_trader] unless score @s trade_edit matches 1.. run function trade_edit:wandering_trader

schedule function trade_edit:loop 1t
