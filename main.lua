require 'src.dependencies'

local showFPS = true
local backgroundX = 0
local scrollVelocity = 80

function love.load()
    gStateMachine = StateMachine {
        ['play'] = function() return PlayState() end   
    }

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true,
        canvas = true
    })

    love.keyboard.pressedKeys = {}

    gStateMachine:change('play')
end

function love.keypressed(key)
    if key == 'f' then 
        showFPS = not showFPS
    else 
        love.keyboard.pressedKeys[key] = true
    end
end

function love.keyboard.wasPressed(key)
    return love.keyboard.pressedKeys[key]
end

function love.update(deltaTime)
    if backgroundX <= -gGraphics['background']:getWidth() + VIRTUAL_WIDTH - 4 + 51 then 
        backgroundX = 0
    end
    backgroundX = backgroundX - scrollVelocity * deltaTime
    gStateMachine:update(deltaTime)
    love.keyboard.pressedKeys = {}
end

function love.resize(width, height)
    push:resize(width, height)
end

function love.draw()
    push:start()
    -- Since all states share the same background, we can draw it here, and solely here.
    love.graphics.draw(gGraphics['background'], backgroundX, 0)
    
    gStateMachine:render()
    
    if showFPS then 
        love.graphics.setColor(0, 255, 0, 1)
        love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 2, 2)
        love.graphics.setColor(255, 255, 255, 1)
    end

    push:finish()
end
