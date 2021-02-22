local mx
local my
local conditional = false
local mainMenuLockout = false

local mainMenuText = "CUBIOD SLAYER"
local menuHint = "Press SPACE to begin!"
local gameScore = 0
local highScore = 0
local time = 31
local timer = ""
local allowCountDown = false
local gameOverText = ""
local cpsText = ""
local retryText = ""
local highScoreText = "Best CPS: " .. highScore

local red = 1
local blue = 1
local green = 1

local x1 = 0
local x2 = 0
local x3 = 0
local x4 = 0

local rollDice = function()
    x1 = math.floor(love.math.random(0, 720))
    x2 = math.floor(love.math.random(0, 520))
    x3 = math.floor(love.math.random(30, 80))
    x4 = math.floor(love.math.random(30, 80))
    conditional = false
    gameScore = gameScore + 1
    red = math.random()
    blue = math.random()
    green = math.random()
end

local initialization = function ()
    time = 31
    mainMenuText = ""
    menuHint = ""
    rollDice()
    allowCountDown = true
end

local gameOver = function ()
    if (math.floor((gameScore / 30) * 100 + 0.5) / 100) > highScore then
        highScore = (math.floor((gameScore / 30) * 100 + 0.5) / 100)
    end
    x1 = 0
    x2 = 0
    x3 = 0
    x4 = 0
    conditional = false
    timer = "Time left: 0"
    gameOverText = "GAME OVER"
    cpsText = "Your Clicks Per Second were " .. (math.floor((gameScore / 30) * 100 + 0.5) / 100)
    retryText = "Press ENTER to try again, or ESC to quit"
        if love.keyboard.isDown("return") then
            gameOverText = ""
            cpsText = ""
            retryText = ""
            time = 31
            timer = "Time left: " .. math.floor(time)
            x1 = math.floor(love.math.random(0, 720))
            x2 = math.floor(love.math.random(0, 520))
            x3 = math.floor(love.math.random(30, 80))
            x4 = math.floor(love.math.random(30, 80))
            gameScore = 0
        end
end

local mouseAlignment = function ()
    if ((x1 < mx) and ((x1 + x3) > mx)) then
        if ((x2 < my) and ((x2 + x4) > my)) then
            if love.mouse.isDown(1) then
                conditional = true
            end
        end
    end
end

local checkMouseConditional = function()
    mx = love.mouse.getX()
    my = love.mouse.getY()
    --print("X cord is " .. mx)
    --print("Y cord is " .. my)
end

love.update = function(dt)
    checkMouseConditional()
    if allowCountDown == true then
        time = time - dt
    end
    if mainMenuLockout == true then
        timer = "Time left: " .. math.floor(time)
    end
    highScoreText = "Best CPS: " .. highScore
    if conditional == true then
        rollDice()
    end
    if time < 1 then
        gameOver()
    end
    print(mainMenuLockout)
end

local drawRectangle = function ()
    love.graphics.setColor(red, green, blue, 10)
    love.graphics.rectangle("fill", x1, x2, x3, x4)
end

love.draw = function ()
    love.graphics.print(mainMenuText, 170, 200, 0, 5, 5)
    love.graphics.print(menuHint, 260, 300, 0, 2, 2)
    drawRectangle()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(timer, 0, 0, 0, 2, 2)
    love.graphics.print(gameScore, 765, 0, 0, 2, 2)
    love.graphics.print(highScoreText, 700, 30, 0, 1, 1)
    love.graphics.print(gameOverText, 220, 200, 0, 5, 5)
    love.graphics.print(cpsText, 220, 270, 0, 2, 2)
    love.graphics.print(retryText, 220, 300, 0, 2, 2)
end

love.keypressed = function(pressed_key)
    if pressed_key == "escape" then
        love.event.quit()
    end
    if pressed_key == "space" and mainMenuLockout == false then
        initialization()
        mainMenuLockout = true
    end
end

love.mousepressed = function(x, y, button)
    if button == 1 then
        mouseAlignment()
    end
end