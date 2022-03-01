local anim8 = require "libs/anim8"

local images_dir = "data/images/"
local fonts_dir = "data/fonts/"

love.graphics.setDefaultFilter("nearest", "nearest")

res = {}
res.images = {}
res.anims = {}

res.images.elf = love.graphics.newImage(images_dir .. "elf_boom.png")
res.images.test_map = love.graphics.newImage(images_dir .. "test_map.png")

local grid_elf = anim8.newGrid(128,128, res.images.elf:getWidth(), res.images.elf:getHeight())

res.anims.elf_boom = function()
    return {
        anim = anim8.newAnimation(grid_elf('1-3', 1), 0.1),
        image = res.images.elf,
        offset = {
            x = 64,
            y = 112
        }
    }
end

res.fonts = {}
res.fonts.menu = love.graphics.newFont(fonts_dir .. "NotoSans-Regular.ttf", 30)
res.fonts.title = love.graphics.newFont(fonts_dir .. "NotoSans-Regular.ttf", 100)

