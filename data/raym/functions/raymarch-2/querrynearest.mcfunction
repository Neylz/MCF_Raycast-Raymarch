#> raym:raymarch-2/querrynearest

## get entity coords
execute store result score #v_x raym store result score #e_x raym run data get entity @s Pos[0] 100
execute store result score #v_y raym store result score #e_y raym run data get entity @s Pos[1] 100
execute store result score #v_z raym store result score #e_z raym run data get entity @s Pos[2] 100

## compute distance
scoreboard players operation #v_x raym -= #m_x raym
scoreboard players operation #v_y raym -= #m_y raym
scoreboard players operation #v_z raym -= #m_z raym

execute store result storage raym:math transformation[0] float 0.01 run scoreboard players get #v_x raym
execute store result storage raym:math transformation[4] float 0.01 run scoreboard players get #v_y raym
execute store result storage raym:math transformation[8] float 0.01 run scoreboard players get #v_z raym
data modify entity 0-0-0-0-0 transformation set from storage raym:math transformation

execute store result score #d raym run data get entity 0-0-0-0-0 transformation.scale[0] 100

#@debug
# tellraw @a [{"text":"#d: "},{"score":{"name":"#d","objective":"raym"}}]
# tellraw @a [{"text":"\n#v_x: "},{"score":{"name":"#v_x","objective":"raym"}}, {"text":"\n#v_y: "},{"score":{"name":"#v_y","objective":"raym"}}, {"text":"\n#v_z: "},{"score":{"name":"#v_z","objective":"raym"}}]

# next pos
scoreboard players operation #v_x raym = #dir_x raym
scoreboard players operation #v_y raym = #dir_y raym
scoreboard players operation #v_z raym = #dir_z raym

scoreboard players operation #v_x raym *= #d raym
scoreboard players operation #v_x raym /= #100 raym
scoreboard players operation #v_y raym *= #d raym
scoreboard players operation #v_y raym /= #100 raym
scoreboard players operation #v_z raym *= #d raym
scoreboard players operation #v_z raym /= #100 raym

scoreboard players operation #m_x raym += #v_x raym
scoreboard players operation #m_y raym += #v_y raym
scoreboard players operation #m_z raym += #v_z raym


## check if we hit something
# choose the detection algorithm here
execute store result score #success raym run function raym:raymarch-2/hit/
