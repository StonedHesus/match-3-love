require 'src.states.model.State'

StartState = class{__includes = State}

function StartState:init()
    self.menuIndex = 1
    self.menu = {
        "Start",
        "Quit"
    }
end

function StartState:update(deltaTime)
    if love.keyboard.wasPressed('up') then 
        if self.menuIndex == 1 then 
            self.menuIndex = #self.menu
        else 
            self.menuIndex = self.menuIndex - 1
        end
    end

    if love.keyboard.wasPressed('down') then 
        if self.menuIndex == #self.menu then 
            self.menuIndex = 1
        else 
            self.menuIndex = self.menuIndex + 1
        end
    end

    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then 
        if self.menuIndex == 1 then 
            gStateMachine:change('play')
        elseif self.menuIndex == 2 then 
            love.event.quit()
        end
    end
end

function StartState:render()
    love.graphics.setColor(0, 0, 0, 128/255)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    love.graphics.setColor(1, 1, 1, 128/255)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 76, 20, 150, 58, 6)
    love.graphics.printf(GAME_TITLE, VIRTUAL_WIDTH / 2 - 186 / 2, 40, 186, 'center')
    love.graphics.setColor(255, 255, 255, 1)

    love.graphics.setColor(1, 1, 1, 128/255)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 76, VIRTUAL_HEIGHT / 2 + 12, 150, 58, 6)
    love.graphics.setColor(255, 255, 255, 1)
    for index, value in ipairs(self.menu) do
        if index == self.menuIndex then 
            love.graphics.setColor(99/255, 155/255, 1, 1)
        else
            love.graphics.setColor(48/255, 96/255, 130/255, 1)
        end
        love.graphics.printf(value, VIRTUAL_WIDTH / 2 - 186 / 2,  VIRTUAL_HEIGHT / 2 + (index * 20), 186, 'center')
        love.graphics.setColor(255, 255, 255, 1)
    end


end