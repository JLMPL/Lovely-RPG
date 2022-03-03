
local quests_tab = {}

local index = 0
local offset = 32

local print_line = function(str)
    love.graphics.print(str, offset, 48 + (16 * index))
    index = index + 1
end

function quests_tab:on_keypressed(key)

end

function quests_tab:draw()
    index = 0
    offset = 32

    print_line('Questing away')
    print_line('Different quests for different folks')
    print_line('Go quest yourself')
    print_line('To quest or not to quest')
    print_line('Final quest of glory')
end

return quests_tab
