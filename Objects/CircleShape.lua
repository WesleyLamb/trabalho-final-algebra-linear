CircleShape = {}

CircleShape.new = function(x, y, radius, physicsWorld)
    local self =  self or {}

    self.x = x
    self.y = y
    self.radius = radius
    self.physics = {}
    self.physics.world = physicsWorld
    self.physics.body = love.physics.newBody(self.physics.world, self.x, self.y, "dynamic")
    self.physics.shape = love.physics.newCircleShape(self.radius)
    -- self.physics.shape = love.physics.newRectangleShape(self.radius, self.radius)
    self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape, 1)
    self.physics.fixture:setRestitution(0.9)

    self.draw = function()
        love.graphics.circle("fill", self.physics.body:getX(), self.physics.body:getY(), self.radius)
    end

    self.moveLeft = function()
        self.physics.body:applyLinearImpulse(-10000, 0)
    end

    self.moveRight = function()
        self.physics.body:applyLinearImpulse(10000, 0)
    end

    self.moveUp = function()
        self.physics.body:applyLinearImpulse(0, -10000)
    end

    return self
end

