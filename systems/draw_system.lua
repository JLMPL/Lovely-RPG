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
        love.graphics.setNewFont(10)
        love.graphics.print(string.format("%.2f %.2f", ent.pos.x, ent.pos.y), ent.pos.x, ent.pos.y)
        ent.anim.anim:draw(ent.anim.image, ent.pos.x, ent.pos.y, 0, 1,1)
    end

    return sys
end