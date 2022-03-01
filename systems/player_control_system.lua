require "camera"
local tiny = require("libs/tiny")

player_control_system = {}

function player_control_system.new()
    local sys = tiny.processingSystem()
    sys.filter = tiny.requireAll("pos", "is_player", "anim")

    function sys:key_per_ent(ent, key)
        if key == 'tab' then
            ent.is_busy = not ent.is_busy

            if ent.is_busy then
                ent.anim:set('elf_idle')
            end
        end
    end

    function sys:on_keypressed(key)
        for i = 1, #self.entities do
            self:key_per_ent(self.entities[i], key)
        end
    end

    function sys:control(ent, dt)
        local is_moving = false

        if love.keyboard.isDown('up') then
            ent.pos.y = ent.pos.y - dt * 100
            is_moving = true
        elseif love.keyboard.isDown('down') then
            ent.pos.y = ent.pos.y + dt * 100
            is_moving = true
        end

        if love.keyboard.isDown('left') then
            ent.pos.x = ent.pos.x - dt * 100
            ent.anim.is_right = false
            is_moving = true

        elseif love.keyboard.isDown('right') then
            ent.pos.x = ent.pos.x + dt * 100
            ent.anim.is_right = true
            is_moving = true
        end

        if is_moving then
            ent.anim:set('elf_walk')
        else
            ent.anim:set('elf_idle')
        end
    end

    function sys:detect_interactables(ent, dt)
        for i = 1, #self.world.entities do
            local other = self.world.entities[i]

            if other.display_name == nil then goto continue end
            if ent.pos:dist(other.pos) > 100 then goto continue end

            -- print("Seeing " .. other.display_name)

            ::continue::
        end
    end

    function sys:process(ent, dt)

        if not ent.is_busy then
            self:control(ent, dt)
            self:detect_interactables(ent, dt)
        end

        camera.set_target_pos(ent.pos)
    end

    return sys
end
