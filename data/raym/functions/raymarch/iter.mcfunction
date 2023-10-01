#> raym:raymarch/iter


## select and get nearest entity coords
# pass data
execute store result storage raym:math data.x float 0.01 run scoreboard players get #m_x raym
execute store result storage raym:math data.y float 0.01 run scoreboard players get #m_y raym
execute store result storage raym:math data.z float 0.01 run scoreboard players get #m_z raym


# edit the selector here. Be sure to keep the tag=!ns
function raym:raymarch/positionparse with storage raym:math data


## loop
scoreboard players add #step raym 1
scoreboard players operation #current_distance raym += #d raym
execute unless score #success raym matches 1 if score #step raym < .max_step raym if score #current_distance raym < .max_distance raym at @s run function raym:raymarch/iter

