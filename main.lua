love.window.setTitle("CUBOID SLAYER")

local initialization = require("functions/start/initialization")
local startGame = require("functions/start/startGame")
local drawObjectsList = require("functions/start/drawObjects")
local menuButtons = require("functions/start/menuButtons")
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
        menuAU:setVolume(0.3)
    end
    highScoreText = "Best CPS: " .. highScore
    if conditional == true then
        rollDice()
        cuboidClick:play()
    end
    waitingTime = waitingTime + dt
    if waitingTime > 3 and mainMenuLockout == false and allowDisplayMenu == true then
        menuHint = "Press SPACE to begin!"
        menuArrows = "<A Instructions    Credits D>"
        startupSequence = false
    end
    if time < 1 then
        gameOver()
    end
end

love.draw = function()
    love.graphics.setFont(fontVariable)
    love.graphics.print(menuArrows, 130, 400)
    love.graphics.print(mainMenuText, 270, 200)
    love.graphics.print(menuHint, 200, 300)
    drawObjectsList.drawRectangle()
    love.graphics.setColor(1, 1, 1, 1)
    font = love.graphics.setNewFont(15)
    love.graphics.print(timer, 0, 0)
    love.graphics.print(gameScore, 765, 0)
    love.graphics.print(highScoreText, 700, 30)
    love.graphics.print(gameOverText, 220, 200)
    love.graphics.print(cpsText, 220, 270)
    love.graphics.print(retryText, 220, 300)
    love.graphics.print(textA, 150, 350)
    love.graphics.print(textD, 350, 350)
end

love.keypressed = function(pressed_key)
    if pressed_key == "escape" then
        love.event.quit()
    end
    if pressed_key == "space" and mainMenuLockout == false and startupSequence == false then
        pressStartAU:play()
        startGame()
        menuAU:stop()
        mainMenuLockout = true
    elseif pressed_key == "a" and mainMenuLockout == false and pressedD == false and startupSequence == false then
        menuButtons.enterA()
    elseif pressed_key == "a" and mainMenuLockout == false and pressedD == true and startupSequence == false then
        menuButtons.exitD()
    elseif pressed_key == "d" and mainMenuLockout == false and pressedA == false and startupSequence == false then
        menuButtons.enterD()
    elseif pressed_key == "d" and mainMenuLockout == false and pressedA == true and startupSequence == false then
        menuButtons.exitA()
    end
end

love.mousepressed = function(x, y, button)
    if button == 1 then
        mouseAlignment()
    end
end