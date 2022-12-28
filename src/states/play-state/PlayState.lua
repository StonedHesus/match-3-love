require 'src.states.model.State'
require 'src.game-components.board.Board'

PlayState = class{__includes = State}

local highlight = false

function PlayState:init()
    self.board = Builder():build()
    self.highlightedX = 1
    self.highlightedY = 1
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
    love.graphics.rectangle('line', (self.highlightedX - 1) * tile_dimensions.width, (self.highlightedY - 1) * tile_dimensions.height, tile_dimensions.width, tile_dimensions.height)

    love.graphics.setColor(255, 255, 255, 0.7)

    if highlight then 
        love.graphics.rectangle('fill', (self.highlightedX - 1) * (tile_dimensions.width) , (self.highlightedY - 1) * (tile_dimensions.height), tile_dimensions.width, tile_dimensions.height)
    end
    love.graphics.setColor(255, 255, 255, 1)
end