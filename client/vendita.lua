local StartFarmer = false
local options = {

    {
        name = 'ox:option5',
        onSelect = function()
            local chechitem = exports.ox_inventory:Search('count', {"hay", "milkbucket", "sacktomatoes", "sackcarrot", "sackonion", "sackpotatoes"})
            if chechitem.hay >= 1 then
                TriggerServerEvent("vendita_prodotti_agricoli", "hay", 100)
            elseif chechitem.milkbucket >= 1 then
                TriggerServerEvent("vendita_prodotti_agricoli", "milkbucket", 400)
            elseif chechitem.sacktomatoes >= 1 then
                TriggerServerEvent("vendita_prodotti_agricoli", "sacktomatoes", 250)
            elseif chechitem.sackcarrot >= 1 then
                TriggerServerEvent("vendita_prodotti_agricoli", "sackcarrot", 250)
            elseif chechitem.sackonion >= 1 then
                TriggerServerEvent("vendita_prodotti_agricoli", "sackonion", 250)
            elseif chechitem.sackpotatoes >= 1 then
            TriggerServerEvent("vendita_prodotti_agricoli", "sackpotatoes", 250)
            else 
                ESX.ShowNotification("You don't have any agricultural products you can sell!")
            end
        end,
        icon = 'fa-solid fa-sack-dollar',
        label = 'Sell Products',
        canInteract = function(entity)
            return not IsEntityDead(entity)
        end
    },
    
}

Wqual_farmer_vendita = AddBlipForCoord(282.0486, 6789.1968, 14.695, 257.3148)

SetBlipSprite (Wqual_farmer_vendita, 272)
SetBlipDisplay(Wqual_farmer_vendita, 6)
SetBlipScale  (Wqual_farmer_vendita, 1.0)
SetBlipColour (Wqual_farmer_vendita, 65)
SetBlipAsShortRange(Wqual_farmer_vendita, true)
    
BeginTextCommandSetBlipName('STRING')
AddTextComponentString("Delivery of agricultural products")
EndTextCommandSetBlipName(Wqual_farmer_vendita) 

Citizen.CreateThread(function()
    if not HasModelLoaded('cs_lestercrest') then
       RequestModel('cs_lestercrest')
       while not HasModelLoaded('cs_lestercrest') do
          Citizen.Wait(5)
       end
    end

npc = CreatePed(4, 'cs_lestercrest', 282.0486, 6789.1968, 14.6950, 257.3148, false, true)
FreezeEntityPosition(npc, true)
SetEntityInvincible(npc, true)
SetBlockingOfNonTemporaryEvents(npc, true)


exports.ox_target:addLocalEntity(npc,options)

end)