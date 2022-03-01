require 'resources'

anim_component = {}
anim_component.__index = anim_component

function anim_component.new(anim_name)
    local canim = setmetatable({}, anim_component)

    local desc = res.anims.get(anim_name)

    canim.current = anim_name
    canim.anim = desc.anim
    canim.image = desc.image
    canim.offset = desc.offset

    canim.is_right = false

    return canim
end

function anim_component:set(anim_name)
    if self.current == anim_name then return end

    local desc = res.anims.get(anim_name)

    self.current = anim_name
    self.anim = desc.anim
    self.image = desc.image
    self.offset = desc.offset
end

function anim_component:draw(pos)
    love.graphics.setColor(1,1,1,1)

    self.anim.flippedH = self.is_right
    self.anim:draw(self.image, pos.x - self.offset.x, pos.y - self.offset.y, 0, 1, 1)
end
