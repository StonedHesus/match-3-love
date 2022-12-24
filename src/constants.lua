--[[
--  This here Lua compilation unit contains a collection of constants which are utilised throughout the software. 
--  Since these constants do not particularly belong to any of the components we are going to create and manipulate throughout the software,
--  they are going to be stored within this unit, despite the fact that this creates an anti-pattern dependency within our code. 
--  Due to Lua's lack of support for interfaces, such as the one present in Java, we would be better off by using this here anti-pattern,
--  for by doing so, we reduce the likelyhood of coupling, since we don't need to store a reference to an object that stores one of these constants.
--
--  Author: Andrei-Paul Ionescu
--]]

GAME_TITLE = "Match 3"
