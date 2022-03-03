
local spellbook_tab = {}

function spellbook_tab:on_keypressed(key)

end

function spellbook_tab:draw()
    love.graphics.setColor(1,1,1,1)
    love.graphics.printf(
        'Spells here',
        config.canvas.width /2 - 200,
        config.canvas.height /2,
        400,
        'center'
    )
end

return spellbook_tab
