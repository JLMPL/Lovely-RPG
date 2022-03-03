
local stats_tab = {}

function stats_tab:on_keypressed(key)

end

local index = 0
local offset = 32

local print_line = function(str)
    love.graphics.print(str, offset, 48 + (16 * index))
    index = index + 1
end

function stats_tab:draw()
    love.graphics.setColor(1,1,1,1)
    index = 0
    offset = 32

    print_line("Level: 1")
    print_line("XP: 300 / 500")
    print_line("Health: 12 / 25")
    print_line("Magicka: 17 / 20")
    print_line("")

    print_line("Strength: 12")
    print_line("Dexterity: 12")
    print_line("Intelligence: 12")
    print_line("")

    print_line("Physical resistance: 12")
    print_line("Fire resistance: 12")
    print_line("Ice resistance: 12")
    print_line("Lightning resistance: 12")

    index = 0
    offset = 256

    print_line("Melee Weapons: 12")
    print_line("Ranged Weapons: 12")
    print_line("Fire Magic: 12")
    print_line("Ice Magic: 12")
    print_line("Lightning Magic: 12")
    print_line("Dark Magic: 12")
    print_line("Speechcraft: 12")

end

return stats_tab
