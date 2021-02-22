local world = love.physics.newWorld(0, 100)

local circleEntity = {}

circleEntity.body = love.physics.newBody(world, 200, 200, "dynamic")
circleEntity.body:setMass(32)
circleEntity.shape = love.physics.newCircleShape(50)
circleEntity.fixture = love.physics.newFixture(circleEntity.body, circleEntity.shape)

love.update = function(dt)
    world:update(dt)
end

print(circleEntity.body:getWorldPoint(circleEntity.shape:getPoint()))

love.draw = function ()
    love.graphics.circle("fill", circleEntity.body:getWorldPoint())
end