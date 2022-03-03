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
    love.graphics.setColor(1,1,1,1)
    love.graphics.setBlendMode("alpha")
    love.graphics.push()
    love.graphics.translate(-camera.x, -camera.y)
    state:draw_scene()
    love.graphics.pop()
    state:draw_overlay()

    love.graphics.setCanvas()
    love.graphics.clear(0,0,0,1)
    love.graphics.setColor(1,1,1,1)
    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.draw(scene_canvas, 0,0, 0, config.scale.x, config.scale.y)
end

--[[

LITTLE TODO:
    Controller remember?

BIG TODO: (Limits too)
    NPCs     (Can't attack them, no routine)
    Dialogue (Monologue -> Accept, Decline)?
    Trading  (Buy sell item by item basis)
    Quests   (Mostly just text entries, progress requires items)
    Items    (Named, Coded, icon)
    Mobs     (Simple AI, Weak to different things: fire, ice, slashing)
    Combat   (Single attack, types of weapons)
    Stats    (Stats as requirements to equip stuff)
    Weapons  (Different types of damage, Ranged weapons exiting)
    Magic    (Fire, Ice, Lightning... dunno)

______________________________________
| Inventory | Stats | Magic | Quests |
|___________|       |_______|________|
|                                    |
|  Health: 5/12                      |
|  Magicka: 7/12                     |
|                                    |
|  Strength: 4                       |
|  Dexterity: 5                      |
|  Intelligence: 4                   |
|                                    |
|  Melee Weapons: 30%                |
|  Ranged Weapons: 20%               |
|  Fire Magic: 40%                   |
|  (...)                             |
|                                    |
|____________________________________|

]]--
