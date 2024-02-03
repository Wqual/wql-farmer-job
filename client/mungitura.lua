ESX = exports.es_extended:getSharedObject()

Citizen.CreateThread(function()
    if not HasModelLoaded('a_c_cow') then
       RequestModel('a_c_cow')
       while not HasModelLoaded('a_c_cow') do
          Citizen.Wait(5)
       end
    end

npc = CreatePed(4, 'a_c_cow', 2259.5337, 4902.0967, 39.8191, 200.0120, false, true)
npc = CreatePed(4, 'a_c_cow', 2256.9836, 4899.2378, 39.8180, 249.6898, false, true)
npc = CreatePed(4, 'a_c_cow', 2256.5818, 4906.7275, 39.7806, 51.7439, false, true)
npc = CreatePed(4, 'a_c_cow', 2252.5193, 4902.8740, 39.7458, 67.0778, false, true) 
FreezeEntityPosition(npc, true)
SetEntityInvincible(npc, true)
SetBlockingOfNonTemporaryEvents(npc, true)

local StartFarmer = true
local options = {
    {
        name = 'ox:option1',
        onSelect = function()
            Wqual_farmer_cow() 
        end,
        icon = 'fa-solid fa-cow',
        label = 'MILKING OF CATTLE',
        canInteract = function(entity)
            return not IsEntityDead(entity)
        end
    }
}

Citizen.CreateThread(function()
    if not HasModelLoaded('s_m_m_gardener_01') then
       RequestModel('s_m_m_gardener_01')
       while not HasModelLoaded('s_m_m_gardener_01') do
          Citizen.Wait(5)
       end
    end

npc = CreatePed(4, 's_m_m_gardener_01', 1961.8722, 4890.8579, 43.9987, 41.8130, false, true)
FreezeEntityPosition(npc, true)
SetEntityInvincible(npc, true)
SetBlockingOfNonTemporaryEvents(npc, true)

Wqual_farmer_cow = function()

    ESX.ShowNotification('Reach the vehicle and head towards the cattle farms.')
    waypoint5 = SetNewWaypoint(2256.3650, 4902.6772, 40.7747)
    Wqual_farmer_mucca = AddBlipForCoord(2256.3650, 4902.6772, 40.7747)
    SetBlipSprite (Wqual_farmer_mucca, 479)
    SetBlipDisplay(Wqual_farmer_mucca, 6)
    SetBlipScale  (Wqual_farmer_mucca, 0.8)
    SetBlipColour (Wqual_farmer_mucca, 45)
    SetBlipAsShortRange(Wqual_farmer_mucca, true)
    
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Cattle Breeding")
    EndTextCommandSetBlipName(Wqual_farmer_mucca) 
end

exports.ox_target:addLocalEntity(npc,options)

end)


local Mungitura = true

exports.ox_target:addBoxZone({
    coords = vector3(2259.5337, 4902.0967, 40.8191),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'ox:option2',
            icon = 'fa-solid fa-cow',
            label = "Milk Cattle",
            onSelect = function(data)
                if exports.ox_inventory:Search("count", "emptybucket") < 1 then ESX.ShowNotification("You no longer have empty buckets with you! Return to the starting point to refuel.") return end
                if lib.progressBar({
                    duration = 3000,
                    label = 'Milking Cow',
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
                    TriggerServerEvent("mungitura")
                    
                    ESX.ShowNotification('Milking successful!')
                end
            end
        }
    }
})

exports.ox_target:addBoxZone({
    coords = vector3(2256.9836, 4899.2378, 40.8180),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'ox:option3',
            icon = 'fa-solid fa-cow',
            label = "Milk Cattle",
            onSelect = function(data)
                if exports.ox_inventory:Search("count", "emptybucket") < 1 then ESX.ShowNotification("You no longer have empty buckets with you! Return to the starting point to refuel.") return end
                if lib.progressBar({
                    duration = 3000,
                    label = 'Milking Cow',
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
                    TriggerServerEvent("mungitura")
                    
                    ESX.ShowNotification('Milking successful!')
                end
            end
        }
    }
})

exports.ox_target:addBoxZone({
    coords = vector3(2256.5818, 4906.7275, 40.7806),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'ox:option4',
            icon = 'fa-solid fa-cow',
            label = "Milk Cattle",
            onSelect = function(data)
                if exports.ox_inventory:Search("count", "emptybucket") < 1 then ESX.ShowNotification("You no longer have empty buckets with you! Return to the starting point to refuel.") return end
                if lib.progressBar({
                    duration = 3000,
                    label = 'Milking Cow',
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
                    TriggerServerEvent("mungitura")
                    
                    ESX.ShowNotification('Milking successful!')
                end
            end
        }
    }
})

exports.ox_target:addBoxZone({
    coords = vector3(2252.5193, 4902.8740, 40.7458),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'ox:option5',
            icon = 'fa-solid fa-cow',
            label = "Milk Cattle",
            onSelect = function(data)
                if exports.ox_inventory:Search("count", "emptybucket") < 1 then ESX.ShowNotification("You no longer have empty buckets with you! Return to the starting point to refuel.") return end
                if lib.progressBar({
                    duration = 3000,
                    label = 'Milking Cow',
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
                    TriggerServerEvent("mungitura")
                    
                    ESX.ShowNotification('Milking successful!')
                end
            end
        }
    }
})

end)