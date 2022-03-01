require 'resources'

require 'components/anim_component'

local sti = require "libs/sti"
local vec2 = require "libs/vector"

local npcs = require 'entities/npcs'

world_loader = {}
local type_loaders = {}

type_loaders['player'] = function(state, ent)
    local pos = ent[2]

    state.world:addEntity({
        pos = vec2.new(pos.x, pos.y),
        anim = anim_component.new('elf_walk'),
        is_player = true,
        is_busy = false
    })
end

type_loaders['npc'] = function(state, ent)
    local desc = npcs[ent[2]]
    local pos = ent[3]

    state.world:addEntity({
        pos = vec2.new(pos.x, pos.y),
        anim = anim_component.new('elf_boom'),
        display_name = desc.display_name
    })
end

function world_loader.load(state, name)
    local world = require('worlds/' .. name)

    state.map = sti(world.map)

    for i = 1, #world.entities do
        local entity = world.entities[i]
        type_loaders[entity[1]](state, entity)
    end
end
