#> raym:raymarch/iter


## get marker coords
execute store result score #m_x raym run data get entity @s Pos[0] 100
execute store result score #m_y raym run data get entity @s Pos[1] 100
execute store result score #m_z raym run data get entity @s Pos[2] 100

## select and get nearest entity coords
# edit the selector here. Be sure to keep the tag=!ns
execute as @e[tag=!ns,sort=nearest,limit=1] run function raym:raymarch/querrynearest

## compute distance
scoreboard players operation #v_x raym = #e_x raym
scoreboard players operation #v_x raym -= #m_x raym

scoreboard players operation #v_y raym = #e_y raym
scoreboard players operation #v_y raym -= #m_y raym

scoreboard players operation #v_z raym = #e_z raym
scoreboard players operation #v_z raym -= #m_z raym


execute store result storage raym:math transformation[0] float 0.01 run scoreboard players get #v_x gy.ball.temp
execute store result storage raym:math transformation[4] float 0.01 run scoreboard players get #v_y gy.ball.temp
execute store result storage raym:math transformation[8] float 0.01 run scoreboard players get #v_z gy.ball.temp
data modify entity 0-0-0-0-0 transformation set from storage raym:math transformation

execute store result score #d raym run data get entity 0-0-0-0-0 transformation.scale[0] 100

# pass data
execute store result storage raym:math data.d float 0.01 run scoreboard players get #d raym
data modify storage raym:math data.d set string storage raym:math data.d 0 -1

## move marker
function raym:raymarch/tp with storage raym:math data

## check if we hit something
# choose the detection algorithm here
execute at @s store result score #success raym run function raym:raymarch/hit/


## loop
scoreboard players add #step raym 1
scoreboard players operation #current_distance raym += #d raym
execute unless score #success raym matches 1 if score #step raym < .max_step raym if score #current_distance raym < .max_distance raym at @s run function raym:raymarch/iter

