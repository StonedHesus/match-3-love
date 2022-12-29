require 'src.states.model.State'
require 'src.game-components.board.Board'

PlayState = class{__includes = State}

local highlight = false

function PlayState:init()
    self.board = Builder(VIRTUAL_WIDTH - 272, 16):build()
    self.highlightedX = 1
    self.highlightedY = 1

    self.level = 1
    self.score = 0
    self.goal = 1000
    self.time = 60
end

function PlayState:update(deltaTime)
    if love.keyboard.wasPressed('left') then 
        self.highlightedX = math.max(1, self.highlightedX - 1)
    elseif love.keyboard.wasPressed('right') then
        self.highlightedX = math.min(self.board.width, self.highlightedX + 1)
    end

    if love.keyboard.wasPressed('up') then 
        self.highlightedY = math.max(1, self.highlightedY - 1)
    elseif love.keyboard.wasPressed('down') then
        self.highlightedY = math.min(self.board.height, self.highlightedY + 1)
    end

    if love.keyboard.wasPressed('return') then 
        highlight = not highlight
    end
end

function PlayState:render()
    self.board:draw()
    love.graphics.setLineWidth(2)
    love.graphics.setColor(255, 0, 0, 1)
    love.graphics.rectangle('line', (self.highlightedX - 1) * tile_dimensions.width + self.board:getX(), (self.highlightedY - 1) * tile_dimensions.height + self.board:getY(), tile_dimensions.width, tile_dimensions.height)

    love.graphics.setColor(255, 255, 255, 0.7)

    if highlight then 
        love.graphics.rectangle('fill', (self.highlightedX - 1) * (tile_dimensions.width) , (self.highlightedY - 1) * (tile_dimensions.height), tile_dimensions.width, tile_dimensions.height)
    end
    love.graphics.setColor(255, 255, 255, 1)

    love.graphics.setColor(56/255, 56/255, 56/255, 234/255)
    love.graphics.rectangle('fill', 16, 16, 186, 116, 4)
    love.graphics.setColor(255, 255, 255, 1)

    love.graphics.setColor(99/255, 155/255, 1, 1)
    love.graphics.printf('Level: ' .. tostring(self.level), 20, 24, 182, 'center')
    love.graphics.printf('Score: ' .. tostring(self.score), 20, 52, 182, 'center')
    love.graphics.printf('Goal: ' .. tostring(self.score), 20, 80, 182, 'center')
    love.graphics.printf('Time: ' .. tostring(self.time), 20, 108, 182, 'center')
    love.graphics.setColor(255, 255, 255, 1)
end