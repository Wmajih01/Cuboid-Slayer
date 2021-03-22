-- what happens when you press START
return function()
    local rollDice = require("functions/poststart/rollDice")
    time = 31
    mainMenuText = ""
    menuHint = ""
    rollDice()
    allowCountDown = true
end