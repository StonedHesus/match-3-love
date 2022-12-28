--[[
--	This here Lua compilation unit contains but another anti-pattern, which is a global dependencies file.
--	Within this dependencies file, all the required external libraries are to be stored. In addition to that, all the 
--	requirements from within our code are to be placed here, and hence all modules are to require the dependecy file, as oppossed to 
--	requiring only those file that it needs.
--	This design reduces the likelyhood of a conflict between the requirement calls.
--]]

-- External libraries used throughout the project.
push = require 'lib.push'
timer = require 'lib.knife.timer'
class = require 'lib.class'


-- Require statements for our own units.
require 'src.constants'
require 'src.util'
require 'src.state-machine.StateMachine'

-- Global tables.
gGraphics = {
    ['main'] = love.graphics.newImage('graphics/match3.png'),
}

gSprites = {
    ['tiles'] = generateGroupedQuads(gGraphics['main'], 2, 32, 32),
}