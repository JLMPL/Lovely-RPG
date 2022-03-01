-- config

config = {
    display = {
        width = 1600,
        height = 900
    },
    canvas = {
        width = 640,
        height = 360
    }
}

function love.conf(conf)
    conf.title = "Lovely RPG"
    conf.version = "11.4"
    conf.console = true
    conf.window.width = config.display.width
    conf.window.height = config.display.height
    conf.window.fullscreen = false
end
