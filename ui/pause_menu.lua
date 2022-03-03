
local tab_names = {
    'Inventory',
    'Stats',
    'Spellbook',
    'Quests',
    'System'
}

local tabs = {
    require('ui/inventory_tab'),
    require('ui/stats_tab'),
    require('ui/spellbook_tab'),
    require('ui/quests_tab'),
    require('ui/system_tab')
}

local selected = 1

pause_menu = {
    shown = false
}

function pause_menu:on_keypressed(key)
    if not self.shown then return end

    if key == 'a' then
        selected = selected - 1
    elseif key == 's' then
        selected = selected + 1
    end

    if selected < 1 then selected = 1 end
    if selected > 5 then selected = 5 end

    tabs[selected]:on_keypressed(key)
end

function pause_menu:draw()
    if not self.shown then return end

    love.graphics.setColor(0,0,0,0.7)
    love.graphics.rectangle('fill', 0,0, config.canvas.width, config.canvas.height)

    for i = 1, 5 do
        if i ~= selected then
            love.graphics.setColor(0,0,0,0.5)
            love.graphics.rectangle('fill', 128 * (i-1), 0, 128, 32)
        end

        love.graphics.setColor(1,1,1,1)
        love.graphics.printf(tab_names[i], 128 * (i-1), 8, 128, 'center')
    end

    tabs[selected]:draw()
end

function pause_menu:show_on_tab(tab)
    self.shown = true
    selected = tab
end
