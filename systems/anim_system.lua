local tiny = require("libs/tiny")

anim_system = {}

function anim_system.new()
    local sys = tiny.processingSystem()
    sys.filter = tiny.requireAll("anim")

    function sys:process(ent, dt)
        ent.anim.anim:update(dt)
    end

    return sys
end