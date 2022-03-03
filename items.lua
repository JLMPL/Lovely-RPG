
items = {
    rusty_dagger = {
        name = 'Rusty Dagger',
        type = 'melee',
        icon = love.graphics.newImage("data/images/itm_dagger.png"),

        req_strength = 1,
        physical_damage = 1,

        value = 1
    },
    health_potion = {
        name = 'Health Potion',
        type = 'food',
        icon = love.graphics.newImage("data/images/itm_potion_red.png"),

        heal = 10,

        value = 50
    },
    rusty_plate_armor = {
        name = 'Rusty Plate Armor',
        type = 'armor',
        icon = love.graphics.newImage("data/images/itm_armor_plate.png"),

        req_strength = 3,
        physical_defence = 5,

        value = 25
    }
}
