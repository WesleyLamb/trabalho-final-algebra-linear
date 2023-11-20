require("Objects.CircleShape")
require("Objects.Prop")
require("Objects.Floor")

local circle = nil
local floor = nil
local rectangle = nil
local physicsWorld = nil
local floor = {}
-- local circle2 = nil

function love.load()
    physicsWorld = love.physics.newWorld(0, 9.81*64, true)
    circle = CircleShape.new(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 100, physicsWorld)

    floor = Floor.new(love.graphics.getWidth() / 2, love.graphics.getHeight() - 10, love.graphics.getWidth(), 10, physicsWorld)
    rectangle = Prop.new(love.graphics.getWidth() - 150, love.graphics.getHeight() - floor.height - 155, 100, 100, physicsWorld)
end

function love.draw()
    circle:draw()
    rectangle:draw()
    floor:draw()
end

function love.update(dt)
    physicsWorld:update(dt)
end

function love.keypressed(key)
    if ((key == 'left') or (key == 'a')) then
        circle:moveLeft()
    end
    if ((key == 'right') or (key == 'd')) then
        circle:moveRight()
    end
    if ((key == 'up') or (key == 'w')) then
        circle:moveUp()
    end
end