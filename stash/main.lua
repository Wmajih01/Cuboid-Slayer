local colorVar = {0.75, 1, 0.35, 1}
local seconds = 0
local x = 0

local keyMap = {
    w = function()
            colorVar = {0, 1, 0, 1}
    end,
    d = function()
            colorVar = {0, 0, 1, 1}
    end,
    space = function()
            colorVar = {1, 0, 0, 1}
    end,
    t = function()
            local seconds = 0
            local clockDisplay = "seconds" .. seconds
            love.graphics.print (clockDisplay, 0, 0, 0, 2, 2)
    end,
    escape = function()
            love.event.quit()
    end
}

love.update = function(dt)
    clockDisplay = "seconds: " .. math.floor(seconds)
    seconds = seconds + dt
    print(clockDisplay)
    x = x + dt*100
end

love.draw = function()
    love.graphics.setColor(colorVar)
    love.graphics.circle("fill", x, 400, 50)
    love.graphics.print(clockDisplay, 0, 0, 0, 2, 2)
end

love.keypressed = function(pressed_key)
    if keyMap[pressed_key] then
        keyMap[pressed_key]()
    end
end