menuButtons = {}
menuButtons.enterA = function()
    allowDisplayMenu = false
    pressedA = true
    menuArrows = "                     Menu  D>"
    textA =
        "Use your mouse to navigate and click to destroy \nrectangles and squares, all while collecting points \nfor a score measured in CPS! (clicks per second).\n \nPress ESC to quit the game."
end
menuButtons.exitA = function()
    menuArrows = "<A Instructions    Credits D>"
    pressedA = false
    textA = ""
end
menuButtons.enterD = function()
    allowDisplayMenu = false
    pressedD = true
    menuArrows = "<A  Menu"
    textD =
        "Head Programmer: Alexander Bykadorov \nLead Designer: Alexander Bykadorov \nGraphical Designer: Alexander Bykadorov \nStaff Manager: Alexander Bykadorov \nStaff: Alexander Bykadorov \nSound Design: Alexander Bykadorov \nIdea Pitcher: Alexander Bykadorov \nSpecial Thanks: Einar Persson \nMinor Assistance: Not Szymon"
end
menuButtons.exitD = function()
    menuArrows = "<A Instructions    Credits D>"
    pressedD = false
    textD = ""
end

return menuButtons
