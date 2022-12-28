StateMachine = class{}

---@param states table<string, function>
function StateMachine:init(states)
    -- The empty state is a state that does nothing. It is used as a default state.
    -- It is important to note, that the state machine object holds a reference to the empty 
    -- state, and subsequently each new state machine object will behave similarly, chiefly 
    -- due to the lack of class side variables in Lua.
    -- In our application's case, since we mimic a singleton pattern, this will act as a cache 
    -- for the empty state, hence, producing no overhead or side effects.
    self.empty = {
        render = function() end,
        update = function() end,
        enter = function() end,
        exit = function() end
    }
    self.states = states or {}
    self.current = self.empty
end

--- Attempts to change the current state to the state indicated by the first formal argument of the 
--- routine, in the case in which that state exists within the state machine, then we proced to 
--- exit the current state, and enter the new state, passing the second formal argument of the function
--- to the new state's enter method; in case of failure, that is, in case the state name is not 
--- defined this method will halt the execution of the program.
---@param state_name string
---@param params any
function StateMachine:change(state_name, params)
    assert(self.states[state_name])
    self.current:exit()
    self.current = self.states[state_name]()
    self.current:enter(params)
end

---@param deltaTime number
function StateMachine:update(deltaTime)
    self.current:update(dt)
end

function StateMachine:render()
    self.current:render()
end

