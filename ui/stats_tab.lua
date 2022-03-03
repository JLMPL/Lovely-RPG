
local stats_tab = {}

function stats_tab:on_keypressed(key)

end

local left_margin = 64-8

local index = 0
local offset = 32

local print_line = function(str)
    love.graphics.print(str, offset, 48 + 8 + (16 * index))
end

local print_line_right = function(str)
    love.graphics.printf(str, offset, 48 + 8 + (16 * index), 256-16, 'right')
    index = index + 1
end

function stats_tab:draw()

    love.graphics.setColor(0,0,0,0.5)
    love.graphics.rectangle('fill', left_margin, 48, 256, 300)

    love.graphics.rectangle('fill', left_margin + 16 + 256, 48, 256, 300)

    index = 0
    offset = left_margin + 8

    love.graphics.setColor(1,1,1,1)
    print_line('Level:')
    print_line_right('1')

    print_line('XP:')
    print_line_right('300 / 500')

    print_line('Health:')
    print_line_right('12 / 25')

    print_line('Magicka:')
    print_line_right('17 / 20')
    print_line_right('')

    print_line('Strength:')
    print_line_right('1')

    print_line('Dexterity:')
    print_line_right('1')

    print_line('Intelligence:')
    print_line_right('1')
    print_line_right('')

    print_line('Physical resistance:')
    print_line_right('1')

    print_line('Fire resistance:')
    print_line_right('1')

    print_line('Ice resistance:')
    print_line_right('1')

    print_line('Lightning resistance:')
    print_line_right('1')

    index = 0
    offset = 256 + left_margin + 24

    print_line('Melee Weapons:')
    print_line_right('10%')

    print_line('Ranged Weapons:')
    print_line_right('10%')

    print_line('Fire Magic:')
    print_line_right('10%')

    print_line('Ice Magic:')
    print_line_right('10%')

    print_line('Lightning Magic:')
    print_line_right('10%')

    print_line('Dark Magic:')
    print_line_right('10%')

    print_line('Speechcraft:')
    print_line_right('10%')

end

return stats_tab
