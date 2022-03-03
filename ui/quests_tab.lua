
local quests_tab = {}

local left_margin = 32
local panel_width = 256+24

local index = 0
local offset = 32

local print_line = function(str, rig)
    love.graphics.print(str, offset, 48 + 8 + (16 * index))
    love.graphics.printf(rig, offset, 48 + 8 + (16 * index), panel_width-16, 'right')
    index = index + 1
end

local print_line_wrap = function(str)
    love.graphics.printf(str, offset, 48 + 8 + (16 * index), panel_width - 16, 'justify')
    index = index + 1
end

function quests_tab:on_keypressed(key)

end

function quests_tab:draw()

    love.graphics.setColor(0,0,0,0.5)
    love.graphics.rectangle('fill', left_margin, 48, panel_width, 300)
    love.graphics.rectangle('fill', left_margin + 16 + panel_width, 48, panel_width, 300)

    index = 0
    offset = left_margin + 8

    love.graphics.setColor(1,1,1,1)
    print_line('Questing away', '[In Progress]')
    love.graphics.setColor(0.5,0,0,1)
    print_line('Failed quest if possible', '[Failed]')
    love.graphics.setColor(0,0.5,0,1)
    print_line('Successfully finished quest', '[Completed]')
    love.graphics.setColor(0.5,0.5,0.5,1)
    print_line('To quest or not to quest', '[In Progress]')
    print_line('Final quest of glory', '[In Progress]')

    index = 0
    offset = left_margin + 24 + panel_width

    love.graphics.setColor(0.75,0.75,0.75,1)
    print_line_wrap('Quest Giver told me I need to find some sort of item. It was supposedly last seen in a hole under the waterfall well.\n\nThere was nothing but a note mentioning a big tree.\n')
end

return quests_tab
