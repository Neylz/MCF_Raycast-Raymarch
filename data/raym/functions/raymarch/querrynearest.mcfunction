#> raym:raymarch/querrynearest

## get entity coords
execute store result score #e_x raym run data get entity @s Pos[0] 100
execute store result score #e_y raym run data get entity @s Pos[1] 100
execute store result score #e_z raym run data get entity @s Pos[2] 100