local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('dvall', function(source, args, rawCommand)
    local Player = QBCore.Functions.GetPlayer(source)

    if source == 0 or (Player and (QBCore.Functions.HasPermission(source, "admin") or QBCore.Functions.HasPermission(source, "god"))) then
        
        -- 30 seconds before announce
        ExecuteCommand('announce 30 Saniye Sonra Şehirdeki Bütün Sahipsiz Araçlar Çekilecektir.')

        -- 15 seconds after second annnounce
        SetTimeout(15000, function()
            ExecuteCommand('announce 15 Saniye Sonra Şehirdeki Bütün Sahipsiz Araçlar Çekilecektir.')
        end)

        -- 30 seconds after all cars delete
        SetTimeout(30000, function()
            TriggerClientEvent('deleteAllVehicles', -1)
            ExecuteCommand('announce Şehirdeki Bütün Araçlar Çekilmiştir.')
            print('Tüm araçlar silindi ve duyuru gönderildi.')
        end)

    else
        TriggerClientEvent('chat:addMessage', source, {
            args = { '^1Hata', 'Bu komutu kullanmak için yetkiniz yok!' }
        })
    end
end, false)
