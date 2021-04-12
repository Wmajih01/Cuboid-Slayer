love.window.setTitle("CUBOID SLAYER THE FIRST ITERATION")

local initialization = require("functions/start/initialization")
local startGame = require("functions/start/startGame")
local drawObjectsList = require("functions/start/drawObjects")
local rollDice = require("functions/poststart/rollDice")
local mouseAlignment = require("functions/poststart/mouseAlignment")
local getMousePos = require("functions/poststart/getMousePos")
local gameOver = require("functions/gameover/gameOver")

initialization()

love.update = function(dt)
    getMousePos()
    if allowCountDown == true then
        time = time - dt
    end
    if mainMenuLockout == true then
        timer = "Time left: " .. math.floor(time)
    elseif mainMenuLockout == false then
        menuAU:play()
        menuAU:setVolume(0.5)
    end
    highScoreText = "Best CPS: " .. highScore
    if conditional == true then
        rollDice()
        cuboidClick:play()
    end
    if time < 1 then
        gameOver()
    end
    print(mainMenuLockout)
end

love.draw = function()
    love.graphics.setFont(fontVariable)
    love.graphics.print(mainMenuText, 170, 200, 0, 1, 1)
    love.graphics.print(menuHint, 260, 300, 0, 1, 1)
    drawObjectsList.drawRectangle()
    love.graphics.setColor(1, 1, 1, 1)
    font = love.graphics.setNewFont(15)
    love.graphics.print(timer, 0, 0, 0, 1, 1)
    love.graphics.print(gameScore, 765, 0, 0, 1, 1)
    love.graphics.print(highScoreText, 700, 30, 0, 1, 1)
    love.graphics.print(gameOverText, 220, 200, 0, 1, 1)
    love.graphics.print(cpsText, 220, 270, 0, 1, 1)
    love.graphics.print(retryText, 220, 300, 0, 1, 1)
end

love.keypressed = function(pressed_key)
    if pressed_key == "escape" then
        love.event.quit()
    end
    if pressed_key == "space" and mainMenuLockout == false then
        pressStartAU:play()
        startGame()
        menuAU:stop()
        mainMenuLockout = true
    end
end

love.mousepressed = function(x, y, button)
    if button == 1 then
        mouseAlignment()
    end
end