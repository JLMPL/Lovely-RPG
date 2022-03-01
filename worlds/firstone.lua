local vec2 = require 'libs/vector'

local world = {
    --not used for now
    map = 'data/maps/map.lua',

    entities = {
        {'player', vec2.new(100, 100)},
        {'npc', 'the_giver', vec2.new(200,100)},
        {'npc', 'ambienter', vec2.new(200,200)}
    }
}

return world
