--[[
--  This here Lua compilation unit contains a collection of two classes.
--  One of which being the Brick class, after which the unit is named,
--  the other is a Builder class which is utilised within the creation of 
--  a Brick object; this architecture defines the builder design pattern,
--  see the gang of four [Gamma95]. 
--]]
Brick = class{}

---@param builder Builder 
function Brick:init(builder)
    self.x = builder.x 
    self.y = builder.y
    self.tier = builder.tier
    self.skin = builder.skin
end

function Brick:draw()
    love.graphics.draw(gGraphics['main'], gSprites['tiles'][self.skin][self.tier], self.x, self.y)
end

Builder = class{}

--- This here routine is the constructor of the Builder type, it takes in 
--- the two carthesian coordinates which will determine where the brick object 
--- will be placed, and it assumes that by default the tier, and the skin of the 
--- brick are both set to one.
---@param x number 
---@param y number
function Builder:init(x, y)
    self.x = x
    self.y = y 

    -- Default tier value.
    self.tier = 1
    -- Default skin value.
    self.skin = 1
end

--- This here routine belongs to the Builder type, and its role is to set the tier 
--- to the provided value and then return a reference to the current builder object. 
---@param tier number
---@return Builder
function Builder:setTier(tier)
    self.tier = tier
    return self
end

--- This here routine belongs to the Builder type, and its role is to set the skin 
--- to the provided value and then return a reference to the current builder object. 
---@param skin number
---@return Builder
function Builder:setSkin(skin)
    self.skin = skin
    return self
end

--- This here routine is responsible for building the Brick object from the values 
--- which are specified and stored within the builder object which invoked this routine.
---@return Brick
function Builder:build()
    return Brick(self)
end
