local vec2 = require 'libs/vector'

local world = {
    --not used for now
    map = 'data/maps/map.lua',

    entities = {
        {'player', vec2.new(100, 100)},
        {'npc', 'the_giver', vec2.new(200,200)},
        {'npc', 'ambienter', vec2.new(300,400)}
    }
}

return world
