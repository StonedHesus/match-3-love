--[[
--  This here Lua compilation unit contains a base abstract model for the state type, which  
--  each subsequent state introduce in the application will inherit from, thus providing a 
--  specialised type of the state, addressing a particular aspect of our software.
--]]

State = class{}

function State:init() end
function State:enter() end 
function State:exit() end
---@param deltaTime number
function State:update(deltaTime) end
function State:render() end