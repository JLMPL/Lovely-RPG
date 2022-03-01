require "camera"
local tiny = require("libs/tiny")

player_control_system = {}

function player_control_system.new()
    local sys = tiny.processingSystem()
    sys.filter = tiny.requireAll("pos", "is_player")

    function sys:process(ent, dt)
        if love.keyboard.isDown('up') then
            ent.pos.y = ent.pos.y - dt * 100
        elseif love.keyboard.isDown('down') then
            ent.pos.y = ent.pos.y + dt * 100
        end
        
        if love.keyboard.isDown('left') then
            ent.pos.x = ent.pos.x - dt * 100
        elseif love.keyboard.isDown('right') then
            ent.pos.x = ent.pos.x + dt * 100
        end

        camera.set_target_pos(ent.pos)
    end

    return sys
end