require "setting"
require "collision"

-- les fonctions Love2D
function love.load() -- Initialisation, se charge au lancement
    
end

function love.update(dt) -- tourne en boucle 60 fois par secondes
    input_user(dt)
    check_coll()
end

function love.draw() -- dessine à l'écran
    -- affichage de l'image a l'écran
    love.graphics.draw(background, 0, 0, 0, 1, 1)
    
    love.graphics.setFont(font)
    love.graphics.print("Score joueur : "..player.score, 580, 160) 

    -- enemy
    love.graphics.draw(enemy.img, enemy.posX, enemy.posY, enemy.rotation, 1, 1, enemy.tileSize/2, enemy.tileSize/2)
    
    -- player (image, position X, position Y, rotation, échelle X, échelle Y, offset X, offset Y)
    -- offset = décalage du point d'encrage de l'image (le mettre au centre)
    love.graphics.draw(player.img, player.posX, player.posY, player.rotation, 1, 1, player.tileSize/2, player.tileSize/2)
end

-- custom functions
function input_user(dt)
    local dx, dy = 0, 0

    if love.keyboard.isDown("z") then
        player.rotation = math.rad(0)
        dy = -1
    end
    if love.keyboard.isDown("q") then
        player.rotation = math.rad(270)
        dx = -1
    end
    if love.keyboard.isDown("s") then
        player.rotation = math.rad(180)
        dy = 1
    end
    if love.keyboard.isDown("d") then
        player.rotation = math.rad(90)
        dx = 1
    end

    -- diagonal speed readjusted
    if dx ~= 0 and dy ~= 0 then
        dx = dx/math.sqrt(2)
        dy = dy/math.sqrt(2)
    end

    -- diagonal rotation
    if love.keyboard.isDown("z") and love.keyboard.isDown("d") then player.rotation = math.rad(45) end
    if love.keyboard.isDown("s") and love.keyboard.isDown("d") then player.rotation = math.rad(135) end
    if love.keyboard.isDown("s") and love.keyboard.isDown("q") then player.rotation = math.rad(225) end
    if love.keyboard.isDown("q") and love.keyboard.isDown("z") then player.rotation = math.rad(315) end

    -- disable movement when 3 keys are down
    if love.keyboard.isDown("z") and love.keyboard.isDown("d") and love.keyboard.isDown("q") then dx = 0 dy = 0 player.rotation = math.rad(0) end
    if love.keyboard.isDown("z") and love.keyboard.isDown("d") and love.keyboard.isDown("s") then dx = 0 dy = 0 player.rotation = math.rad(0) end
    if love.keyboard.isDown("z") and love.keyboard.isDown("s") and love.keyboard.isDown("q") then dx = 0 dy = 0 player.rotation = math.rad(0) end
    if love.keyboard.isDown("s") and love.keyboard.isDown("d") and love.keyboard.isDown("q") then dx = 0 dy = 0 player.rotation = math.rad(0) end
    -- or when opposite direction are down
    if love.keyboard.isDown("z") and love.keyboard.isDown("s") then dx = 0 dy = 0 player.rotation = math.rad(0) end
    if love.keyboard.isDown("q") and love.keyboard.isDown("d") then dx = 0 dy = 0 player.rotation = math.rad(0) end
    
    player.posX = player.posX + dx * player.speed * dt
    player.posY = player.posY + dy * player.speed * dt
    
    
    if love.keyboard.isDown("escape") then -- exit game
        love.event.quit()
    end
end



function check_coll()
    if checkCollision(player.posX-(player.tileSize/2), player.posY-(player.tileSize/2),player.tileSize,player.tileSize,enemy.posX-(enemy.tileSize/2),enemy.posY-(enemy.tileSize/2),enemy.tileSize,enemy.tileSize) then
        enemy.posX = love.math.random(0, 1280)
        enemy.posY = love.math.random(0, 720)
        player.score = player.score+1
        -- jouer un son
        sfx:play()
    end
end


