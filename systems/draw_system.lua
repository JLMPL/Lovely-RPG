local tiny = require("libs/tiny")

draw_system = {}

function draw_system.new()
    local sys = tiny.sortedProcessingSystem()
    sys.filter = tiny.requireAll("pos", "anim")
    sys.run_in_draw = true

    function sys:compare(a, b)
        return a.pos.y < b.pos.y
    end

    function sys:sort_entities()
        table.sort(self.entities, self.sortDelegate)
    end

    function sys:process(ent, dt)
        love.graphics.setColor(0,0,0,0.5)
        love.graphics.ellipse("fill", ent.pos.x, ent.pos.y, 16, 6)

        -- love.graphics.setColor(1,1,1,1)
        -- ent.anim.anim:draw(ent.anim.image, ent.pos.x - ent.anim.offset.x, ent.pos.y - ent.anim.offset.y, 0, 1,1)

        ent.anim:draw(ent.pos)

        if ent.display_name ~= nil then
            love.graphics.setNewFont(10)
            love.graphics.printf(ent.display_name, ent.pos.x - 50, ent.pos.y - ent.anim.offset.y * 0.8, 100, 'center')
        end
    end

    return sys
end
