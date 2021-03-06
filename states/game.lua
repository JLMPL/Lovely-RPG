require 'resources'
require 'systems/anim_system'
require 'systems/draw_system'
require 'systems/player_control_system'
require 'world_loader'
require 'ui/hud'
require 'ui/pause_menu'

local sti = require 'libs/sti'
local vec2 = require 'libs/vector'
local tiny = require 'libs/tiny'

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

    self.paused = false

    self.world = tiny.world()
    self.world:addSystem(anim_system.new())
    self.draw_sys = self.world:addSystem(draw_system.new())
    self.player_sys = self.world:addSystem(player_control_system.new())

    self.map = sti("data/maps/map.lua")
    world_loader.load(self, "firstone")

    self.world:refresh()

    return self
end

function game_state:enter(switcher)
    self.switch_state = switcher
end

function game_state:on_keypressed(key)
    if key == 'escape' then
        self.paused = not self.paused

        if self.paused then
            pause_menu:show_on_tab(5)
        end
    end

    if key == 'tab' then
        self.paused = not self.paused

        if self.paused then
            pause_menu:show_on_tab(1)
        end
    end

    if not self.paused then
        self.player_sys:on_keypressed(key)
    end

    pause_menu:on_keypressed(key)
end

function game_state:update(dt)

    if not self.paused then
        self.world:update(dt, run_in_update_filter)
        self.map:update(dt)
    else
    end
end

function game_state:draw_scene()
    -- self.map:draw(0,0, 0.5,0.5)
    for i = 0, 10 do
        for j = 0, 10 do
            love.graphics.draw(res.images.test_map, j * res.images.test_map:getWidth(), i * res.images.test_map:getHeight())
        end
    end

    -- love.graphics.draw(res.images.tree, 300, 300)
    self.draw_sys:sort_entities()
    self.world:update(1.0, run_in_draw_filter)


end

function game_state:draw_overlay()
    if not self.paused then
        hud:draw()
    else
        pause_menu:draw()
    end
end
