return function ()
    
    pressStartAU = love.audio.newSource("audio/pressStart.wav", "stream")
    cuboidClick = love.audio.newSource("audio/cuboidClick.wav", "stream")

    mx = 0
    my = 0
    conditional = false
    mainMenuLockout = false

    mainMenuText = "CUBIOD SLAYER"
    menuHint = "Press SPACE to begin!"
    gameScore = 0
    highScore = 0
    time = 31
    timer = ""
    allowCountDown = false
    gameOverText = ""
    cpsText = ""
    retryText = ""
    highScoreText = "Best CPS: " .. highScore

    red = 1
    blue = 1
    green = 1

    x1 = 0
    x2 = 0
    x3 = 0
    x4 = 0

end