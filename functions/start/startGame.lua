-- what happens when you press START
return function()
    local rollDice = require("functions/poststart/rollDice")
    time = 31
    highScoreText = "Best CPS: " .. highScore
    mainMenuText = ""
    menuHint = ""
    menuArrows = ""
    textA = ""
    textD = ""
    rollDice()
    allowCountDown = true
end
