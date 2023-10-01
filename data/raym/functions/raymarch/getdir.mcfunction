#> raym:raymarch/getdir

execute store result score #dir_x raym run data get entity @s Pos[0] 100
execute store result score #dir_y raym run data get entity @s Pos[1] 100
execute store result score #dir_z raym run data get entity @s Pos[2] 100

kill @s