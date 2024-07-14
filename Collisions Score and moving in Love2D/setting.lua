
-- informations joueur (taille et position)
player = {}
player.tileSize = 96
player.posX = 0
player.posY = 0
player.speed = 450
player.rotation = math.rad(0)
player.score = 0
player.img = love.graphics.newImage("assets/images/spaceship2.png")

-- informations ennemi (taille et position)
enemy = {}
enemy.tileSize = 64
enemy.posX = 512
enemy.posY = 256
enemy.rotation = math.rad(0)
enemy.img = love.graphics.newImage("assets/images/Dragon.png")

-- images
background = love.graphics.newImage("assets/images/background.jpeg")

-- font
font = love.graphics.newFont(20) -- Aucune font chargée, simplement celle de base en taille 20

-- sounds
love.audio.setVolume(0.25)
sfx = love.audio.newSource("assets/sfx/collision.wav", "static")

map = {}
-- Grille du jeu (20 * 64 de largeur et 12 * 64)
map.width = 20
map.height = 12
-- indique sur quel écran on se trouve
map.scene = "Menu"
