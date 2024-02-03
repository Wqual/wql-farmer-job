ESX = exports.es_extended:getSharedObject()

-- Blip Map (Farmer Job Start)
Wql_farmer_job = AddBlipForCoord(2036.0699, 4732.8003, 40.6317, 298.8449)

SetBlipSprite(Wql_farmer_job, 655) -- https://docs.fivem.net/docs/game-references/blips/#blips
SetBlipScale(Wql_farmer_job, 0.8) -- Scale Blip
SetBlipColour(Wql_farmer_job, 31) -- https://docs.fivem.net/docs/game-references/blips/#blips
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Farmer Agency")  -- Name blip on MAP
EndTextCommandSetBlipName(Wql_farmer_job)


    -- Npc for the collection of work tools and car supplies
Citizen.CreateThread(function()
    if not HasModelLoaded('s_m_m_gaffer_01') then
       RequestModel('s_m_m_gaffer_01') -- https://docs.fivem.net/docs/game-references/ped-models/
       while not HasModelLoaded('s_m_m_gaffer_01') do
          Citizen.Wait(5)
       end
    end

npc = CreatePed(4, 's_m_m_gaffer_01', 2036.0699, 4732.8003, 40.6317, 298.8449, false, true)
FreezeEntityPosition(npc, true)
SetEntityInvincible(npc, true)
SetBlockingOfNonTemporaryEvents(npc, true)
 
    -- Start of tool collection
local StartFarmer = true
local Rifornimento = true
local options = {
    {
        name = 'ox:option1',
        onSelect = function()

            if Rifornimento == true then
                Wql_farmer_job() 
                Rifornimento = false 
                Wait(900000) -- Time milliseconds (15 minutes)
            elseif Rifornimento == false then
                ESX.ShowNotification("Please wait some time before refueling!")
            end
        end,
        icon = 'fa-solid fa-screwdriver-wrench',
        label = 'REQUEST TOOLS',
        canInteract = function(entity)
            return not IsEntityDead(entity)
        end
    },

    -- Start buying a car
    {
        name = 'ox:option2',
        onSelect = function()

            if exports.ox_inventory:Search("count", "money") < 2499 then ESX.ShowNotification("You don't have enough money!") return end
            if input then
                Wqual_farmer_car()
            end
            
            TriggerServerEvent("removemoney")
            DoScreenFadeOut(800)
            Wait(3000)
            print("vehicle spawned")
            DoScreenFadeIn(800)
            Wqual_farmer_car()
        end,
        icon = 'fa-solid fa-tractor',
        label = 'REQUEST VEHICLE (2500$)',
        canInteract = function(entity)
            return not IsEntityDead(entity)
        end
    }
}

-- Spawn car
Wqual_farmer_car = function()

    ESX.Game.SpawnVehicle('tractor2', vector3(2032.5443, 4751.0186, 41.1960), 280.29, function(v) -- https://docs.fivem.net/docs/game-references/vehicle-models/
        SetPedIntoVehicle(PlayerPedId(), v, -1)
    end)
    ESX.ShowNotification('Reach the camps indicated on the GPS.')
    waypoint5 = SetNewWaypoint(1949.1050, 4892.9102, 45.7022)
    Wql_farm = AddBlipForCoord(1949.1050, 4892.9102, 45.7022)
    SetBlipSprite (Wql_farm, 787)
    SetBlipDisplay(Wql_farm, 6)
    SetBlipScale  (Wql_farm, 0.8)
    SetBlipColour (Wql_farm, 2)
    SetBlipAsShortRange(Wql_farm, true)
    
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Agricultural fields")
    EndTextCommandSetBlipName(Wql_farm) 
end

exports.ox_target:addLocalEntity(npc,options)

end)


local StartFarmer = nil

Wql_farmer_job = function()

    local Ped = PlayerPedId()
    local input = lib.inputDialog('🐄 FARMER JOB 🐄', {
        {type = 'select', label = '🧿 START', options = {
            {label = "🧑🏽‍🌾 REQUEST TOOLS", value = "utensili"}            
        }},
    })

    if input and #input > 0 then
        TriggerServerEvent('Wql_farmer_job:start', input[1])
    end

end
