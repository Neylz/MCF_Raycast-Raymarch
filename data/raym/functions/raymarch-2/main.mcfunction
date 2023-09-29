#> raym:raymarch-2/main
# to execute as the entity
# @context @s

## setup
scoreboard players set #step raym 0
scoreboard players set #current_distance raym 0
scoreboard players set #success raym 0

scoreboard players set #d raym 0

execute store result score #m_x raym run data get entity @s Pos[0] 100
execute store result score #m_y raym run data get entity @s Pos[1] 100
execute store result score #m_z raym run data get entity @s Pos[2] 100

# get direction vector
execute at @s positioned ^ ^ ^1 summon marker run function raym:raymarch-2/getdir

scoreboard players operation #dir_x raym -= #m_x raym
scoreboard players operation #dir_y raym -= #m_y raym
scoreboard players operation #dir_z raym -= #m_z raym

# head height
scoreboard players add #m_y raym 162

tag @s add ns

execute unless entity @e[tag=!ns] run return 0

## run
function raym:raymarch-2/iter

## cleanup
tag @s remove ns

#@debug
# tellraw @a [{"text":"success: ", "color": "yellow"},{"score":{"name":"#success","objective":"raym"}, "color": "white"},{"text":"\n"}, {"text":"distance: ", "color": "yellow"},{"score":{"name":"#current_distance","objective":"raym"}, "color": "white"}, {"text":"\n"}, {"text":"step: ", "color": "yellow"},{"score":{"name":"#step","objective":"raym"}, "color": "white"}, {"text":"\n"}, {"text":"pos: ", "color": "yellow"},{"score":{"name":"#m_x","objective":"raym"}, "color": "white"}, {"text":" "},{"score":{"name":"#m_y","objective":"raym"}, "color": "white"}, {"text":" "},{"score":{"name":"#m_z","objective":"raym"}, "color": "white"}, {"text":"\n"}, {"text":"d: ", "color": "yellow"},{"score":{"name":"#d","objective":"raym"},"color": "white"}, {"text":"\n"}]