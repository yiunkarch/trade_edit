# trade_edit:install

scoreboard objectives add trade_edit dummy

scoreboard players set #rng_mod trade_edit 70549
scoreboard players set #rng_mult trade_edit 23017
scoreboard players set #rng_inc trade_edit 54139
execute store result score #rng_seed trade_edit run seed
scoreboard players operation #rng_seed trade_edit %= #rng_mod trade_edit

schedule function trade_edit:loop
