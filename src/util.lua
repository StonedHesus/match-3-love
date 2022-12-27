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

--[[
--	Given an atlas, a number of features, i.e. the number of different sprite grouping present within a row; a width and a hight, this function slices the given atlas 
--	into a table of tables of quads.
--
--	DO NOTE: That the main design behind the algorithm of this routine is similar to that of generateQuads.
]]
---@param atlas a love2d provided image type.
---@param numberOfFeaturesPerRow the number of distinct features by which the samples are catalogoued for each row.
---@param width the width of the quad which we are creating.
---@param height the height of the quad which we are creating.
---@return table? quads a table of tables containing the quads of all the sprites generated.
function generateGroupedQuads(atlas, numberOfFeaturesPerRow, width, height)
	local sheetX, sheetY = atlas:getWidth()/width, atlas:getHeight()/2

	local counter = 1
	local quads = {}

	local maxSampleCount = sheetX / numberOfFeaturesPerRow

	for y = 0, sheetY - 1
	do 
		local sampleIndex = 1
		quads[counter] = {} 

		for x = 0, sheetX - 1
		do 
			if sampleIndex == (maxSampleCount + 1) then 
				counter = counter + 1
				sampleIndex = 1
				quads[counter] = {}
			end
			quads[counter][sampleIndex] = love.graphics.newQuad(x * width, y * height, width, height, atlas:getDimensions())
			sampleIndex = sampleIndex + 1
		end

		counter = counter + 1
	end
	
	return quads
end
