Board = class{}
require 'src.game-components.brick.Brick'

tile_dimensions = {
    width = 32,
    height = 32
}

function Board:init(builder)
    self.width = builder.width 
    self.height = builder.height
    self.matches = {}
    self.bricks = self:setup(builder)
end

function Board:setup(builder)
    local bricks = {}
    for y = 1, builder.height do
        bricks[y] = {}
        for x = 1, builder.width do
            bricks[y][x] = BrickBuilder((x - 1) * tile_dimensions.width, (y - 1) * tile_dimensions.height):setTier(math.random(1, 3)):setSkin(math.random(1, 5)):build()
        end
    end
    return bricks
end

function Board:draw()
    for y = 1, #self.bricks do
        for x = 1, #self.bricks[1] do
            self.bricks[y][x]:draw()
        end
    end
end

Builder = class{}

local DEFAULT_WIDTH = 8
local DEFAULT_HEIGHT = 8

function Builder:init()
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