-- config

config = {
    display = {
        width = 640 * 3,
        height = 360 * 3
    },
    canvas = {
        width = 640,
        height = 360
    }
}

config.scale = {
    x = math.floor(config.display.width / config.canvas.width),
    y = math.floor(config.display.height / config.canvas.height)
}

function love.conf(conf)
    conf.title = "Lovely RPG"
    conf.version = "11.4"
    conf.console = true
    conf.window.width = config.display.width
    conf.window.height = config.display.height
    conf.window.fullscreen = false
end
