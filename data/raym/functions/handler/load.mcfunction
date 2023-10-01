#> raym:handler/load
#define storage raym:math


## scoreboards
scoreboard objectives add raym dummy

## constants
# maximum distance in 1/100th of a block (100 = 1 blocks)
# default: 5000
scoreboard players set .max_distance raym 5000
# maximum number of steps per ray | security used only on raymarching
# default: 50
scoreboard players set .max_step raym 50


scoreboard players set #100 raym 100

## sqrt
# credits to @triton365's method
# modified to use an intermediatary storage instead of using macros
forceload add 0 0
summon block_display 0. 0 0. {UUID:[I;0,0,0,0],Tags:["math_3dir_distance","ns"]}
data modify storage raym:math transformation set value [0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,1f]