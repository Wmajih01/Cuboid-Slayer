-- The conditions tested before and after a game reset
return function()
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
        pressStartAU:play()
    end
end