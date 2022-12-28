require 'src.dependencies'

love.graphics.setDefaultFilter('nearest', 'nearest')

function love.load()
    gStateMachine = StateMachine {
    }

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true,
        canvas = true
    })
end

function love.update(deltaTime)
end

function love.resize(width, height)
    push:resize(width, height)
end

function love.draw()
    push:start()
    love.graphics.clear(40 / 255, 45 / 255, 52 / 255, 255 / 255)
    love.graphics.printf('Hello, World!', 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')
    push:finish()
end
