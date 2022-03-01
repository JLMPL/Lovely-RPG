require "conf"

camera = {
    x = 0,
    y = 0
}

function camera.set_target_pos(target)
    camera.x = target.x - config.canvas.width /2
    camera.y = target.y - config.canvas.height /2

    if camera.x < 0 then camera.x = 0 end
    if camera.y < 0 then camera.y = 0 end
end
