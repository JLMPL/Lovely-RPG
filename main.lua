require "resources"
require "camera"
require "states/menu"
require "states/game"

local scene_canvas = love.graphics.newCanvas(config.canvas.width, config.canvas.height)

local state = menu_state.new()

next_state = nil

local switch_state = function(name)
    next_state = name
end

function love.load()
    state:enter(switch_state)
end

function love.keypressed(key)
    state:on_keypressed(key)
end

function perform_state_swtich()
    if next_state ~= nil then

        if next_state == 'game' then
            state = game_state.new()
        elseif next_state == 'menu' then
            state = menu_state.new()
        end

        state:enter(switch_state)
        next_state = nil
    end
end

function love.update(dt)
    perform_state_swtich()

    state:update(dt)
end

function love.draw()
    love.graphics.setCanvas(scene_canvas)
    love.graphics.clear(0,0,0,1)
    love.graphics.setBlendMode("alpha")
    love.graphics.push()
    love.graphics.translate(-camera.x, -camera.y)
    state:draw_scene()
    love.graphics.pop()

    love.graphics.setCanvas()
    love.graphics.clear(0,0,0,1)
    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.draw(scene_canvas, 0,0, 0, 1920/640, 1080/360)
    
    love.graphics.setBlendMode("alpha")
    state:draw_overlay()
end

--[[

TODO:
YSort Rendering - should be super easy too

]]--
