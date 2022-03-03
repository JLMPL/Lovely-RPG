
local system_tab = {}

function system_tab:on_keypressed(key)

end

function system_tab:draw()
    love.graphics.setColor(1,1,1,1)
    love.graphics.printf(
        'Press return to go back to the main of menu',
        config.canvas.width /2 - 200,
        config.canvas.height /2,
        400,
        'center'
    )
end

return system_tab
