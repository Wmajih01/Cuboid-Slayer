-- this is a potential list where all objects will be drawn
drawObjectsList = {}
drawObjectsList.drawRectangle = function()
    love.graphics.setColor(red, green, blue, 10)
    love.graphics.rectangle("fill", x1, x2, x3, x4)
end

return drawObjectsList
