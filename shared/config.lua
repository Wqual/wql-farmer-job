Config = {

    Notification = {
        Enable = true,

        Type = "ESX",
        String = "Work started successfully! Head to the house to continue."        

    }

}

RegisterNetEvent('Wql_farmer_job:notify')
AddEventHandler('Wql_farmer_job:notify', function(source)
    if Config.Notification.Type == 'ESX' then
        ESX = exports['es_extended']:getSharedObject()
        ESX.ShowNotification(Config.Notification.String)
    elseif Config.Notification.Type == 'OKOK' then
        exports['okokNotify']:Alert("Notification", Config.Notification.String, 3000, 'information', playSound)
    elseif Config.Notification.Type == 'OXLIB' then
        lib.notify({
            title = "Notification",
            description = Config.Notification.String,
            type = 'inform'
        })
    elseif Config.Notification.Type == 'CUSTOM' then
        print('[WARNING] Imposta la tua notifica in shared/config.lua') 

    else
        print('[ERRORE] Il tipo di notifica non è valido')
    end
end)