ESX = exports.es_extended:getSharedObject()

local StartFarmer = true
local options = {

    {
        name = 'ox:option4',
        onSelect = function()
            Wqual_farmer_fieno() 
        end,
        icon = 'fa-solid fa-horse',
        label = 'HAY BALES',
        canInteract = function(entity)
            return not IsEntityDead(entity)
        end
    },
    
}

Citizen.CreateThread(function()
    if not HasModelLoaded('cs_manuel') then
       RequestModel('cs_manuel')
       while not HasModelLoaded('cs_manuel') do
          Citizen.Wait(5)
       end
    end

npc = CreatePed(4, 'cs_manuel', 2264.8770, 4902.5894, 39.9285, 316.9765, false, true)
FreezeEntityPosition(npc, true)
SetEntityInvincible(npc, true)
SetBlockingOfNonTemporaryEvents(npc, true)

Wqual_farmer_fieno = function()

    ESX.ShowNotification('Reach the vehicle and head to the hay fields.')
    waypoint5 = SetNewWaypoint(2433.1794, 4774.9209, 36.0869)
    Wqual_farmer_fien = AddBlipForCoord(2433.1794, 4774.9209, 36.0869)
    SetBlipSprite (Wqual_farmer_fien, 478)
    SetBlipDisplay(Wqual_farmer_fien, 6)
    SetBlipScale  (Wqual_farmer_fien, 0.8)
    SetBlipColour (Wqual_farmer_fien, 73)
    SetBlipAsShortRange(Wqual_farmer_fien, true)
    
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Hay harvesting")
    EndTextCommandSetBlipName(Wqual_farmer_fien) 
end

exports.ox_target:addLocalEntity(npc,options)

end)

local Fieno = true

exports.ox_target:addBoxZone({
    coords = vector3(2434.5144, 4772.7183, 34.2138),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'ox:option4',
            icon = 'fa-solid fa-horse',
            label = "Collect Hay",
            onSelect = function(data)
                if exports.ox_inventory:Search("count", "farmer") < 1 then ESX.ShowNotification("You don't have a shovel with you! Return to the starting point to refuel.") return end
                if lib.progressBar({
                    duration = 3000,
                    label = 'Harvesting Hay',
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
                    TriggerServerEvent("fieno")
                    
                    ESX.ShowNotification('Collection successful')
                end
            end
        }
    }
})

exports.ox_target:addBoxZone({
    coords = vector3(2436.2329, 4775.7773, 34.2542),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'ox:option4',
            icon = 'fa-solid fa-horse',
            label = "Collect Hay",
            onSelect = function(data)
                if exports.ox_inventory:Search("count", "farmer") < 1 then ESX.ShowNotification("You don't have a shovel with you! Return to the starting point to refuel.") return end
                if lib.progressBar({
                    duration = 3000,
                    label = 'Harvesting Hay',
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
                    TriggerServerEvent("fieno")
                    
                    ESX.ShowNotification('Collection successful')
                end
            end
        }
    }
})

