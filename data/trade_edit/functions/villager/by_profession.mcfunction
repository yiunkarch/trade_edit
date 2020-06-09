# trade_edit:villager/by_profession
# called by (villager) with:
# 	var #wv_level
# declares:
# 	storage to_add

execute if entity @s[nbt={VillagerData:{profession:"minecraft:armorer"}}] run data modify storage trade_edit to_add set from storage trade_edit armorer
execute if entity @s[nbt={VillagerData:{profession:"minecraft:butcher"}}] run data modify storage trade_edit to_add set from storage trade_edit butcher
execute if entity @s[nbt={VillagerData:{profession:"minecraft:cartographer"}}] run data modify storage trade_edit to_add set from storage trade_edit cartographer
execute if entity @s[nbt={VillagerData:{profession:"minecraft:cleric"}}] run data modify storage trade_edit to_add set from storage trade_edit cleric
execute if entity @s[nbt={VillagerData:{profession:"minecraft:farmer"}}] run data modify storage trade_edit to_add set from storage trade_edit farmer
execute if entity @s[nbt={VillagerData:{profession:"minecraft:fisherman"}}] run data modify storage trade_edit to_add set from storage trade_edit fisherman
execute if entity @s[nbt={VillagerData:{profession:"minecraft:fletcher"}}] run data modify storage trade_edit to_add set from storage trade_edit fletcher
execute if entity @s[nbt={VillagerData:{profession:"minecraft:leatherworker"}}] run data modify storage trade_edit to_add set from storage trade_edit leatherworker
execute if entity @s[nbt={VillagerData:{profession:"minecraft:librarian"}}] run data modify storage trade_edit to_add set from storage trade_edit librarian
execute if entity @s[nbt={VillagerData:{profession:"minecraft:nitwit"}}] run data modify storage trade_edit to_add set from storage trade_edit nitwit
execute if entity @s[nbt={VillagerData:{profession:"minecraft:mason"}}] run data modify storage trade_edit to_add set from storage trade_edit mason
execute if entity @s[nbt={VillagerData:{profession:"minecraft:shepherd"}}] run data modify storage trade_edit to_add set from storage trade_edit shepherd
execute if entity @s[nbt={VillagerData:{profession:"minecraft:toolsmith"}}] run data modify storage trade_edit to_add set from storage trade_edit toolsmith
execute if entity @s[nbt={VillagerData:{profession:"minecraft:weaponsmith"}}] run data modify storage trade_edit to_add set from storage trade_edit weaponsmith

# set level and add trades
scoreboard players operation #wv_level trade_edit = @s trade_edit
execute if score #wv_level trade_edit matches 1.. run function trade_edit:villager/iterate_levels
data modify storage trade_edit to_add set from storage trade_edit to_add[0]

scoreboard players add @s trade_edit 1

function trade_edit:add_trades

data remove storage trade_edit to_add
