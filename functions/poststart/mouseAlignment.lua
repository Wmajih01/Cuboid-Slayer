-- checks if mouse position is aligned with the "cube"
return function()
    if ((x1 < mx) and ((x1 + x3) > mx)) then
        if ((x2 < my) and ((x2 + x4) > my)) then
            if love.mouse.isDown(1) then
                conditional = true
            end
        end
    end
end