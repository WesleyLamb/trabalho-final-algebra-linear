Floor = {}

Floor.new = function(x, y, width, height, physicsWorld)
    local self =  self or {}

    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.physics = {}
    self.physics.world = physicsWorld

    self.physics.body = love.physics.newBody(self.physics.world, self.x, self.y)
    self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
    self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)

    self.draw = function()
        love.graphics.rectangle("fill", self.physics.body:getX() - self.width / 2, self.physics.body:getY() - self.height / 2, self.width, self.height)
    end

    return self
end

