#> raym:raymarch/main
# to execute as the entity
# @context @s

## setup
scoreboard players set #step raym 0
scoreboard players set #current_distance raym 0
scoreboard players set #success raym 0

tag @s add ns

## run
execute at @s positioned ^ ^ ^ summon marker run function raym:raymarch/setup

## cleanup
tag @s remove ns