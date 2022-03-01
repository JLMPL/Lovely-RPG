local anim8 = require "libs/anim8"

local images_dir = "data/images/"
local fonts_dir = "data/fonts/"

love.graphics.setDefaultFilter("nearest", "nearest")

local load_image = function(file)
    return love.graphics.newImage(images_dir .. file)
end

res = {}
res.images = {}
res.anims = {}

--elf
res.images.elf_boom = load_image("elf_boom.png")
res.images.elf_idle = load_image("elf_idle.png")
res.images.elf_walk = load_image("elf_walk.png")

res.images.test_map = load_image("grass.png")
res.images.heart = load_image("heart_small.png")
res.images.tree = load_image("tree.png")

local grid_elf_boom = anim8.newGrid(128,128, res.images.elf_boom:getWidth(), res.images.elf_boom:getHeight())

res.anims.elf_boom = {
    anim = anim8.newAnimation(grid_elf_boom('1-3', 1), 0.1),
    image = res.images.elf_boom,
    offset = {
        x = 64,
        y = 112
    }
}

local grid_elf_idle = anim8.newGrid(64,96, res.images.elf_idle:getWidth(), res.images.elf_idle:getHeight())

res.anims.elf_idle = {
    anim = anim8.newAnimation(grid_elf_idle('1-1', 1), 0.1),
    image = res.images.elf_idle,
    offset = {
        x = 32,
        y = 80
    }
}

local grid_elf_walk = anim8.newGrid(96,96, res.images.elf_walk:getWidth(), res.images.elf_walk:getHeight())

res.anims.elf_walk = {
    anim = anim8.newAnimation(grid_elf_walk('1-12', 1), 0.05),
    image = res.images.elf_walk,
    offset = {
        x = 48,
        y = 80
    }
}

function res.anims.get(name)
    local anim = res.anims[name]
    return {
        anim = anim.anim:clone(),
        image = anim.image,
        offset = anim.offset
    }
end

res.fonts = {}
res.fonts.menu = love.graphics.newFont(fonts_dir .. "NotoSans-Regular.ttf", 12)
res.fonts.title = love.graphics.newFont(fonts_dir .. "NotoSans-Regular.ttf", 30)

