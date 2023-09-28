#> raym:raycast/loop


execute at @s store result score #success raym run function raym:raycast/hit/


## loop
scoreboard players add #current_distance raym 5
execute unless score #success raym matches 1 if score #current_distance raym < .max_distance raym positioned ^ ^ ^.05 run function raym:raycast/iter