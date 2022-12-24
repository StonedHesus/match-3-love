--[[
--	This here Lua compilation unit contains all the utilities routines which our application will utilise.
--	It is important to note, that the presence of a utilities module is due to the fact that none of these routines are particularly linked to any specific
--	object within the game, rather they are utilised by different objects at different times so as to achieve their desired effects, hence so as enhance code 
--	cohesion, and implicitly reduce the coupling of the code, this here module was designed.
--
--	Author: Andrei-Paul Ionescu
--]]

--[[
--	Provided with an atlas, a width, and a height, this here routine generates a table of quads, each of which being of dimension (width, height).
--]]
function generateQuads(atlas, width, height)
	local sheetX, sheetY = atlas:getWidth()/width, atlas:getHeight()/2

	local counter = 1
	local quads = {}

	for y = 0, sheetY - 1
	do
		for x = 0, sheetX - 1
		do
			quads[counter] = love.graphics.newQuad(x * width, y * height, width, height, atlas:getDimensions())
			counter = counter + 1
		end
	end

	return quads
end

