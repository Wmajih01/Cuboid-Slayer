-- Here are the main variables responsible for making the game's fundamentals work
return function()

    pressStartAU = love.audio.newSource("audio/pressStart.wav", "stream")
    cuboidClick = love.audio.newSource("audio/cuboidClick.wav", "stream")
    menuAU = love.audio.newSource("audio/menu.wav", "stream")

    startupSequence = true

    mx = 0
    my = 0
    conditional = false
    mainMenuLockout = false
    waiting = true
    waitingTime = 0

    fontVariable = love.graphics.newFont("font/atari.ttf", 20)

    mainMenuText = "CUBOID SLAYER"
    menuHint = ""
    menuArrows = ""
    textA = ""
    textD = ""
    allowDisplayMenu = true
    pressedA = false
    pressedD = false
    gameScore = 0
    highScore = 0
    time = 31
    timer = ""
    allowCountDown = false
    gameOverText = ""
    cpsText = ""
    retryText = ""
    highScoreText = ""

    red = 1
    blue = 1
    green = 1

    x1 = 0
    x2 = 0
    x3 = 0
    x4 = 0

end
