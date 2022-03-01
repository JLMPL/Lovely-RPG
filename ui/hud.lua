require 'resources'

hud = {
    num_hearts = 5
}

function hud:draw_hearts(x,y)
    for i = 1, self.num_hearts do
        love.graphics.draw(res.images.heart, x + (i-1) * res.images.heart:getWidth(), y)
    end
end

function hud:draw()
    love.graphics.setColor(0,0,0,1)
    self:draw_hearts(17,17)
    love.graphics.setColor(1,1,1,1)
    self:draw_hearts(16,16)
end
