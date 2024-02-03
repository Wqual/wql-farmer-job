ESX = exports.es_extended:getSharedObject()

local Raccolta = true
exports.ox_target:addBoxZone({
    coords = vector3(1952.0876, 4898.4248, 45.1273),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'ox:option2',
            icon = 'fa-brands fa-pagelines',
            label = "Collect vegetables",
            onSelect = function(data)
                if exports.ox_inventory:Search("count", "emptybag") < 1 then ESX.ShowNotification("You no longer have empty bags with you! Return to the starting point to refuel.") return end
                if exports.ox_inventory:Search("count", "farmer") < 1 then ESX.ShowNotification("You don't have a farmer's shovel with you!") return end
                if lib.progressBar({
                    duration = 3000,
                    label = 'Harvesting Vegetables',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                    },
                    anim = {
                        dict = 'mini@repair',
                        clip = 'fixing_a_ped'
                    },

                }) then
                    TriggerServerEvent("raccoltacampi")
                    
                    ESX.ShowNotification('Collection successful!')
                end
            end
        }
    }
})

exports.ox_target:addBoxZone({
    coords = vector3(1949.5959, 4900.9946, 45.1820),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'ox:option2',
            icon = 'fa-brands fa-pagelines',
            label = "Collect vegetables",
            onSelect = function(data)
                if exports.ox_inventory:Search("count", "emptybag") < 1 then ESX.ShowNotification("You no longer have empty bags with you! Return to the starting point to refuel.") return end
                if exports.ox_inventory:Search("count", "farmer") < 1 then ESX.ShowNotification("You don't have a farmer's shovel with you!") return end
                if lib.progressBar({
                    duration = 3000,
                    label = 'Harvesting Vegetables',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                    },
                    anim = {
                        dict = 'mini@repair',
                        clip = 'fixing_a_ped'
                    },

                }) then
                    TriggerServerEvent("raccoltacampi")
                    
                    ESX.ShowNotification('Collection successful!')
                end
            end
        }
    }
})

exports.ox_target:addBoxZone({
    coords = vector3(1942.9266, 4907.2935, 45.6561),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'ox:option2',
            icon = 'fa-brands fa-pagelines',
            label = "Collect vegetables",
            onSelect = function(data)
                if exports.ox_inventory:Search("count", "emptybag") < 1 then ESX.ShowNotification("You no longer have empty bags with you! Return to the starting point to refuel.") return end
                if exports.ox_inventory:Search("count", "farmer") < 1 then ESX.ShowNotification("You don't have a farmer's shovel with you!") return end
                if lib.progressBar({
                    duration = 3000,
                    label = 'Harvesting Vegetables',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                    },
                    anim = {
                        dict = 'mini@repair',
                        clip = 'fixing_a_ped'
                    },

                }) then
                    TriggerServerEvent("raccoltacampi")
                    
                    ESX.ShowNotification('Collection successful!')
                end
            end
        }
    }
})

exports.ox_target:addBoxZone({
    coords = vector3(1939.4169, 4910.9209, 46.0143),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'ox:option2',
            icon = 'fa-brands fa-pagelines',
            label = "Collect vegetables",
            onSelect = function(data)
                if exports.ox_inventory:Search("count", "emptybag") < 1 then ESX.ShowNotification("You no longer have empty bags with you! Return to the starting point to refuel.") return end
                if exports.ox_inventory:Search("count", "farmer") < 1 then ESX.ShowNotification("You don't have a farmer's shovel with you!") return end
                if lib.progressBar({
                    duration = 3000,
                    label = 'Harvesting Vegetables',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                    },
                    anim = {
                        dict = 'mini@repair',
                        clip = 'fixing_a_ped'
                    },

                }) then
                    TriggerServerEvent("raccoltacampi")
                    
                    ESX.ShowNotification('Collection successful!')
                end
            end
        }
    }
})
