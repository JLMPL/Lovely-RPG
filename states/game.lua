require "resources"
require "systems/anim_system"
require "systems/draw_system"
require "systems/player_control_system"

local sti = require "libs/sti"
local vec2 = require "libs/vector"
local tiny = require "libs/tiny"

game_state = {}
game_state.__index = game_state

function run_in_update_filter(world, system)
    return system.run_in_draw == nil
end

function run_in_draw_filter(world, system)
    return system.run_in_draw ~= nil
end

function game_state.new()
    local self = setmetatable({}, game_state)
    self.world = tiny.world()
    self.world:addSystem(anim_system.new())
    self.draw_sys = self.world:addSystem(draw_system.new())
    self.world:addSystem(player_control_system.new())

    self.map = sti("data/maps/map.lua")

    self.world:addEntity({
        pos = vec2.new(100, 100),
        anim = res.anims.elf_boom(),
        is_player = true
    })

    self.world:addEntity({
        pos = vec2.new(200, 100),
        anim = res.anims.elf_boom()
    })

    self.world:addEntity({
        pos = vec2.new(100, 200),
        anim = res.anims.elf_boom()
    })

    self.world:addEntity({
        pos = vec2.new(200, 200),
        anim = res.anims.elf_boom()
    })
    self.world:refresh()

    return self
end

function game_state:enter(switcher)
    self.switch_state = switcher
end

function game_state:on_keypressed(key)
    if key == 'escape' then
        self.switch_state('menu')
    end
end

function game_state:update(dt)
    self.world:update(dt, run_in_update_filter)
    self.map:update(dt)
end

function game_state:draw_scene()
    -- self.map:draw(0,0, 0.5,0.5)
    love.graphics.draw(res.images.test_map)
    self.draw_sys:sort_entities()
    self.world:update(1.0, run_in_draw_filter)
end

function game_state:draw_overlay()
end
