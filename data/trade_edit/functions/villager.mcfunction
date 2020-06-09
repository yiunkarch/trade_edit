# trade_edit:villager

execute store result score #wv_level trade_edit run data get entity @s VillagerData.level
execute unless score @s trade_edit >= #wv_level trade_edit run function trade_edit:villager/by_profession
