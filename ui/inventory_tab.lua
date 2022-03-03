require 'items'

local inventory_tab = {
    player_inv = nil
}

local num_slots_x = 18
local num_slots_y = 6

local num_slots = num_slots_x * num_slots_y

local type_strings = {
    melee = 'Melee Weapon',
    food = 'Consumable',
    armor = 'Garment',
    ranged = 'Ranged Weapon'
}

local selected = 1

function inventory_tab:on_keypressed(key)
    if key == 'up' then
        selected = selected - num_slots_x
    elseif key == 'down' then
        selected = selected + num_slots_x
    end

    if key == 'left' then
        selected = selected - 1
    elseif key == 'right' then
        selected = selected + 1
    end

    if selected < 1 then selected = 1 end
    if selected > num_slots then selected = num_slots end
end

local desc_pos = {x = 32, y = 8*32}
local opt_index = 0

local optional_line = function(str, color)
    love.graphics.setColor(color[1], color[2], color[3], 1)
    love.graphics.print(str, desc_pos.x + 8, desc_pos.y + 24 + 16*opt_index)
    opt_index = opt_index + 1
end

function inventory_tab:draw()
    love.graphics.setColor(0,0,0,0.5)

    for i = 1, 6 do
        for j = 1, 18 do
            local x = 32 + (j-1) * 32
            local y = 48 + (i-1) * 32
            love.graphics.rectangle('fill', x + 1, y + 1, 30, 30)
        end
    end

    love.graphics.rectangle('fill', desc_pos.x, desc_pos.y, 18*32, 3*32)

    local inv = inventory_tab.player_inv

    love.graphics.setColor(1,1,1,1)

    for i = 1, #inv do
        local ix = ((i-1) % num_slots_x);
        local iy = math.floor((i-1) / num_slots_x)
        love.graphics.draw(items[inv[i]].icon, 32 + ix * 32, 48 + iy * 32)
    end

    local selx = ((selected-1) % num_slots_x);
    local sely = math.floor((selected-1) / num_slots_x)
    love.graphics.draw(res.images.inv_select, 32 + selx * 32, 48 + sely * 32)

    if inv[selected] ~= nil then
        local item = items[inv[selected]]
        love.graphics.print(item.name, desc_pos.x + 8, desc_pos.y + 8)

        love.graphics.setColor(0.5,0.5,0.5,1)
        love.graphics.printf(type_strings[item.type], desc_pos.x + 8, desc_pos.y + 8, 17.5*32, 'right')

        love.graphics.setColor(1,1,1,1)
        love.graphics.print('Value: ' .. item.value, desc_pos.x + 8, desc_pos.y + 8 + 16*4)

        opt_index = 0

        if item.req_strength ~= nil then
            optional_line('Strength Req: ' .. item.req_strength, {0.5,0.5,0.5})
        end

        if item.req_dexterity ~= nil then
            optional_line('Dexterity Req: ' .. item.req_dexterity, {0.5,0.5,0.5})

        end

        if item.physical_damage ~= nil then
            optional_line('Physical damage: ' .. item.physical_damage, {1,1,1})
        end

        if item.type == 'food' then
            if item.heal ~= nil then
                optional_line('Restored Health: ' .. item.heal, {0,1,0})
            end
        end

        if item.type == 'armor' then
            if item.physical_defence ~= nil then
                optional_line('Physical Defence: ' .. item.physical_defence, {1,1,1})
            end
        end
    end
end

return inventory_tab
