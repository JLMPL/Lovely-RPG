require "resources"

local option_strings = {
    "Start Game",
    "Load Game",
    "Settings",
    "Exit"
}

menu_state = {}
menu_state.__index = menu_state

function menu_state.new()
    local self = setmetatable({}, menu_state)

    self.options = {
        love.graphics.newText(res.fonts.menu, "nothing"),
        love.graphics.newText(res.fonts.menu, "nothing"),
        love.graphics.newText(res.fonts.menu, "nothing"),
        love.graphics.newText(res.fonts.menu, "nothing")
    }
    self.selected = 1

    return self
end

function menu_state:enter(switcher)
    self.switch_state = switcher
    self:refresh()
end

function menu_state:refresh()
    for i = 1, #self.options do
        local color = {0.5,0.5,0.5,1}  

        if i == self.selected then
            color = {1,1,1,1}
        end

        self.options[i]:set({color, option_strings[i]})
    end
end

function menu_state:on_keypressed(key)
    if key == 'up' then
        self.selected = self.selected - 1
    elseif key == 'down' then
        self.selected = self.selected + 1
    end

    if self.selected > #self.options then self.selected = #self.options end
    if self.selected < 1 then self.selected = 1 end

    if key == 'return' then
        if self.selected == 1 then
            self.switch_state('game')
        end
        if self.selected == 4 then
            love.event.push('quit')
        end
    end

    self:refresh()
end

function menu_state:update(dt)
end

function menu_state:draw_scene()
end

function menu_state:draw_overlay()
    love.graphics.setFont(res.fonts.title)
    love.graphics.print("Lovely RPG", 10, love.graphics.getHeight() / 4)

    for i = 1, #self.options do
        love.graphics.draw(
            self.options[i],
            10,
            (love.graphics.getHeight() / 2) + self.options[i]:getHeight() * (i-1))
    end
end
