Board = class{}
require 'src.game-components.brick.Brick'

tile_dimensions = {
    width = 32,
    height = 32
}

function Board:init(builder)
    self.x = builder.x
    self.y = builder.y
    self.width = builder.width 
    self.height = builder.height
    self.matches = {}
    self.bricks = self:setup(builder)
end

function Board:getX()
    return self.x
end

function Board:getY()
    return self.y
end

function Board:setup(builder)
    local bricks = {}
    for y = 1, builder.height do
        bricks[y] = {}
        for x = 1, builder.width do
            bricks[y][x] = BrickBuilder((x - 1) * tile_dimensions.width, (y - 1) * tile_dimensions.height):setTier(math.random(1, 6)):setSkin(math.random(1, 18)):build()
        end
    end
    return bricks
end

function Board:draw()
    for y = 1, #self.bricks do
        for x = 1, #self.bricks[1] do
            self.bricks[y][x]:draw(self.x, self.y)
        end
    end
end

Builder = class{}

local DEFAULT_WIDTH = 8
local DEFAULT_HEIGHT = 8

--- Creates a new BoardBuilder, with the provided x and y coordinates for the board.
---@param x number
---@param y number
function Builder:init(x, y)
    -- Required values.
    self.x = x 
    self.y = y
    -- Optional values. 
    self.width = DEFAULT_WIDTH
    self.height = DEFAULT_HEIGHT
end

function Builder:setWidth(width)
    self.width = width
    return self
end

function Builder:setHeight(height)
    self.height = height
    return self
end

function Builder:build()
    return Board(self)
end