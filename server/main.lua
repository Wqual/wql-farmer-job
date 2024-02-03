ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('Wql_farmer_job:start')
AddEventHandler('Wql_farmer_job:start', function(value)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if value == 'utensili' then
        if xPlayer.addInventoryItem('farmer', 1) then
            xPlayer.addInventoryItem('emptybucket', 10)
            xPlayer.addInventoryItem('emptybag', 10)

            local xPlayer = ESX.GetPlayerFromId(source)

        end
    end
end)

RegisterNetEvent("removemoney", function ()
    
    local item = {"money"}
    exports.ox_inventory:RemoveItem(source, item[math.random(#item)], math.random(2499, 2500))
end)


local ox_inventory = exports.ox_inventory

RegisterNetEvent("raccoltacampi", function ()

    if ox_inventory:RemoveItem(source, 'emptybag', 1) then

        local item = {"sackpotatoes", "sackonion", "sackcarrot", "sacktomatoes"}
        exports.ox_inventory:AddItem(source, item[math.random(#item)], math.random(1, 3)) -- Function random 1,3 give other sack

    else
        
    end

end)

RegisterNetEvent("mungitura", function ()

    if ox_inventory:RemoveItem(source, 'emptybucket', 1) then

        local item = {"milkbucket"}
        exports.ox_inventory:AddItem(source, item[math.random(#item)], math.random(1, 3)) -- Function random 1,3 give item SECHHIO DI LATTE

    else
        
    end

end)

RegisterNetEvent("fieno", function ()

    local item = {"hay"}
    exports.ox_inventory:AddItem(source, item[math.random(#item)], math.random(3, 9)) -- Function random 3,9 give item FIENO

end)

RegisterNetEvent("vendita_prodotti_agricoli", function(item, importo)

    exports.ox_inventory:RemoveItem(source, item, 1)
    exports.ox_inventory:AddItem(source, "money", importo)

end)

